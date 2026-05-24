#include "ymodem.h"

#include "crc_utils.h"
#include "ROM.h"

#include <stdlib.h>

#define YMODEM_HEAD_WAIT_MS      1000U
#define YMODEM_HEAD_RETRY_MAX    180U

volatile uint32_t ymodem_debug_expect = 0U;
volatile uint32_t ymodem_debug_recv = 0U;
volatile uint32_t ymodem_debug_last_len = 0U;
volatile uint32_t ymodem_debug_last_seq = 0U;
volatile uint32_t ymodem_debug_raw_len = 0U;
volatile uint32_t ymodem_debug_bad = 0U;

typedef enum {
    YMODEM_STATE_HEAD = 0U,
    YMODEM_STATE_DATA,
    YMODEM_STATE_EOT,
    YMODEM_STATE_END
} ymodem_state_t;

typedef struct {
    uint8_t code;
    uint8_t seq;
    const uint8_t *data;
    uint32_t data_len;
} ymodem_frame_t;

static void ymodem_send_byte(uint8_t byte)
{
    uint16_t tmp = byte;
    USART1_SendData(&tmp, 1U);
}

static void ymodem_delay_ms(uint32_t ms)
{
    uint32_t start = GetTick();

    while ((GetTick() - start) < ms) {
    }
}

static bool ymodem_wait_frame(uint8_t *buf, uint16_t *len, uint32_t timeout_ms)
{
    uint32_t start = GetTick();

    while (usart1_rx_flag == 0U) {
        if ((GetTick() - start) >= timeout_ms) {
            return false;
        }
    }

    __disable_irq();
    *len = usart1_rx_len;
    if (*len >= MYDMA_USART1_RX_BUF_LEN) {
        *len = MYDMA_USART1_RX_BUF_LEN - 1U;
    }
    memcpy(buf, (const void *)usart1_rx_buffer, *len);
    USART1_ClearRxBuf();
    __enable_irq();

    return true;
}

static void ymodem_parse_header(const uint8_t *data, uint32_t len, boot_image_info_t *info)
{
    uint32_t i = 0U;
    uint32_t j = 0U;
    char size_buf[24];

    memset(info, 0, sizeof(*info));
    memset(size_buf, 0, sizeof(size_buf));

    while ((i < len) && (data[i] != 0U) && (i < sizeof(info->name) - 1U)) {
        info->name[i] = (char)data[i];
        i++;
    }

    while ((i < len) && (data[i] == 0U)) {
        i++;
    }

    while ((i < len) && (data[i] != 0U) && (j < sizeof(size_buf) - 1U)) {
        size_buf[j++] = (char)data[i++];
    }

    info->size = (uint32_t)strtoul(size_buf, NULL, 10);
}

static bool ymodem_validate_frame(const uint8_t *buf, uint16_t len, ymodem_frame_t *frame)
{
    uint32_t packet_len;
    uint16_t frame_crc;

    if ((buf[0] != YMODEM_HEAD_SOH) && (buf[0] != YMODEM_DATA_STX)) {
        ymodem_debug_bad = 1U;
        return false;
    }

    frame->code = buf[0];
    frame->data_len = (buf[0] == YMODEM_DATA_STX) ? YMODEM_PACKET_1K : YMODEM_PACKET_128;
    packet_len = frame->data_len + YMODEM_FRAME_OVERHEAD;

    if (len < packet_len) {
        ymodem_debug_bad = 2U;
        return false;
    }

    if ((uint8_t)(buf[1] ^ buf[2]) != 0xFFU) {
        ymodem_debug_bad = 3U;
        return false;
    }

    frame_crc = (uint16_t)(((uint16_t)buf[packet_len - 2U] << 8) | buf[packet_len - 1U]);
    if (crc16_ccitt(&buf[3], frame->data_len) != frame_crc) {
        ymodem_debug_bad = 4U;
        return false;
    }

    frame->seq = buf[1];
    frame->data = &buf[3];
    return true;
}

boot_status_t ymodem_receive_image(uint32_t addr, uint32_t max_size, boot_image_info_t *info)
{
    static uint8_t raw[MYDMA_USART1_RX_BUF_LEN];
    ymodem_state_t state = YMODEM_STATE_HEAD;
    uint32_t seq = 1U;
    uint32_t recv_size = 0U;
    uint32_t expect_size = 0U;
    uint32_t crc = 0xFFFFFFFFU;
    uint32_t head_retry = 0U;

    if (!ROM_erase_range(addr, max_size)) {
        return BOOT_STATUS_FLASH;
    }

    ymodem_debug_expect = 0U;
    ymodem_debug_recv = 0U;
    ymodem_debug_last_len = 0U;
    ymodem_debug_last_seq = 0U;
    ymodem_debug_raw_len = 0U;
    ymodem_debug_bad = 0U;

    USART1_ClearRxBuf();
    ymodem_send_byte(YMODEM_CRC_REQ);

    while (state != YMODEM_STATE_END) {
        ymodem_frame_t frame;
        uint16_t len = 0U;

        uint32_t wait_ms = (state == YMODEM_STATE_HEAD) ? YMODEM_HEAD_WAIT_MS : YMODEM_TIMEOUT_MS;

        if (!ymodem_wait_frame(raw, &len, wait_ms)) {
            if ((state == YMODEM_STATE_HEAD) && (get_usart1_rx_len() != 0U)) {
                continue;
            }

            if ((state == YMODEM_STATE_HEAD) && (head_retry++ < YMODEM_HEAD_RETRY_MAX)) {
                ymodem_send_byte(YMODEM_CRC_REQ);
                continue;
            }
            return BOOT_STATUS_TIMEOUT;
        }

        if ((len >= 2U) && (raw[0] == YMODEM_CAN) && (raw[1] == YMODEM_CAN)) {
            return BOOT_STATUS_CANCEL;
        }

        if ((len == 1U) && (raw[0] == YMODEM_EOT)) {
            if (state == YMODEM_STATE_DATA) {
                ymodem_send_byte(YMODEM_NAK);
                state = YMODEM_STATE_EOT;
            } else if (state == YMODEM_STATE_EOT) {
                ymodem_send_byte(YMODEM_ACK);
                ymodem_send_byte(YMODEM_CRC_REQ);
            } else {
                ymodem_send_byte(YMODEM_NAK);
            }
            continue;
        }

        if (!ymodem_validate_frame(raw, len, &frame)) {
            ymodem_send_byte(YMODEM_NAK);
            continue;
        }

        ymodem_debug_raw_len = len;

        ymodem_debug_last_len = frame.data_len;
        ymodem_debug_last_seq = frame.seq;

        if ((state == YMODEM_STATE_HEAD) && (frame.seq == 0U)) {
            ymodem_parse_header(frame.data, frame.data_len, info);
            expect_size = info->size;
            ymodem_debug_expect = expect_size;

            if ((expect_size == 0U) || (expect_size > max_size)) {
                return BOOT_STATUS_RANGE;
            }

            crc = 0xFFFFFFFFU;
            seq = 1U;
            head_retry = 0U;
            state = YMODEM_STATE_DATA;
            ymodem_send_byte(YMODEM_ACK);
            ymodem_delay_ms(10U);
            ymodem_send_byte(YMODEM_CRC_REQ);
            continue;
        }

        if ((state == YMODEM_STATE_EOT) && (frame.seq == 0U) && (frame.data[0] == 0U)) {
            ymodem_send_byte(YMODEM_ACK);
            state = YMODEM_STATE_END;
            continue;
        }

        if (state != YMODEM_STATE_DATA) {
            ymodem_send_byte(YMODEM_NAK);
            continue;
        }

        if (frame.seq == (uint8_t)(seq - 1U)) {
            ymodem_send_byte(YMODEM_ACK);
            continue;
        }

        if (frame.seq != (uint8_t)seq) {
            ymodem_send_byte(YMODEM_NAK);
            continue;
        }

        if (recv_size < expect_size) {
            uint32_t write_len = expect_size - recv_size;
            if (write_len > frame.data_len) {
                write_len = frame.data_len;
            }

            crc = crc32_step(crc, frame.data, write_len);
            if (!ROM_buffer_write(addr + recv_size, frame.data, write_len)) {
                return BOOT_STATUS_FLASH;
            }
            recv_size += write_len;
            ymodem_debug_recv = recv_size;
        }

        seq++;
        ymodem_send_byte(YMODEM_ACK);
    }

    if (recv_size != expect_size) {
        return BOOT_STATUS_PROTOCOL;
    }

    info->crc32 = crc ^ 0xFFFFFFFFU;
    return BOOT_STATUS_OK;
}

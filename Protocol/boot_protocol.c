#include "boot_protocol.h"

#include "boot_crc.h"
#include "myDMA.h"
#include "USART.h"
#include "gd32f4xx_usart.h"
#include <string.h>

uint32_t GetTick(void);

#define BOOT_PROTO_ASCII_MAX 128U
#define BOOT_PROTO_RAW_MAX   64U
#define BOOT_PROTO_MIN_LEN   13U

static uint8_t g_proto_ascii[BOOT_PROTO_ASCII_MAX];
static uint8_t g_proto_bytes[BOOT_PROTO_RAW_MAX];

static int proto_hex_value(uint8_t ch)
{
    if ((ch >= (uint8_t)'0') && (ch <= (uint8_t)'9')) {
        return (int)(ch - (uint8_t)'0');
    }
    if ((ch >= (uint8_t)'A') && (ch <= (uint8_t)'F')) {
        return (int)(ch - (uint8_t)'A' + 10U);
    }
    if ((ch >= (uint8_t)'a') && (ch <= (uint8_t)'f')) {
        return (int)(ch - (uint8_t)'a' + 10U);
    }

    return -1;
}

static uint32_t proto_ascii_hex_to_bytes(const uint8_t *ascii,
                                         uint32_t ascii_len,
                                         uint8_t *bytes,
                                         uint32_t bytes_max,
                                         bool *bad)
{
    uint32_t byte_len = 0U;
    int high = -1;

    *bad = false;

    for (uint32_t i = 0U; i < ascii_len; i++) {
        int val;

        //串口调试工具可能带空格或换行，这里统一跳过
        if ((ascii[i] == (uint8_t)' ') ||
            (ascii[i] == (uint8_t)'\r') ||
            (ascii[i] == (uint8_t)'\n') ||
            (ascii[i] == (uint8_t)'\t')) {
            continue;
        }

        val = proto_hex_value(ascii[i]);
        if (val < 0) {
            *bad = true;
            return 0U;
        }

        if (high < 0) {
            high = val;
        } else {
            if (byte_len >= bytes_max) {
                *bad = true;
                return 0U;
            }
            bytes[byte_len++] = (uint8_t)(((uint32_t)high << 4) | (uint32_t)val);
            high = -1;
        }
    }

    if (high >= 0) {
        *bad = true;
        return 0U;
    }

    return byte_len;
}

static uint16_t proto_read_be16(const uint8_t *data)
{
    return (uint16_t)(((uint16_t)data[0] << 8) | (uint16_t)data[1]);
}

static boot_proto_frame_status_t proto_parse_frame(const uint8_t *bytes,
                                                   uint32_t len,
                                                   uint16_t local_device_id,
                                                   boot_proto_frame_t *frame)
{
    uint32_t expected_len;
    uint16_t rx_crc;
    uint16_t calc_crc;

    memset(frame, 0, sizeof(*frame));

    if (len < BOOT_PROTO_MIN_LEN) {
        return BOOT_PROTO_FRAME_BAD;
    }

    frame->device_id = proto_read_be16(&bytes[2]);
    frame->frame_type = bytes[4];
    frame->command = proto_read_be16(&bytes[5]);
    frame->content_len = bytes[7];

    expected_len = BOOT_PROTO_MIN_LEN + (uint32_t)frame->content_len;
    if ((len != expected_len) ||
        (proto_read_be16(&bytes[0]) != BOOT_PROTO_START) ||
        (bytes[8] != BOOT_PROTO_VERSION) ||
        (proto_read_be16(&bytes[expected_len - 2U]) != BOOT_PROTO_END) ||
        (frame->content_len > sizeof(frame->content))) {
        return BOOT_PROTO_FRAME_BAD;
    }

    rx_crc = proto_read_be16(&bytes[9U + frame->content_len]);
    calc_crc = boot_crc16_modbus(bytes, 9U + frame->content_len);
    if (rx_crc != calc_crc) {
        return BOOT_PROTO_FRAME_BAD;
    }

    //非本机ID静默丢弃，广播地址保留给上位机扫描
    if ((frame->device_id != local_device_id) &&
        (frame->device_id != BOOT_PROTO_BROADCAST_ID)) {
        return BOOT_PROTO_FRAME_ID_MISMATCH;
    }

    if (frame->content_len != 0U) {
        memcpy(frame->content, &bytes[9], frame->content_len);
    }

    return BOOT_PROTO_FRAME_OK;
}

static void proto_append_hex_byte(char *out, uint32_t *pos, uint8_t value)
{
    static const char hex[] = "0123456789ABCDEF";

    out[(*pos)++] = hex[(value >> 4) & 0x0FU];
    out[(*pos)++] = hex[value & 0x0FU];
}

void boot_proto_rx_enable(void)
{
    USART1_ClearRxBuf();
    reset_usart1_rx_dma();
    usart_interrupt_enable(USART1, USART_INT_IDLE);
}

boot_proto_frame_status_t boot_proto_wait_frame(uint32_t timeout_ms,
                                                uint16_t local_device_id,
                                                boot_proto_frame_t *frame)
{
    uint32_t start = GetTick();

    while ((GetTick() - start) < timeout_ms) {
        if (usart1_rx_flag != 0U) {
            uint32_t ascii_len = usart1_rx_len;
            uint32_t byte_len;
            bool bad;

            if (ascii_len > sizeof(g_proto_ascii)) {
                ascii_len = sizeof(g_proto_ascii);
            }

            memcpy(g_proto_ascii, usart1_rx_buffer, ascii_len);
            boot_proto_rx_enable();

            byte_len = proto_ascii_hex_to_bytes(g_proto_ascii, ascii_len,
                                                g_proto_bytes,
                                                sizeof(g_proto_bytes),
                                                &bad);
            if (bad) {
                return BOOT_PROTO_FRAME_BAD;
            }

            return proto_parse_frame(g_proto_bytes, byte_len, local_device_id, frame);
        }
    }

    return BOOT_PROTO_FRAME_NONE;
}

void boot_proto_send_frame(uint16_t device_id,
                           uint8_t frame_type,
                           uint16_t command,
                           const uint8_t *content,
                           uint8_t content_len)
{
    uint8_t packet[32];
    char out[96];
    uint32_t pos = 0U;
    uint32_t out_pos = 0U;
    uint16_t crc;

    if (content_len > BOOT_PROTO_CONTENT_MAX) {
        return;
    }

    packet[pos++] = (uint8_t)(BOOT_PROTO_START >> 8);
    packet[pos++] = (uint8_t)BOOT_PROTO_START;
    packet[pos++] = (uint8_t)(device_id >> 8);
    packet[pos++] = (uint8_t)device_id;
    packet[pos++] = frame_type;
    packet[pos++] = (uint8_t)(command >> 8);
    packet[pos++] = (uint8_t)command;
    packet[pos++] = content_len;
    packet[pos++] = BOOT_PROTO_VERSION;

    for (uint32_t i = 0U; i < content_len; i++) {
        packet[pos++] = content[i];
    }

    crc = boot_crc16_modbus(packet, pos);
    packet[pos++] = (uint8_t)(crc >> 8);
    packet[pos++] = (uint8_t)crc;
    packet[pos++] = (uint8_t)(BOOT_PROTO_END >> 8);
    packet[pos++] = (uint8_t)BOOT_PROTO_END;

    for (uint32_t i = 0U; i < pos; i++) {
        proto_append_hex_byte(out, &out_pos, packet[i]);
    }
    out[out_pos] = '\0';

    //每帧独立带换行，避免和Bootloader提示或OK帧粘在一起
    rs485_printf("%s\r\n", out);
}

void boot_proto_send_ok(uint16_t device_id, uint16_t command)
{
    uint8_t ok = 0xFFU;

    boot_proto_send_frame(device_id, BOOT_PROTO_FRAME_RESP, command, &ok, 1U);
}

void boot_proto_send_error(uint16_t device_id, uint16_t command)
{
    boot_proto_send_frame(device_id, BOOT_PROTO_FRAME_ERROR, command, NULL, 0U);
}

void boot_proto_send_heartbeat(uint16_t device_id)
{
    boot_proto_send_frame(device_id, BOOT_PROTO_FRAME_HEART,
                          BOOT_PROTO_CMD_HEARTBEAT, NULL, 0U);
}

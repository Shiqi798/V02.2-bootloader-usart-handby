#include "raw_download.h"

#include "boot_crc.h"
#include "myDMA.h"
#include "ROM.h"
#include "USART.h"
#include "gd32f4xx_usart.h"

#include <string.h>

#define RAW_FIRST_BYTE_TIMEOUT_MS  180000U
#define RAW_END_SILENCE_MS           3000U

uint32_t GetTick(void);

static uint32_t raw_dma_pos(void)
{
    uint32_t pos = get_usart1_rx_len();

    return (pos >= MYDMA_USART1_RX_BUF_LEN) ? 0U : pos;
}

boot_status_t raw_download_receive_image(uint32_t addr, uint32_t max_size, boot_image_info_t *info)
{
    uint8_t word[4];
    uint32_t word_len = 0U;
    uint32_t size = 0U;
    uint32_t flash_off = 0U;
    uint32_t crc = 0xFFFFFFFFU;
    uint32_t read_pos;
    uint32_t first_tick;
    uint32_t last_tick;
    bool started = false;

    if ((info == NULL) || (max_size == 0U)) {
        return BOOT_STATUS_RANGE;
    }

    memset(info, 0, sizeof(*info));
    memset(word, 0xFF, sizeof(word));
    strncpy(info->name, "raw.bin", sizeof(info->name) - 1U);

    //raw模式不解析协议，只从USART DMA里把bin捞出来
    usart_interrupt_disable(USART1, USART_INT_IDLE);
    USART1_ClearRxBuf();
    reset_usart1_rx_dma();

    read_pos = raw_dma_pos();
    first_tick = GetTick();
    last_tick = first_tick;

    while (1) {
        uint32_t write_pos = raw_dma_pos();

        while (read_pos != write_pos) {
            uint8_t byte = usart1_rx_buffer[read_pos++];

            if (read_pos >= MYDMA_USART1_RX_BUF_LEN) {
                read_pos = 0U;
            }

            if (size >= max_size) {
                info->size = size;
                return BOOT_STATUS_RANGE;
            }

            crc = boot_crc32_step(crc, &byte, 1U);
            word[word_len++] = byte;
            size++;

            if (word_len == sizeof(word)) {
                if (!ROM_buffer_write(addr + flash_off, word, sizeof(word))) {
                    info->size = size;
                    return BOOT_STATUS_FLASH;
                }
                flash_off += sizeof(word);
                word_len = 0U;
            }

            started = true;
            last_tick = GetTick();
        }

        info->size = size;

        if (!started) {
            if ((GetTick() - first_tick) >= RAW_FIRST_BYTE_TIMEOUT_MS) {
                return BOOT_STATUS_TIMEOUT;
            }
        } else if ((GetTick() - last_tick) >= RAW_END_SILENCE_MS) {
            break;
        }
    }

    if (size == 0U) {
        return BOOT_STATUS_TIMEOUT;
    }

    //Flash按word写，最后不足4字节用0xFF补齐但不算进固件长度
    if (word_len != 0U) {
        while (word_len < sizeof(word)) {
            word[word_len++] = 0xFFU;
        }

        if (!ROM_buffer_write(addr + flash_off, word, sizeof(word))) {
            return BOOT_STATUS_FLASH;
        }
    }

    info->size = size;
    info->crc32 = crc ^ 0xFFFFFFFFU;
    return BOOT_STATUS_OK;
}

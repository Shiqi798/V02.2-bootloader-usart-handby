#include "crc_utils.h"

uint32_t crc32_step(uint32_t crc, const uint8_t *data, uint32_t len)
{
    for (uint32_t i = 0U; i < len; i++) {
        crc ^= data[i];
        for (uint32_t j = 0U; j < 8U; j++) {
            crc = (crc & 1U) ? ((crc >> 1U) ^ 0xEDB88320U) : (crc >> 1U);
        }
    }

    return crc;
}

uint32_t crc32_buffer(const uint8_t *data, uint32_t len)
{
    return crc32_step(0xFFFFFFFFU, data, len) ^ 0xFFFFFFFFU;
}

uint32_t crc32_flash(uint32_t addr, uint32_t len)
{
    return crc32_buffer((const uint8_t *)addr, len);
}

uint16_t crc16_ccitt(const uint8_t *data, uint32_t len)
{
    uint16_t crc = 0U;

    for (uint32_t i = 0U; i < len; i++) {
        crc ^= (uint16_t)data[i] << 8;
        for (uint32_t j = 0U; j < 8U; j++) {
            crc = (crc & 0x8000U) ? (uint16_t)((crc << 1U) ^ 0x1021U) : (uint16_t)(crc << 1U);
        }
    }

    return crc;
}

uint16_t crc16_modbus(const uint8_t *data, uint32_t len)
{
    uint16_t crc = 0xFFFFU;

    for (uint32_t i = 0U; i < len; i++) {
        crc ^= data[i];
        for (uint32_t j = 0U; j < 8U; j++) {
            crc = (crc & 1U) ? (uint16_t)((crc >> 1U) ^ 0xA001U) : (uint16_t)(crc >> 1U);
        }
    }

    return crc;
}

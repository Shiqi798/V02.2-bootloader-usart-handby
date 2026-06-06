#ifndef __CRC_UTILS_H
#define __CRC_UTILS_H

#include "HeaderFiles.h"

uint32_t crc32_step(uint32_t crc, const uint8_t *data, uint32_t len);
uint32_t crc32_buffer(const uint8_t *data, uint32_t len);
uint32_t crc32_flash(uint32_t addr, uint32_t len);
uint16_t crc16_ccitt(const uint8_t *data, uint32_t len);
uint16_t crc16_modbus(const uint8_t *data, uint32_t len);

#endif

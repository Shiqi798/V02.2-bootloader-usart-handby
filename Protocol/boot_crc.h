#ifndef __BOOT_CRC_H
#define __BOOT_CRC_H

#include <stdint.h>

/* CRC32 */
uint32_t boot_crc32_step(uint32_t crc, const uint8_t *data, uint32_t len);
uint32_t boot_crc32_buffer(const uint8_t *data, uint32_t len);
uint32_t boot_crc32_flash(uint32_t addr, uint32_t len);

/* CRC16 */
uint16_t boot_crc16_ccitt(const uint8_t *data, uint32_t len);
uint16_t boot_crc16_modbus(const uint8_t *data, uint32_t len);

#endif

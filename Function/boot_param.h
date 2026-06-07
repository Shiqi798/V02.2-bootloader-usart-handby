#ifndef __BOOT_PARAM_H
#define __BOOT_PARAM_H

#include "bootloader.h"

uint32_t boot_param_checksum(const boot_param_t *param);

bool boot_param_device_id_ok(uint16_t device_id);
bool boot_param_baud_code_ok(uint8_t baud_code);
bool boot_param_boot_flag_ok(uint8_t boot_flag);

void boot_param_default(boot_param_t *param);
bool boot_param_save(boot_param_t *param);
bool boot_param_load(boot_param_t *param);
bool boot_param_set_boot_flag(boot_param_t *param, uint8_t boot_flag);

#endif

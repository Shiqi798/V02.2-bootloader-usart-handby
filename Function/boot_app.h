#ifndef __BOOT_APP_H
#define __BOOT_APP_H

#include "bootloader.h"

bool boot_app_vector_ok(uint32_t addr);
bool boot_app_can_boot(void);
bool boot_app_backup_can_restore(void);
void boot_app_jump_raw(uint32_t addr);

#endif

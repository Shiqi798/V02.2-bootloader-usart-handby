#ifndef __BOOT_FLOW_H
#define __BOOT_FLOW_H

#include "bootloader.h"

void boot_flow_init(void);
bool boot_flow_update_requested(void);
bool boot_flow_boot_default(void);
void boot_flow_console(void);

#endif

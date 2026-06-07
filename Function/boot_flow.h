#ifndef __BOOT_FLOW_H
#define __BOOT_FLOW_H

#include <stdbool.h>

//=================================
//Boot流程

void boot_flow_init(void);
bool boot_flow_update_requested(void);  //boot_flag == 0xA5
bool boot_flow_boot_default(void);     //先主区→再备份
void boot_flow_console(void);          //主循环

#endif

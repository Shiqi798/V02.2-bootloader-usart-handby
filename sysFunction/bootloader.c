#include "bootloader.h"
#include "boot_flow.h"

void bootloader_init(void)
{
    boot_flow_init();
}

bool bootloader_update_requested(void)
{
    return boot_flow_update_requested();
}

bool bootloader_boot_default(void)
{
    return boot_flow_boot_default();
}

void bootloader_console(void)
{
    //保留旧入口名，实际流程已经放到Function层
    boot_flow_console();
}

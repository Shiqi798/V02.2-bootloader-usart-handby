#include "function.h"

#include "boot_flow.h"
#include "systick.h"
#include "OLED.h"
#include "USART.h"

//=============== 入口 ===============

void boot_entry_init(void)
{
    systick_config();
    USART1_Init();
    OLED_Init();
    //OLED_Printf(0, 0, 16, "init ok");
    boot_flow_init();
}

//------------------------------------------------------------------
//主循环：显示OLED → 等5秒 → 跳app / 进控制台

void boot_entry_loop(void)
{
    //赛题要求，OLED不能黑
    OLED_Printf(0, 0, 16, "2026639584");
    OLED_Printf(0, 16, 16, "Bootloader");
    OLED_Refresh();

    //没OTA请求就直接走人，等5秒让OLED亮够再跳
    if (!boot_flow_update_requested()) {
        uint32_t start = GetTick();
        while (GetTick() - start < 5000U);

        if (boot_flow_boot_default()) {
            while (1) {
            }
        }
    }

    //进控制台等OTA指令
    boot_flow_console();
}

#include "HeaderFiles.h"

void nvic_config(void);
uint8_t is_power_on_reset(void);

void sysFunction_Init(void)
{
    systick_config();
    USART1_Init();
    OLED_Init();
//    LED_Init();
    bootloader_init();
}

void sysFunction_loop(void)
{
    OLED_Printf(0, 0, 16, "2026639584");
    OLED_Printf(0, 16, 16, "Bootloader");
    OLED_Refresh();

    if (!bootloader_update_requested()) {
        uint32_t start = GetTick();

        /* 等待5秒，显示bootloader信息后跳转到app */
        while (GetTick() - start < 5000U);

        if (bootloader_boot_default()) {
            while (1) {
            }
        }
    }

    bootloader_console();
}
void nvic_config(void)
{
    nvic_priority_group_set(NVIC_PRIGROUP_PRE1_SUB3);
    nvic_irq_enable(SDIO_IRQn, 0, 0);
}

uint8_t is_power_on_reset(void)
{
    uint8_t ret = (rcu_flag_get(RCU_FLAG_PORRST) == SET) ? 1U : 0U;

    rcu_all_reset_flag_clear();
    return ret;
}


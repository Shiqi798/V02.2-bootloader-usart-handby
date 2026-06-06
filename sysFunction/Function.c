#include "HeaderFiles.h"

void nvic_config(void);
uint8_t is_power_on_reset(void);
static bool sysFunction_ShouldEnterBoot(void);

void sysFunction_Init(void)
{
    systick_config();
    USART1_Init();
    OLED_Init();
    LED_Init();
    Key_Init();
    bootloader_init();
}

void sysFunction_loop(void)
{
    if (!bootloader_update_requested() && !sysFunction_ShouldEnterBoot())
    {
        if (bootloader_boot_default()) {
            while (1) {
            }
        }

    }
    OLED_Printf(0, 0, 16, "2026639584");
    OLED_Printf(0, 16, 16, "Bootloader");
    OLED_Refresh();
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

static bool sysFunction_ShouldEnterBoot(void)
{
    uint32_t start = GetTick();

    while (GetTick() - start < 5000U)
    {
        if (gpio_input_bit_get(GPIOE, GPIO_PIN_15) == 0) {
            return true;
        }
    }

    return false;
}

#include "HeaderFiles.h"

volatile uint32_t sys_tick = 0;

void SysTick_Handler(void)
{
    sys_tick++;
}

uint32_t GetTick(void)
{
    return sys_tick;
}

int main(void)
{
    sysFunction_Init();
    bootloader_init();

    // 2秒检测按键
    uint32_t start = GetTick();
    bool enter_boot = false;
    while (GetTick() - start < 2000)
    {
        if (gpio_input_bit_get(GPIOE, GPIO_PIN_15) == 0) // 按键按下
        {
            enter_boot = true;
            break;
        }
    }

    if (!enter_boot)
    {
        if (bootloader_boot_default()) {
            while (1) {
            }
        }

        printf("\r\n[BOOT] no valid slot found, stay in bootloader\r\n");
    }

    OLED_Printf(0,0,16,"BOOTLOADER\r\n");
    OLED_Refresh();
    printf("\r\n[BOOT] bootloader console\r\n");
    bootloader_console();

    while (1) {
    }
}

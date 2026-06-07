#include "HeaderFiles.h"
#include "function.h"

//系统节拍，1ms递增
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
    boot_entry_init();
    boot_entry_loop();

}

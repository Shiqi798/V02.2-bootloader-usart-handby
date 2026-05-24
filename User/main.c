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
    sysFunction_loop();

}

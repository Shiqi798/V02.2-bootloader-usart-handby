#include "boot_app.h"

#include "ROM.h"
#include "gd32f4xx_dma.h"
#include "gd32f4xx_usart.h"

bool boot_app_vector_ok(uint32_t addr)
{
    uint32_t sp = *(volatile uint32_t *)addr;
    uint32_t pc = *(volatile uint32_t *)(addr + 4U);

    return (sp >= 0x20000000U) &&
           (sp <= 0x20030000U) &&
           ((sp & 3U) == 0U) &&
           (pc >= ROM_FLASH_BASE) &&
           (pc < (ROM_FLASH_BASE + ROM_FLASH_SIZE)) &&
           ((pc & 1U) != 0U);
}

bool boot_app_can_boot(void)
{
    return boot_app_vector_ok(BOOT_APP_ADDR);
}

bool boot_app_backup_can_restore(void)
{
    return boot_app_vector_ok(BOOT_BACKUP_ADDR);
}

void boot_app_jump_raw(uint32_t addr)
{
    uint32_t sp = *(volatile uint32_t *)addr;
    uint32_t pc = *(volatile uint32_t *)(addr + 4U);

    //跳转前把Bootloader现场清掉，避免USART/DMA中断带进App
    __disable_irq();
    usart_interrupt_disable(USART1, USART_INT_IDLE);
    usart_dma_receive_config(USART1, USART_RECEIVE_DMA_DISABLE);
    dma_channel_disable(DMA0, DMA_CH5);
    dma_channel_disable(DMA0, DMA_CH6);

    SysTick->CTRL = 0U;
    SysTick->LOAD = 0U;
    SysTick->VAL = 0U;

    for (uint32_t i = 0U; i < 8U; i++) {
        NVIC->ICER[i] = 0xFFFFFFFFU;
        NVIC->ICPR[i] = 0xFFFFFFFFU;
    }

    SCB->VTOR = addr;
    __DSB();
    __ISB();
    __set_MSP(sp);
    ((void (*)(void))pc)();
}

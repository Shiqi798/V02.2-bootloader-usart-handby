/************************* 头文件 *************************/

#include "HeaderFiles.h"

/************************* 宏定义 *************************/
#define  SFLASH_ID                     0xC84013
#define BUFFER_SIZE                    256
#define TX_BUFFER_SIZE                 BUFFER_SIZE
#define RX_BUFFER_SIZE                 BUFFER_SIZE
#define  FLASH_WRITE_ADDRESS           0x000000
#define  FLASH_READ_ADDRESS            FLASH_WRITE_ADDRESS


/************************ 函数声明 ************************/
void nvic_config(void);
//void key_update(void);
uint8_t is_power_on_reset(void);

void sysFunction_Init(void)
{
    systick_config();     // 时钟初始化
	USART1_Init();
    OLED_Init();
    LED_Init(); 
 
    Key_Init();      // 按键初始化


}

void sysFunction_loop(void)
{

    while (1)
    {
    }
}

void app_update_commit_after_self_check(void)
{
    bootloader_commit_active_slot();
    printf("[APP] update committed after self-check\r\n");
}

/*
void key_update(void)
{
	if (Key_Check(sample_s, KEY_DOWN))
	{
	}
}
*/
/**
 * @brief  配置NVIC中断优先级
 * @param  无
 * @retval 无
 */
void nvic_config(void)
{
    nvic_priority_group_set(NVIC_PRIGROUP_PRE1_SUB3); // 设置优先级分组
    nvic_irq_enable(SDIO_IRQn, 0, 0);                 // 使能SDIO中断，优先级为0
}


uint8_t is_power_on_reset(void)
{
    uint8_t ret = (rcu_flag_get(RCU_FLAG_PORRST)==SET )? 1 : 0;

    // 清除所有复位标志
    rcu_all_reset_flag_clear();
    
    return ret;
}







/****************************End*****************************/

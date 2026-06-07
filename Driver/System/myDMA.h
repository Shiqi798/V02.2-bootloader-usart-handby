#ifndef __MYDMA_H
#define __MYDMA_H

#include "gd32f4xx_dma.h"
#include <stdint.h>

#define MYDMA_USART1_RX_BUF_LEN 1152U

extern uint8_t usart1_rx_buffer[MYDMA_USART1_RX_BUF_LEN];
extern uint8_t usart1_tx_buffer[256];
extern uint16_t adc_value[2];

//初始化缓冲区
void mydma_init_buffers(void);

void dma_usart_tx_config(uint32_t dma_periph, dma_channel_enum channelx, uint32_t par, uint32_t mar);
void dma_usart1_rx_config(void);
void dma_enable(uint32_t dma_periph, dma_channel_enum channelx, uint16_t ndtr);

void DMA_ADC_Init(void);
void DMA_ADJ_Init(void);
void USART1_DMA_All_Init(void);

uint16_t get_usart1_rx_len(void);
void reset_usart1_rx_dma(void);

#endif

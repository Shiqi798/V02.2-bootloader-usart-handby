#ifndef __ROM_H
#define __ROM_H

#include "gd32f4xx.h"
#include "gd32f4xx_fmc.h"

#include <stdbool.h>
#include <stdint.h>


#define ROM_FLASH_BASE      0x08000000U
#define ROM_FLASH_SIZE      0x00080000U
#define ROM_PAGE_SIZE       0x00001000U

void ROM_page_erase(uint32_t addr);
void ROM_sector_erase(uint32_t addr);
void ROM_halfword_write(uint32_t addr , uint16_t data);
void ROM_word_write(uint32_t addr , uint32_t data);
void ROM_str_write(uint32_t addr , uint16_t* data , uint16_t len);
bool ROM_erase_range(uint32_t start_addr, uint32_t size);
bool ROM_buffer_write(uint32_t addr, const uint8_t *data, uint32_t len);
uint16_t ROM_halfword_read(uint32_t addr);
uint8_t ROM_char_read(uint32_t addr);
uint32_t ROM_word_read(uint32_t addr);


#endif
/****************************End*****************************/

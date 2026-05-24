#include "ROM.h"

#include <string.h>

static void rom_clear_status_flags(void)
{
    fmc_flag_clear(FMC_FLAG_END);
    fmc_flag_clear(FMC_FLAG_WPERR);
    fmc_flag_clear(FMC_FLAG_PGSERR);
    fmc_flag_clear(FMC_FLAG_PGMERR);
}

void ROM_page_erase(uint32_t addr)
{
    fmc_unlock();
    rom_clear_status_flags();
    (void)fmc_page_erase(addr);
    rom_clear_status_flags();
    fmc_lock();
}

void ROM_sector_erase(uint32_t addr)
{
    ROM_page_erase(addr);
}

void ROM_halfword_write(uint32_t addr , uint16_t data)
{
    fmc_unlock();
    rom_clear_status_flags();
    (void)fmc_halfword_program(addr , data);
    rom_clear_status_flags();
    fmc_lock();
}

void ROM_word_write(uint32_t addr , uint32_t data)
{
    fmc_unlock();
    rom_clear_status_flags();
    (void)fmc_word_program(addr , data);
    rom_clear_status_flags();
    fmc_lock();
}

void ROM_str_write(uint32_t addr , uint16_t* data , uint16_t len)
{
    fmc_unlock();
    rom_clear_status_flags();

    for (uint16_t i = 0; i < len; i++)
    {
        (void)fmc_halfword_program(addr + ((uint32_t)i * 2U) , data[i]);
    }

    rom_clear_status_flags();
    fmc_lock();
}

bool ROM_erase_range(uint32_t start_addr, uint32_t size)
{
    uint32_t aligned_start = start_addr & ~(ROM_PAGE_SIZE - 1U);
    uint32_t aligned_end = (start_addr + size + ROM_PAGE_SIZE - 1U) & ~(ROM_PAGE_SIZE - 1U);

    if ((size == 0U) || (aligned_start < ROM_FLASH_BASE) || (aligned_end > (ROM_FLASH_BASE + ROM_FLASH_SIZE))) {
        return false;
    }

    for (uint32_t page = aligned_start; page < aligned_end; page += ROM_PAGE_SIZE) {
        ROM_page_erase(page);
    }

    return true;
}

bool ROM_buffer_write(uint32_t addr, const uint8_t *data, uint32_t len)
{
    if ((data == NULL) || (len == 0U)) {
        return true;
    }

    if ((addr < ROM_FLASH_BASE) || ((addr + len) > (ROM_FLASH_BASE + ROM_FLASH_SIZE))) {
        return false;
    }

    fmc_unlock();
    rom_clear_status_flags();

    for (uint32_t offset = 0U; offset < len; offset++) {
        (void)fmc_byte_program(addr + offset, data[offset]);
        while (fmc_flag_get(FMC_FLAG_BUSY)) {
        }
    }

    rom_clear_status_flags();
    fmc_lock();

    return true;
}

uint16_t ROM_halfword_read(uint32_t addr)
{
    return *(volatile uint16_t *)(addr);
}

uint8_t ROM_char_read(uint32_t addr)
{
    return *(volatile uint8_t *)(addr);
}

uint32_t ROM_word_read(uint32_t addr)
{
    return *(volatile uint32_t *)(addr);
}

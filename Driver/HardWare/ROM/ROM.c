#include "ROM.h"

#include <string.h>

typedef struct {
    uint32_t start;
    uint32_t end;
    uint32_t ctl;
} rom_sector_t;

#if !defined(GD32F425) && !defined(GD32F427) && !defined(GD32F470)
static const rom_sector_t g_rom_sector[] = {
    {0x08000000U, 0x08004000U, CTL_SECTOR_NUMBER_0},
    {0x08004000U, 0x08008000U, CTL_SECTOR_NUMBER_1},
    {0x08008000U, 0x0800C000U, CTL_SECTOR_NUMBER_2},
    {0x0800C000U, 0x08010000U, CTL_SECTOR_NUMBER_3},
    {0x08010000U, 0x08020000U, CTL_SECTOR_NUMBER_4},
    {0x08020000U, 0x08040000U, CTL_SECTOR_NUMBER_5},
    {0x08040000U, 0x08060000U, CTL_SECTOR_NUMBER_6},
    {0x08060000U, 0x08080000U, CTL_SECTOR_NUMBER_7},
};

#define ROM_SECTOR_COUNT  (sizeof(g_rom_sector) / sizeof(g_rom_sector[0]))

static uint32_t rom_sector_ctl_from_addr(uint32_t addr)
{
    for (uint32_t i = 0U; i < ROM_SECTOR_COUNT; i++) {
        if ((addr >= g_rom_sector[i].start) && (addr < g_rom_sector[i].end)) {
            return g_rom_sector[i].ctl;
        }
    }

    return 0xFFFFFFFFU;
}
#endif

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
#if defined(GD32F425) || defined(GD32F427) || defined(GD32F470)
    (void)fmc_page_erase(addr);
#else
    (void)fmc_sector_erase(rom_sector_ctl_from_addr(addr));
#endif
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
    uint32_t end_addr = start_addr + size;
    uint32_t aligned_start = start_addr & ~(ROM_PAGE_SIZE - 1U);
    uint32_t aligned_end = (end_addr + ROM_PAGE_SIZE - 1U) & ~(ROM_PAGE_SIZE - 1U);

    if ((size == 0U) || (start_addr < ROM_FLASH_BASE) || (end_addr > (ROM_FLASH_BASE + ROM_FLASH_SIZE)) ||
        (end_addr < start_addr)) {
        return false;
    }

#if defined(GD32F425) || defined(GD32F427) || defined(GD32F470)
    fmc_unlock();
    rom_clear_status_flags();
    for (uint32_t page = aligned_start; page < aligned_end; page += ROM_PAGE_SIZE) {
        if (fmc_page_erase(page) != FMC_READY) {
            rom_clear_status_flags();
            fmc_lock();
            return false;
        }
        rom_clear_status_flags();
    }
    fmc_lock();
#else
    fmc_unlock();
    rom_clear_status_flags();
    for (uint32_t i = 0U; i < (sizeof(g_rom_sector) / sizeof(g_rom_sector[0])); i++) {
        if ((start_addr < g_rom_sector[i].end) && (end_addr > g_rom_sector[i].start)) {
            if (fmc_sector_erase(g_rom_sector[i].ctl) != FMC_READY) {
                rom_clear_status_flags();
                fmc_lock();
                return false;
            }
            rom_clear_status_flags();
        }
    }
    fmc_lock();
#endif
    return true;
}

bool ROM_buffer_write(uint32_t addr, const uint8_t *data, uint32_t len)
{
    uint32_t offset = 0U;

    if ((data == NULL) || (len == 0U)) {
        return true;
    }

    if ((addr < ROM_FLASH_BASE) || ((addr + len) > (ROM_FLASH_BASE + ROM_FLASH_SIZE)) ||
        ((addr & 3U) != 0U)) {
        return false;
    }

    fmc_unlock();
    rom_clear_status_flags();

    while (offset < len) {
        uint32_t word = 0xFFFFFFFFU;
        uint32_t write_len = len - offset;

        if (write_len > 4U) {
            write_len = 4U;
        }

        memcpy(&word, &data[offset], write_len);
        if (fmc_word_program(addr + offset, word) != FMC_READY) {
            rom_clear_status_flags();
            fmc_lock();
            return false;
        }

        if (*(volatile uint32_t *)(addr + offset) != word) {
            rom_clear_status_flags();
            fmc_lock();
            return false;
        }

        offset += 4U;
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

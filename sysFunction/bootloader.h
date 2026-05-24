#ifndef __BOOTLOADER_H
#define __BOOTLOADER_H
#include "HeaderFiles.h"

#define BOOTLOADER_SIZE          0x00007000U
#define BOOT_PARAM_ADDR          0x08007000U
#define BOOT_PARAM_SIZE          0x00001000U
#define BOOT_SLOT_A_ADDR         0x08008000U
#define BOOT_SLOT_B_ADDR         0x08044000U
#define BOOT_SLOT_SIZE           0x0003C000U
#define BOOT_SLOT_COUNT          2U
#define BOOT_CONTROL_MAGIC       0x424F4F54U
#define BOOT_CONTROL_VERSION     0x00010001U
#define BOOT_TRIAL_ONCE          1U

typedef enum {
	BOOT_SLOT_A = 0U,
	BOOT_SLOT_B = 1U,
	BOOT_SLOT_INVALID = 0xFFU
} boot_slot_t;

typedef enum {
	BOOT_STATUS_OK = 0U,
	BOOT_STATUS_TIMEOUT,
	BOOT_STATUS_ERROR,
	BOOT_STATUS_PROTOCOL,
	BOOT_STATUS_CRC,
	BOOT_STATUS_FLASH,
	BOOT_STATUS_RANGE,
	BOOT_STATUS_CANCEL
} boot_status_t;

typedef struct {
	uint32_t valid;
	uint32_t size;
	uint32_t crc32;
	uint32_t version;
	char name[32];
} boot_slot_record_t;

typedef struct {
	uint32_t magic;
	uint32_t version;
	uint32_t active_slot;
	uint32_t previous_slot;
	uint32_t pending_slot;
	uint32_t trial_pending;
	boot_slot_record_t slot[BOOT_SLOT_COUNT];
	uint32_t checksum;
} boot_control_block_t;

typedef struct {
	char name[32];
	uint32_t size;
	uint32_t crc32;
} boot_image_info_t;

uint32_t GetTick(void);

void bootloader_init(void);
bool bootloader_boot_default(void);
void bootloader_console(void);
void bootloader_print_status(void);
void bootloader_commit_active_slot(void);
void bootloader_jump_to_slot(boot_slot_t slot);
boot_status_t bootloader_download_slot(boot_slot_t slot, boot_image_info_t *info);
boot_slot_t bootloader_get_download_slot(void);


#endif

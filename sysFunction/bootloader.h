#ifndef __BOOTLOADER_H
#define __BOOTLOADER_H

#include <stdbool.h>
#include <stdint.h>

#define BOOTLOADER_SIZE          0x00010000U
#define BOOT_PARAM_ADDR          0x08010000U
#define BOOT_PARAM_SIZE          0x00001000U
#define BOOT_APP_ADDR            0x08011000U
#define BOOT_APP_SIZE            0x00020000U
#define BOOT_BACKUP_ADDR         0x08031000U
#define BOOT_BACKUP_SIZE         0x00020000U
#define BOOT_STAGE_ADDR          0x08051000U
#define BOOT_STAGE_SIZE          0x00020000U

#define BOOT_CONTROL_MAGIC       0x424F4F54U
#define BOOT_DEFAULT_DEVICE_ID   0x0001U

#define BOOT_BAUD_4800           0x11U
#define BOOT_BAUD_9600           0x12U
#define BOOT_BAUD_19200          0x13U
#define BOOT_BAUD_115200         0x14U
#define BOOT_DEFAULT_BAUD_CODE   BOOT_BAUD_115200

#define BOOT_FLAG_NORMAL         0x00U
#define BOOT_FLAG_UPDATE         0xA5U

typedef struct {
    uint32_t magic;
    uint16_t device_id;
    uint8_t baud_code;
    uint8_t boot_flag;
    uint32_t checksum;
} boot_param_t;

typedef enum {
    BOOT_STATUS_OK = 0U,
    BOOT_STATUS_TIMEOUT,
    BOOT_STATUS_ERROR,
    BOOT_STATUS_CRC,
    BOOT_STATUS_FLASH,
    BOOT_STATUS_RANGE
} boot_status_t;

typedef struct {
    char name[32];
    uint32_t size;
    uint32_t crc32;
} boot_image_info_t;

uint32_t GetTick(void);

void bootloader_init(void);
bool bootloader_update_requested(void);
bool bootloader_boot_default(void);
void bootloader_console(void);

#endif

#ifndef __BOOT_UPGRADE_H
#define __BOOT_UPGRADE_H

#include "boot_param.h"

#include <stdbool.h>
#include <stdint.h>

#define BOOT_IMAGE_MAGIC_SIZE 4U

/* Bootloader 状态码 */
typedef enum {
    BOOT_STATUS_OK = 0U,
    BOOT_STATUS_TIMEOUT,
    BOOT_STATUS_ERROR,
    BOOT_STATUS_CRC,
    BOOT_STATUS_FLASH,
    BOOT_STATUS_RANGE
} boot_status_t;

/* 暂存/升级的固件信息 */
typedef struct {
    char name[32];
    uint32_t size;
    uint32_t crc32;
} boot_image_info_t;

typedef struct {
    boot_image_info_t pending_image;
    bool pending_valid;
    bool stage_erased;
} boot_upgrade_ctx_t;

//------------------------------
//函数

void boot_upgrade_init(boot_upgrade_ctx_t *ctx);
bool boot_upgrade_prepare_stage(boot_upgrade_ctx_t *ctx);
bool boot_upgrade_staged_image_ok(const boot_image_info_t *info);

boot_status_t boot_upgrade_receive_stage_image(boot_upgrade_ctx_t *ctx);
boot_status_t boot_upgrade_execute(boot_upgrade_ctx_t *ctx, boot_param_t *param);

bool boot_upgrade_backup_app(void);
bool boot_upgrade_restore_backup_to_app(void);

#endif

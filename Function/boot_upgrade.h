#ifndef __BOOT_UPGRADE_H
#define __BOOT_UPGRADE_H

#include "bootloader.h"
#include "boot_param.h"

#define BOOT_IMAGE_MAGIC_SIZE 4U

typedef struct {
    boot_image_info_t pending_image;
    bool pending_valid;
    bool stage_erased;
} boot_upgrade_ctx_t;

void boot_upgrade_init(boot_upgrade_ctx_t *ctx);
bool boot_upgrade_prepare_stage(boot_upgrade_ctx_t *ctx);
bool boot_upgrade_staged_image_ok(const boot_image_info_t *info);

boot_status_t boot_upgrade_receive_stage_image(boot_upgrade_ctx_t *ctx);
boot_status_t boot_upgrade_execute(boot_upgrade_ctx_t *ctx, boot_param_t *param);

bool boot_upgrade_backup_app(void);
bool boot_upgrade_restore_backup_to_app(void);

#endif

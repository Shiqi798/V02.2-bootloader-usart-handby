#include "boot_upgrade.h"

#include "boot_app.h"
#include "boot_protocol.h"
#include "raw_download.h"
#include "ROM.h"

#include <string.h>

//================== 升级相关 ==================

#define BOOT_IMAGE_MAGIC0 0x5AU
#define BOOT_IMAGE_MAGIC1 0xA5U
#define BOOT_IMAGE_MAGIC2 0xC3U
#define BOOT_IMAGE_MAGIC3 0x3CU
#define BOOT_FLASH_COPY_CHUNK 256U

static uint8_t g_upgrade_flash_buf[BOOT_FLASH_COPY_CHUNK];

static bool boot_upgrade_flash_equal(uint32_t left, uint32_t right, uint32_t len)
{
    return memcmp((const void *)left, (const void *)right, len) == 0;
}

static bool boot_upgrade_copy_flash_range(uint32_t dst, uint32_t src, uint32_t len)
{
    uint32_t offset = 0U;

    while (offset < len) {
        uint32_t chunk = len - offset;

        if (chunk > sizeof(g_upgrade_flash_buf)) {
            chunk = sizeof(g_upgrade_flash_buf);
        }

        memcpy(g_upgrade_flash_buf, (const void *)(src + offset), chunk);
        if (!ROM_buffer_write(dst + offset, g_upgrade_flash_buf, chunk)) {
            return false;
        }

        offset += chunk;
    }

    return true;
}

void boot_upgrade_init(boot_upgrade_ctx_t *ctx)
{
    memset(ctx, 0, sizeof(*ctx));
}

bool boot_upgrade_prepare_stage(boot_upgrade_ctx_t *ctx)
{
    if (ctx->stage_erased) {
        return true;
    }

    //先擦一遍，以免上次的脏数据干扰魔术字判断
    if (!ROM_erase_range(BOOT_STAGE_ADDR, BOOT_STAGE_SIZE)) {
        return false;
    }

    ctx->stage_erased = true;
    return true;
}

bool boot_upgrade_staged_image_ok(const boot_image_info_t *info)
{
    const uint8_t *magic = (const uint8_t *)BOOT_STAGE_ADDR;

    if ((info->size <= BOOT_IMAGE_MAGIC_SIZE) ||
        (info->size > BOOT_STAGE_SIZE)) {
        return false;
    }

    if ((magic[0] != BOOT_IMAGE_MAGIC0) ||
        (magic[1] != BOOT_IMAGE_MAGIC1) ||
        (magic[2] != BOOT_IMAGE_MAGIC2) ||
        (magic[3] != BOOT_IMAGE_MAGIC3)) {
        return false;
    }

    return boot_app_vector_ok(BOOT_STAGE_ADDR + BOOT_IMAGE_MAGIC_SIZE);
}

boot_status_t boot_upgrade_receive_stage_image(boot_upgrade_ctx_t *ctx)
{
    boot_status_t ret;

    ctx->pending_valid = false;
    memset(&ctx->pending_image, 0, sizeof(ctx->pending_image));

    if (!boot_upgrade_prepare_stage(ctx)) {
        return BOOT_STATUS_FLASH;
    }

    ret = raw_download_receive_image(BOOT_STAGE_ADDR, BOOT_STAGE_SIZE, &ctx->pending_image);

    //raw下载结束后重新打开协议接收，后面还要等0503
    boot_proto_rx_enable();
    ctx->stage_erased = false;

    if (ret != BOOT_STATUS_OK) {
        return ret;
    }

    if (!boot_upgrade_staged_image_ok(&ctx->pending_image)) {
        return BOOT_STATUS_ERROR;
    }

    ctx->pending_valid = true;
    return BOOT_STATUS_OK;
}

bool boot_upgrade_restore_backup_to_app(void)
{
    if (!boot_app_backup_can_restore()) {
        return false;
    }

    if (!ROM_erase_range(BOOT_APP_ADDR, BOOT_APP_SIZE)) {
        return false;
    }

    if (!boot_upgrade_copy_flash_range(BOOT_APP_ADDR, BOOT_BACKUP_ADDR, BOOT_APP_SIZE)) {
        return false;
    }

    return boot_app_can_boot();
}

bool boot_upgrade_backup_app(void)
{
    if (!boot_app_can_boot()) {
        return false;
    }

    if (!ROM_erase_range(BOOT_BACKUP_ADDR, BOOT_BACKUP_SIZE)) {
        return false;
    }

    return boot_upgrade_copy_flash_range(BOOT_BACKUP_ADDR, BOOT_APP_ADDR, BOOT_APP_SIZE);
}

boot_status_t boot_upgrade_execute(boot_upgrade_ctx_t *ctx, boot_param_t *param)
{
    bool backup_ok = false;
    uint32_t image_size;

    if (!ctx->pending_valid ||
        !boot_upgrade_staged_image_ok(&ctx->pending_image)) {
        return BOOT_STATUS_ERROR;
    }

    image_size = ctx->pending_image.size - BOOT_IMAGE_MAGIC_SIZE;
    if ((image_size == 0U) || (image_size > BOOT_APP_SIZE)) {
        return BOOT_STATUS_RANGE;
    }

    backup_ok = boot_upgrade_backup_app();

    if (!ROM_erase_range(BOOT_APP_ADDR, BOOT_APP_SIZE)) {
        return BOOT_STATUS_FLASH;
    }

    if (!boot_upgrade_copy_flash_range(BOOT_APP_ADDR,
                                       BOOT_STAGE_ADDR + BOOT_IMAGE_MAGIC_SIZE,
                                       image_size) ||
        !boot_upgrade_flash_equal(BOOT_APP_ADDR,
                                  BOOT_STAGE_ADDR + BOOT_IMAGE_MAGIC_SIZE,
                                  image_size) ||
        !boot_app_can_boot()) {
        //搬运失败时优先恢复备份，避免App区停在半写状态
        if (backup_ok) {
            (void)boot_upgrade_restore_backup_to_app();
        }
        return BOOT_STATUS_FLASH;
    }

    //升级成功后清掉boot_flag，下次复位直接走正常启动
    if (!boot_param_set_boot_flag(param, BOOT_FLAG_NORMAL)) {
        return BOOT_STATUS_FLASH;
    }

    return BOOT_STATUS_OK;
}

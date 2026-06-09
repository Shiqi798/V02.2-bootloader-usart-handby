#include "boot_param.h"

#include "boot_app.h"
#include "boot_crc.h"
#include "ROM.h"

#include <stddef.h>
#include <string.h>

////////////////////////参数校验//////////////////////

uint32_t boot_param_checksum(const boot_param_t *param)
{
    //crc16
    return (uint32_t)boot_crc16_modbus((const uint8_t *)param,
                                       (uint32_t)offsetof(boot_param_t, checksum));
}

bool boot_param_device_id_ok(uint16_t device_id)
{
    return (device_id > 0U) && (device_id < 0xFFFFU);
}

bool boot_param_baud_code_ok(uint8_t baud_code)
{
    return (baud_code == BOOT_BAUD_4800) ||(baud_code == BOOT_BAUD_9600) ||
    (baud_code == BOOT_BAUD_19200) ||(baud_code == BOOT_BAUD_115200);
}

bool boot_param_boot_flag_ok(uint8_t boot_flag)
{
    return (boot_flag == BOOT_FLAG_NORMAL) || (boot_flag == BOOT_FLAG_UPDATE);
}

void boot_param_default(boot_param_t *param)
{
    memset(param, 0, sizeof(*param));param->magic = BOOT_CONTROL_MAGIC;
    param->device_id = BOOT_DEFAULT_DEVICE_ID;param->baud_code = BOOT_DEFAULT_BAUD_CODE;
    param->boot_flag = BOOT_FLAG_NORMAL;param->checksum = boot_param_checksum(param);
}

////////////////////////////参数读写////////////////////////////

bool boot_param_save(boot_param_t *param)
{
    param->checksum = boot_param_checksum(param);

    //参数区按整扇区擦写，避免旧字段残留影响下次启动校验
    if (!ROM_erase_range(BOOT_PARAM_ADDR, BOOT_PARAM_SIZE)) {
        return false;
    }

    return ROM_buffer_write(BOOT_PARAM_ADDR, (const uint8_t *)param, sizeof(*param));
}

bool boot_param_load(boot_param_t *param)
{
    memcpy(param, (const void *)BOOT_PARAM_ADDR, sizeof(*param));

    if ((param->magic == BOOT_CONTROL_MAGIC) &&
        (param->checksum == boot_param_checksum(param)) &&boot_param_device_id_ok(param->device_id) &&boot_param_baud_code_ok(param->baud_code) &&
        boot_param_boot_flag_ok(param->boot_flag)) {
        return true;
    }

    //参数区擦空或被写坏时，Bootloader必须能自己恢复默认值
    boot_param_default(param);
    (void)boot_param_save(param);
    return false;
}

bool boot_param_set_boot_flag(boot_param_t *param, uint8_t boot_flag)
{
    if (!boot_param_boot_flag_ok(boot_flag)) {
        return false;
    }

    param->boot_flag = boot_flag;
    return boot_param_save(param);
}

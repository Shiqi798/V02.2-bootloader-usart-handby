#ifndef __BOOT_PARAM_H
#define __BOOT_PARAM_H

#include <stdbool.h>
#include <stdint.h>

/* 赛题参数区魔术字 */
#define BOOT_CONTROL_MAGIC       0x424F4F54U

/* 默认设备信息 */
#define BOOT_DEFAULT_DEVICE_ID   0x0001U

/* 波特率枚举值（赛题帧内用） */
#define BOOT_BAUD_4800           0x11U
#define BOOT_BAUD_9600           0x12U
#define BOOT_BAUD_19200          0x13U
#define BOOT_BAUD_115200         0x14U
#define BOOT_DEFAULT_BAUD_CODE   BOOT_BAUD_115200

/* boot_flag 取值 */
#define BOOT_FLAG_NORMAL         0x00U
#define BOOT_FLAG_UPDATE         0xA5U

/* 参数区结构体（持久化到 Flash BOOT_PARAM_ADDR） */
typedef struct {
    uint32_t magic;
    uint16_t device_id;
    uint8_t  baud_code;
    uint8_t  boot_flag;
    uint32_t checksum;
} boot_param_t;

//===========================================================
//函数

uint32_t boot_param_checksum(const boot_param_t *param);

bool boot_param_device_id_ok(uint16_t device_id);
bool boot_param_baud_code_ok(uint8_t baud_code);
bool boot_param_boot_flag_ok(uint8_t boot_flag);

void boot_param_default(boot_param_t *param);
bool boot_param_save(boot_param_t *param);
bool boot_param_load(boot_param_t *param);
bool boot_param_set_boot_flag(boot_param_t *param, uint8_t boot_flag);

#endif

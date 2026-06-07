#ifndef __BOOT_APP_H
#define __BOOT_APP_H

#include <stdbool.h>
#include <stdint.h>

/* Bootloader 自身占用 */
#define BOOTLOADER_SIZE          0x00010000U

/* 参数区（Flash Sector 4 前 4KB） */
#define BOOT_PARAM_ADDR          0x08010000U
#define BOOT_PARAM_SIZE          0x00001000U

/* 应用程序主区（Sector 4 剩余 + Sector 5） */
#define BOOT_APP_ADDR            0x08011000U
#define BOOT_APP_SIZE            0x00020000U

/* 应用程序备份区（Sector 6） */
#define BOOT_BACKUP_ADDR         0x08031000U
#define BOOT_BACKUP_SIZE         0x00020000U

/* 固件暂存区（Sector 7） */
#define BOOT_STAGE_ADDR          0x08051000U
#define BOOT_STAGE_SIZE          0x00020000U

//--------------------------------
//函数声明

//向量表检查
bool boot_app_vector_ok(uint32_t addr);
bool boot_app_can_boot(void);
bool boot_app_backup_can_restore(void);
//关中断、清外设，跳转
void boot_app_jump_raw(uint32_t addr);

#endif

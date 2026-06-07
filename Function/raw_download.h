#ifndef __RAW_DOWNLOAD_H
#define __RAW_DOWNLOAD_H

#include "boot_upgrade.h"

//通过USART1 DMA接收原始bin文件，存入Flash addr处
boot_status_t raw_download_receive_image(uint32_t addr, uint32_t max_size, boot_image_info_t *info);

#endif

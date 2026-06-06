#ifndef __RAW_DOWNLOAD_H
#define __RAW_DOWNLOAD_H

#include "HeaderFiles.h"

boot_status_t raw_download_receive_image(uint32_t addr, uint32_t max_size, boot_image_info_t *info);

#endif

#ifndef __YMODEM_H
#define __YMODEM_H

#include "HeaderFiles.h"

#define YMODEM_HEAD_SOH          0x01U
#define YMODEM_DATA_STX          0x02U
#define YMODEM_EOT               0x04U
#define YMODEM_ACK               0x06U
#define YMODEM_NAK               0x15U
#define YMODEM_CAN               0x18U
#define YMODEM_CRC_REQ           'C'
#define YMODEM_PACKET_128        128U
#define YMODEM_PACKET_1K         1024U
#define YMODEM_FRAME_OVERHEAD    5U
#define YMODEM_TIMEOUT_MS        15000U

extern volatile uint32_t ymodem_debug_expect;
extern volatile uint32_t ymodem_debug_recv;
extern volatile uint32_t ymodem_debug_last_len;
extern volatile uint32_t ymodem_debug_last_seq;
extern volatile uint32_t ymodem_debug_raw_len;
extern volatile uint32_t ymodem_debug_bad;

boot_status_t ymodem_receive_image(uint32_t addr, uint32_t max_size, boot_image_info_t *info);

#endif

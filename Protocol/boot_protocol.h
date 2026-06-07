#ifndef __BOOT_PROTOCOL_H
#define __BOOT_PROTOCOL_H

#include <stdbool.h>
#include <stdint.h>

/* 赛题协议固定字段 */
#define BOOT_PROTO_START        0xA5B6U
#define BOOT_PROTO_END          0xB6A5U
#define BOOT_PROTO_VERSION      0x02U
#define BOOT_PROTO_BROADCAST_ID 0xFFFFU

/* 帧类型 */
#define BOOT_PROTO_FRAME_CMD    0x01U
#define BOOT_PROTO_FRAME_RESP   0x02U
#define BOOT_PROTO_FRAME_HEART  0x05U
#define BOOT_PROTO_FRAME_ERROR  0xFFU

/* Bootloader 当前关心的命令 */
#define BOOT_PROTO_CMD_QUERY_ID   0x0111U
#define BOOT_PROTO_CMD_QUERY_BAUD 0x0112U
#define BOOT_PROTO_CMD_UPGRADE_READY 0x0502U
#define BOOT_PROTO_CMD_UPGRADE_EXEC  0x0503U
#define BOOT_PROTO_CMD_HEARTBEAT     0x8888U
#define BOOT_PROTO_CMD_BROADCAST     0xFFFFU
#define BOOT_PROTO_CMD_ERROR         0xEEEEU

#define BOOT_PROTO_CONTENT_MAX 16U

typedef struct {
    uint16_t device_id;
    uint8_t frame_type;
    uint16_t command;
    uint8_t content_len;
    uint8_t content[BOOT_PROTO_CONTENT_MAX];
} boot_proto_frame_t;

typedef enum {
    BOOT_PROTO_FRAME_NONE = 0U,
    BOOT_PROTO_FRAME_OK,
    BOOT_PROTO_FRAME_BAD,
    BOOT_PROTO_FRAME_ID_MISMATCH
} boot_proto_frame_status_t;

void boot_proto_rx_enable(void);
boot_proto_frame_status_t boot_proto_wait_frame(uint32_t timeout_ms,
                                                uint16_t local_device_id,
                                                boot_proto_frame_t *frame);

void boot_proto_send_frame(uint16_t device_id,
                           uint8_t frame_type,
                           uint16_t command,
                           const uint8_t *content,
                           uint8_t content_len);
void boot_proto_send_ok(uint16_t device_id, uint16_t command);
void boot_proto_send_error(uint16_t device_id, uint16_t command);
void boot_proto_send_heartbeat(uint16_t device_id);

#endif

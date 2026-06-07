#include "boot_flow.h"

#include "boot_app.h"
#include "boot_param.h"
#include "boot_protocol.h"
#include "boot_upgrade.h"
#include "USART.h"

void OLED_Clear(void);
void OLED_Refresh(void);
void OLED_Printf(int16_t X, int16_t Y, uint8_t FontSize, char *format, ...);

#define BOOT_TEAM_ID_TEXT "2026639584"
#define BOOT_MODE_TEXT "Bootloader"
#define BOOT_WAIT_APP_MS 10000U
#define BOOT_FRAME_POLL_MS 100U

typedef enum {
    BOOT_FLOW_EVENT_NONE = 0U,
    BOOT_FLOW_EVENT_KEEP_WAITING,
    BOOT_FLOW_EVENT_IMAGE_STAGED
} boot_flow_event_t;

static boot_param_t g_boot_param;
static boot_upgrade_ctx_t g_upgrade_ctx;
static bool g_suppress_next_bad_frame = false;

static void boot_flow_show_oled(void)
{
    OLED_Clear();
    OLED_Printf(0, 0, 16, BOOT_TEAM_ID_TEXT);
    OLED_Printf(0, 16, 16, BOOT_MODE_TEXT);
    OLED_Refresh();
}

static void boot_flow_send_query_id(uint16_t command)
{
    uint8_t content[2];

    content[0] = (uint8_t)(g_boot_param.device_id >> 8);
    content[1] = (uint8_t)g_boot_param.device_id;
    boot_proto_send_frame(g_boot_param.device_id, BOOT_PROTO_FRAME_RESP,
                          command, content, sizeof(content));
}

static void boot_flow_send_query_baud(uint16_t command)
{
    uint8_t content = g_boot_param.baud_code;

    boot_proto_send_frame(g_boot_param.device_id, BOOT_PROTO_FRAME_RESP,
                          command, &content, 1U);
}

static boot_flow_event_t boot_flow_process_frame_once(uint32_t timeout_ms)
{
    boot_proto_frame_t frame;
    boot_proto_frame_status_t status;

    status = boot_proto_wait_frame(timeout_ms, g_boot_param.device_id, &frame);

    if (status == BOOT_PROTO_FRAME_NONE) {
        return BOOT_FLOW_EVENT_NONE;
    }
    if (status == BOOT_PROTO_FRAME_ID_MISMATCH) {
        return BOOT_FLOW_EVENT_KEEP_WAITING;
    }

    if (status == BOOT_PROTO_FRAME_BAD) {
        if (g_suppress_next_bad_frame) {
            g_suppress_next_bad_frame = false;
            return BOOT_FLOW_EVENT_KEEP_WAITING;
        }

        boot_proto_send_error(g_boot_param.device_id, BOOT_PROTO_CMD_ERROR);
        return BOOT_FLOW_EVENT_KEEP_WAITING;
    }

    g_suppress_next_bad_frame = false;

    if ((frame.frame_type == BOOT_PROTO_FRAME_HEART) &&
        (frame.command == BOOT_PROTO_CMD_BROADCAST)) {
        boot_proto_send_heartbeat(g_boot_param.device_id);
        return BOOT_FLOW_EVENT_KEEP_WAITING;
    }

    if (frame.frame_type != BOOT_PROTO_FRAME_CMD) {
        boot_proto_send_error(g_boot_param.device_id, BOOT_PROTO_CMD_ERROR);
        return BOOT_FLOW_EVENT_KEEP_WAITING;
    }

    switch (frame.command) {
    case BOOT_PROTO_CMD_QUERY_ID:
        boot_flow_send_query_id(frame.command);
        break;

    case BOOT_PROTO_CMD_QUERY_BAUD:
        boot_flow_send_query_baud(frame.command);
        break;

    case BOOT_PROTO_CMD_UPGRADE_READY: {
        boot_status_t ret;

        if (frame.content_len != 0U) {
            boot_proto_send_error(g_boot_param.device_id, frame.command);
            break;
        }

        boot_flow_show_oled();
        ret = boot_upgrade_receive_stage_image(&g_upgrade_ctx);
        if (ret == BOOT_STATUS_OK) {
            boot_proto_send_ok(g_boot_param.device_id, frame.command);
            g_suppress_next_bad_frame = true;
            return BOOT_FLOW_EVENT_IMAGE_STAGED;
        }

        boot_proto_send_error(g_boot_param.device_id, frame.command);
        (void)boot_upgrade_prepare_stage(&g_upgrade_ctx);
        g_suppress_next_bad_frame = true;
        break;
    }

    case BOOT_PROTO_CMD_UPGRADE_EXEC: {
        boot_status_t ret;

        if (frame.content_len != 0U) {
            boot_proto_send_error(g_boot_param.device_id, frame.command);
            break;
        }

        if (!g_upgrade_ctx.pending_valid) {
            boot_proto_send_error(g_boot_param.device_id, frame.command);
            break;
        }

        //升级前先把OK发完，Flash搬运会卡一段时间
        boot_proto_send_ok(g_boot_param.device_id, frame.command);

        boot_flow_show_oled();
        ret = boot_upgrade_execute(&g_upgrade_ctx, &g_boot_param);
        if (ret == BOOT_STATUS_OK) {
            boot_app_jump_raw(BOOT_APP_ADDR);
        }

        boot_flow_show_oled();
        break;
    }

    default:
        boot_proto_send_error(g_boot_param.device_id, BOOT_PROTO_CMD_ERROR);
        break;
    }

    return BOOT_FLOW_EVENT_KEEP_WAITING;
}

static void boot_flow_print_wait_prompt(uint32_t remaining_sec, uint32_t *last_printed)
{
    if (((remaining_sec == 10U) ||
         (remaining_sec == 7U) ||
         (remaining_sec == 4U) ||
         (remaining_sec == 1U)) &&
        (*last_printed != remaining_sec)) {
        rs485_printf("wait for start Application(%lus)......\r\n", (unsigned long)remaining_sec);
        *last_printed = remaining_sec;
    }
}

void boot_flow_init(void)
{
    (void)boot_param_load(&g_boot_param);
    boot_upgrade_init(&g_upgrade_ctx);
    boot_proto_rx_enable();
}

bool boot_flow_update_requested(void)
{
    return g_boot_param.boot_flag == BOOT_FLAG_UPDATE;
}

bool boot_flow_boot_default(void)
{
    if (boot_app_can_boot()) {
        boot_app_jump_raw(BOOT_APP_ADDR);
        return true;
    }

    if (boot_upgrade_restore_backup_to_app()) {
        boot_app_jump_raw(BOOT_APP_ADDR);
        return true;
    }

    return false;
}

void boot_flow_console(void)
{
    uint32_t start;
    uint32_t last_printed = 0xFFFFFFFFU;
    bool countdown_active = true;

    g_suppress_next_bad_frame = false;
    g_upgrade_ctx.pending_valid = false;

    boot_flow_show_oled();

    (void)boot_upgrade_prepare_stage(&g_upgrade_ctx);

    boot_flow_show_oled();

    rs485_printf("using command to interrupt start Application\r\n");

    start = GetTick();
    while (1) {
        boot_flow_event_t event;

        if (countdown_active) {
            uint32_t elapsed = GetTick() - start;
            uint32_t remaining = (elapsed >= BOOT_WAIT_APP_MS) ? 0U : (10U - (elapsed / 1000U));

            boot_flow_print_wait_prompt(remaining, &last_printed);
            event = boot_flow_process_frame_once(BOOT_FRAME_POLL_MS);

            if (event == BOOT_FLOW_EVENT_IMAGE_STAGED) {
                countdown_active = false;
            }

            if (elapsed >= BOOT_WAIT_APP_MS) {
                if (g_boot_param.boot_flag == BOOT_FLAG_UPDATE) {
                    (void)boot_param_set_boot_flag(&g_boot_param, BOOT_FLAG_NORMAL);
                }

                if (boot_flow_boot_default()) {
                    while (1) {
                    }
                }

                countdown_active = false;
            }
        } else {
            (void)boot_flow_process_frame_once(1000U);
        }
    }
}

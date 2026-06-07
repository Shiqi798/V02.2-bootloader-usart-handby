#line 1 "..\\Function\\boot_flow.c"
#line 1 "..\\Function\\boot_flow.h"



#line 1 "..\\sysFunction\\bootloader.h"



#line 1 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"
 






 





#line 25 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"



#line 5 "..\\sysFunction\\bootloader.h"
#line 1 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     




typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;


     
typedef   signed     long long intmax_t;
typedef unsigned     long long uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 6 "..\\sysFunction\\bootloader.h"

#line 16 "..\\sysFunction\\bootloader.h"













typedef struct {
    uint32_t magic;
    uint16_t device_id;
    uint8_t baud_code;
    uint8_t boot_flag;
    uint32_t checksum;
} boot_param_t;

typedef enum {
    BOOT_STATUS_OK = 0U,
    BOOT_STATUS_TIMEOUT,
    BOOT_STATUS_ERROR,
    BOOT_STATUS_CRC,
    BOOT_STATUS_FLASH,
    BOOT_STATUS_RANGE
} boot_status_t;

typedef struct {
    char name[32];
    uint32_t size;
    uint32_t crc32;
} boot_image_info_t;

uint32_t GetTick(void);

void bootloader_init(void);
_Bool bootloader_update_requested(void);
_Bool bootloader_boot_default(void);
void bootloader_console(void);

#line 5 "..\\Function\\boot_flow.h"

void boot_flow_init(void);
_Bool boot_flow_update_requested(void);
_Bool boot_flow_boot_default(void);
void boot_flow_console(void);

#line 2 "..\\Function\\boot_flow.c"

#line 1 "..\\Function\\boot_app.h"



#line 5 "..\\Function\\boot_app.h"

_Bool boot_app_vector_ok(uint32_t addr);
_Bool boot_app_can_boot(void);
_Bool boot_app_backup_can_restore(void);
void boot_app_jump_raw(uint32_t addr);

#line 4 "..\\Function\\boot_flow.c"
#line 1 "..\\Function\\boot_param.h"



#line 5 "..\\Function\\boot_param.h"

uint32_t boot_param_checksum(const boot_param_t *param);

_Bool boot_param_device_id_ok(uint16_t device_id);
_Bool boot_param_baud_code_ok(uint8_t baud_code);
_Bool boot_param_boot_flag_ok(uint8_t boot_flag);

void boot_param_default(boot_param_t *param);
_Bool boot_param_save(boot_param_t *param);
_Bool boot_param_load(boot_param_t *param);
_Bool boot_param_set_boot_flag(boot_param_t *param, uint8_t boot_flag);

#line 5 "..\\Function\\boot_flow.c"
#line 1 "..\\Protocol\\boot_protocol.h"



#line 5 "..\\Protocol\\boot_protocol.h"
#line 6 "..\\Protocol\\boot_protocol.h"

 





 





 
#line 27 "..\\Protocol\\boot_protocol.h"



typedef struct {
    uint16_t device_id;
    uint8_t frame_type;
    uint16_t command;
    uint8_t content_len;
    uint8_t content[16U];
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

#line 6 "..\\Function\\boot_flow.c"
#line 1 "..\\Function\\boot_upgrade.h"



#line 5 "..\\Function\\boot_upgrade.h"
#line 6 "..\\Function\\boot_upgrade.h"



typedef struct {
    boot_image_info_t pending_image;
    _Bool pending_valid;
    _Bool stage_erased;
} boot_upgrade_ctx_t;

void boot_upgrade_init(boot_upgrade_ctx_t *ctx);
_Bool boot_upgrade_prepare_stage(boot_upgrade_ctx_t *ctx);
_Bool boot_upgrade_staged_image_ok(const boot_image_info_t *info);

boot_status_t boot_upgrade_receive_stage_image(boot_upgrade_ctx_t *ctx);
boot_status_t boot_upgrade_execute(boot_upgrade_ctx_t *ctx, boot_param_t *param);

_Bool boot_upgrade_backup_app(void);
_Bool boot_upgrade_restore_backup_to_app(void);

#line 7 "..\\Function\\boot_flow.c"

void OLED_Clear(void);
void OLED_Refresh(void);
void OLED_Printf(int16_t X, int16_t Y, uint8_t FontSize, char *format, ...);
void rs485_printf(const char *fmt, ...);






typedef enum {
    BOOT_FLOW_EVENT_NONE = 0U,
    BOOT_FLOW_EVENT_KEEP_WAITING,
    BOOT_FLOW_EVENT_IMAGE_STAGED
} boot_flow_event_t;

static boot_param_t g_boot_param;
static boot_upgrade_ctx_t g_upgrade_ctx;
static _Bool g_suppress_next_bad_frame = 0;

static void boot_flow_show_oled(void)
{
    OLED_Clear();
    OLED_Printf(0, 0, 16, "2026639584");
    OLED_Printf(0, 16, 16, "Bootloader");
    OLED_Refresh();
}

static void boot_flow_send_query_id(uint16_t command)
{
    uint8_t content[2];

    content[0] = (uint8_t)(g_boot_param.device_id >> 8);
    content[1] = (uint8_t)g_boot_param.device_id;
    boot_proto_send_frame(g_boot_param.device_id, 0x02U,
                          command, content, sizeof(content));
}

static void boot_flow_send_query_baud(uint16_t command)
{
    uint8_t content = g_boot_param.baud_code;

    boot_proto_send_frame(g_boot_param.device_id, 0x02U,
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
            g_suppress_next_bad_frame = 0;
            return BOOT_FLOW_EVENT_KEEP_WAITING;
        }

        boot_proto_send_error(g_boot_param.device_id, 0xEEEEU);
        return BOOT_FLOW_EVENT_KEEP_WAITING;
    }

    g_suppress_next_bad_frame = 0;

    if ((frame.frame_type == 0x05U) &&
        (frame.command == 0xFFFFU)) {
        boot_proto_send_heartbeat(g_boot_param.device_id);
        return BOOT_FLOW_EVENT_KEEP_WAITING;
    }

    if (frame.frame_type != 0x01U) {
        boot_proto_send_error(g_boot_param.device_id, 0xEEEEU);
        return BOOT_FLOW_EVENT_KEEP_WAITING;
    }

    switch (frame.command) {
    case 0x0111U:
        boot_flow_send_query_id(frame.command);
        break;

    case 0x0112U:
        boot_flow_send_query_baud(frame.command);
        break;

    case 0x0502U: {
        boot_status_t ret;

        if (frame.content_len != 0U) {
            boot_proto_send_error(g_boot_param.device_id, frame.command);
            break;
        }

        boot_flow_show_oled();
        ret = boot_upgrade_receive_stage_image(&g_upgrade_ctx);
        if (ret == BOOT_STATUS_OK) {
            boot_proto_send_ok(g_boot_param.device_id, frame.command);
            g_suppress_next_bad_frame = 1;
            return BOOT_FLOW_EVENT_IMAGE_STAGED;
        }

        boot_proto_send_error(g_boot_param.device_id, frame.command);
        (void)boot_upgrade_prepare_stage(&g_upgrade_ctx);
        g_suppress_next_bad_frame = 1;
        break;
    }

    case 0x0503U: {
        boot_status_t ret;

        if (frame.content_len != 0U) {
            boot_proto_send_error(g_boot_param.device_id, frame.command);
            break;
        }

        if (!g_upgrade_ctx.pending_valid) {
            boot_proto_send_error(g_boot_param.device_id, frame.command);
            break;
        }

        
        boot_proto_send_ok(g_boot_param.device_id, frame.command);

        boot_flow_show_oled();
        ret = boot_upgrade_execute(&g_upgrade_ctx, &g_boot_param);
        if (ret == BOOT_STATUS_OK) {
            boot_app_jump_raw(0x08011000U);
        }

        boot_flow_show_oled();
        break;
    }

    default:
        boot_proto_send_error(g_boot_param.device_id, 0xEEEEU);
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

_Bool boot_flow_update_requested(void)
{
    return g_boot_param.boot_flag == 0xA5U;
}

_Bool boot_flow_boot_default(void)
{
    if (boot_app_can_boot()) {
        boot_app_jump_raw(0x08011000U);
        return 1;
    }

    if (boot_upgrade_restore_backup_to_app()) {
        boot_app_jump_raw(0x08011000U);
        return 1;
    }

    return 0;
}

void boot_flow_console(void)
{
    uint32_t start;
    uint32_t last_printed = 0xFFFFFFFFU;
    _Bool countdown_active = 1;

    g_suppress_next_bad_frame = 0;
    g_upgrade_ctx.pending_valid = 0;

    boot_flow_show_oled();

    (void)boot_upgrade_prepare_stage(&g_upgrade_ctx);

    boot_flow_show_oled();

    rs485_printf("using command to interrupt start Application\r\n");

    start = GetTick();
    while (1) {
        boot_flow_event_t event;

        if (countdown_active) {
            uint32_t elapsed = GetTick() - start;
            uint32_t remaining = (elapsed >= 10000U) ? 0U : (10U - (elapsed / 1000U));

            boot_flow_print_wait_prompt(remaining, &last_printed);
            event = boot_flow_process_frame_once(100U);

            if (event == BOOT_FLOW_EVENT_IMAGE_STAGED) {
                countdown_active = 0;
            }

            if (elapsed >= 10000U) {
                if (g_boot_param.boot_flag == 0xA5U) {
                    (void)boot_param_set_boot_flag(&g_boot_param, 0x00U);
                }

                if (boot_flow_boot_default()) {
                    while (1) {
                    }
                }

                countdown_active = 0;
            }
        } else {
            (void)boot_flow_process_frame_once(1000U);
        }
    }
}

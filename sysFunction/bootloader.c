#include "bootloader.h"

#include "crc_utils.h"
#include "ROM.h"
#include "raw_download.h"

#define BOOT_IMAGE_MAGIC0        0x5AU
#define BOOT_IMAGE_MAGIC1        0xA5U
#define BOOT_IMAGE_MAGIC2        0xC3U
#define BOOT_IMAGE_MAGIC3        0x3CU
#define BOOT_IMAGE_MAGIC_SIZE    4U

#define BOOT_PROTO_START         0xA5B6U
#define BOOT_PROTO_END           0xB6A5U
#define BOOT_PROTO_VERSION       0x02U
#define BOOT_PROTO_BROADCAST_ID  0xFFFFU

#define BOOT_FRAME_TYPE_CMD      0x01U
#define BOOT_FRAME_TYPE_RESP     0x02U
#define BOOT_FRAME_TYPE_HEART    0x05U
#define BOOT_FRAME_TYPE_ERROR    0xFFU

#define BOOT_CMD_QUERY_ID        0x0111U
#define BOOT_CMD_QUERY_BAUD      0x0112U
#define BOOT_CMD_UPGRADE_READY   0x0502U
#define BOOT_CMD_UPGRADE_EXEC    0x0503U
#define BOOT_CMD_HEARTBEAT       0x8888U
#define BOOT_CMD_BROADCAST       0xFFFFU
#define BOOT_CMD_ERROR           0xEEEEU

#define BOOT_TEAM_ID_TEXT        "2026639584"
#define BOOT_MODE_TEXT           "Bootloader"
#define BOOT_WAIT_APP_MS         10000U
#define BOOT_FRAME_POLL_MS       100U
#define BOOT_FLASH_COPY_CHUNK    256U

typedef struct {
    uint16_t device_id;
    uint8_t frame_type;
    uint16_t command;
    uint8_t content_len;
    uint8_t content[16];
} boot_frame_t;

typedef enum {
    BOOT_FRAME_NONE = 0U,
    BOOT_FRAME_OK,
    BOOT_FRAME_BAD,
    BOOT_FRAME_ID_MISMATCH
} boot_frame_status_t;

typedef enum {
    BOOT_EVENT_NONE = 0U,
    BOOT_EVENT_KEEP_WAITING,
    BOOT_EVENT_IMAGE_STAGED
} boot_event_t;

static boot_param_t g_boot;
static boot_image_info_t g_pending_image;
static bool g_pending_valid = false;
static bool g_stage_erased = false;
static bool g_suppress_next_bad_frame = false;
static uint8_t g_frame_ascii[MYDMA_USART1_RX_BUF_LEN];
static uint8_t g_frame_bytes[MYDMA_USART1_RX_BUF_LEN / 2U];
static uint8_t g_flash_buf[BOOT_FLASH_COPY_CHUNK];

static void oled_show_bootloader(void)
{
    OLED_Clear();
    OLED_Printf(0, 0, 16, BOOT_TEAM_ID_TEXT);
    OLED_Printf(0, 16, 16, BOOT_MODE_TEXT);
    OLED_Refresh();
}

static uint32_t param_checksum(const boot_param_t *param)
{
    return (uint32_t)crc16_modbus((const uint8_t *)param, (uint32_t)offsetof(boot_param_t, checksum));
}

static bool device_id_ok(uint16_t device_id)
{
    return (device_id > 0U) && (device_id < BOOT_PROTO_BROADCAST_ID);
}

static bool baud_code_ok(uint8_t baud_code)
{
    return (baud_code == BOOT_BAUD_4800) ||
           (baud_code == BOOT_BAUD_9600) ||
           (baud_code == BOOT_BAUD_19200) ||
           (baud_code == BOOT_BAUD_115200);
}

static bool boot_flag_ok(uint8_t boot_flag)
{
    return (boot_flag == BOOT_FLAG_NORMAL) || (boot_flag == BOOT_FLAG_UPDATE);
}

static void param_default(void)
{
    memset(&g_boot, 0, sizeof(g_boot));
    g_boot.magic = BOOT_CONTROL_MAGIC;
    g_boot.device_id = BOOT_DEFAULT_DEVICE_ID;
    g_boot.baud_code = BOOT_DEFAULT_BAUD_CODE;
    g_boot.boot_flag = BOOT_FLAG_NORMAL;
    g_boot.checksum = param_checksum(&g_boot);
}

static bool param_save(void)
{
    g_boot.checksum = param_checksum(&g_boot);

    if (!ROM_erase_range(BOOT_PARAM_ADDR, BOOT_PARAM_SIZE)) {
        return false;
    }

    return ROM_buffer_write(BOOT_PARAM_ADDR, (const uint8_t *)&g_boot, sizeof(g_boot));
}

static void param_load(void)
{
    memcpy(&g_boot, (const void *)BOOT_PARAM_ADDR, sizeof(g_boot));

    if ((g_boot.magic != BOOT_CONTROL_MAGIC) ||
        (g_boot.checksum != param_checksum(&g_boot)) ||
        !device_id_ok(g_boot.device_id) ||
        !baud_code_ok(g_boot.baud_code) ||
        !boot_flag_ok(g_boot.boot_flag)) {
        param_default();
        (void)param_save();
    }
}

static bool vector_ok(uint32_t addr)
{
    uint32_t sp = *(volatile uint32_t *)addr;
    uint32_t pc = *(volatile uint32_t *)(addr + 4U);

    return (sp >= 0x20000000U) &&
           (sp <= 0x20030000U) &&
           ((sp & 3U) == 0U) &&
           (pc >= ROM_FLASH_BASE) &&
           (pc < (ROM_FLASH_BASE + ROM_FLASH_SIZE)) &&
           ((pc & 1U) != 0U);
}

static bool app_can_boot(void)
{
    return vector_ok(BOOT_APP_ADDR);
}

static bool backup_can_restore(void)
{
    return vector_ok(BOOT_BACKUP_ADDR);
}

static bool flash_equal(uint32_t left, uint32_t right, uint32_t len)
{
    return memcmp((const void *)left, (const void *)right, len) == 0;
}

static bool copy_flash_range(uint32_t dst, uint32_t src, uint32_t len)
{
    uint32_t offset = 0U;

    while (offset < len) {
        uint32_t chunk = len - offset;

        if (chunk > sizeof(g_flash_buf)) {
            chunk = sizeof(g_flash_buf);
        }

        memcpy(g_flash_buf, (const void *)(src + offset), chunk);
        if (!ROM_buffer_write(dst + offset, g_flash_buf, chunk)) {
            return false;
        }

        offset += chunk;
    }

    return true;
}

static bool restore_backup_to_app(void)
{
    if (!backup_can_restore()) {
        return false;
    }

    if (!ROM_erase_range(BOOT_APP_ADDR, BOOT_APP_SIZE)) {
        return false;
    }

    if (!copy_flash_range(BOOT_APP_ADDR, BOOT_BACKUP_ADDR, BOOT_APP_SIZE)) {
        return false;
    }

    return app_can_boot();
}

static bool backup_app(void)
{
    if (!app_can_boot()) {
        return false;
    }

    if (!ROM_erase_range(BOOT_BACKUP_ADDR, BOOT_BACKUP_SIZE)) {
        return false;
    }

    return copy_flash_range(BOOT_BACKUP_ADDR, BOOT_APP_ADDR, BOOT_APP_SIZE);
}

static bool prepare_stage_area(void)
{
    if (g_stage_erased) {
        return true;
    }

    if (!ROM_erase_range(BOOT_STAGE_ADDR, BOOT_STAGE_SIZE)) {
        return false;
    }

    g_stage_erased = true;
    return true;
}

static void jump_raw(uint32_t addr)
{
    uint32_t sp = *(volatile uint32_t *)addr;
    uint32_t pc = *(volatile uint32_t *)(addr + 4U);

    __disable_irq();
    usart_interrupt_disable(USART1, USART_INT_IDLE);
    usart_dma_receive_config(USART1, USART_RECEIVE_DMA_DISABLE);
    dma_channel_disable(DMA0, DMA_CH5);
    dma_channel_disable(DMA0, DMA_CH6);

    SysTick->CTRL = 0U;
    SysTick->LOAD = 0U;
    SysTick->VAL = 0U;

    for (uint32_t i = 0U; i < 8U; i++) {
        NVIC->ICER[i] = 0xFFFFFFFFU;
        NVIC->ICPR[i] = 0xFFFFFFFFU;
    }

    SCB->VTOR = addr;
    __DSB();
    __ISB();
    __set_MSP(sp);
    ((void (*)(void))pc)();
}

static void protocol_rx_enable(void)
{
    USART1_ClearRxBuf();
    reset_usart1_rx_dma();
    usart_interrupt_enable(USART1, USART_INT_IDLE);
}

static int hex_value(uint8_t ch)
{
    if ((ch >= (uint8_t)'0') && (ch <= (uint8_t)'9')) {
        return (int)(ch - (uint8_t)'0');
    }
    if ((ch >= (uint8_t)'A') && (ch <= (uint8_t)'F')) {
        return (int)(ch - (uint8_t)'A' + 10U);
    }
    if ((ch >= (uint8_t)'a') && (ch <= (uint8_t)'f')) {
        return (int)(ch - (uint8_t)'a' + 10U);
    }

    return -1;
}

static uint32_t ascii_hex_to_bytes(const uint8_t *ascii, uint32_t ascii_len,
                                   uint8_t *bytes, uint32_t bytes_max, bool *bad)
{
    uint32_t byte_len = 0U;
    int high = -1;

    *bad = false;

    for (uint32_t i = 0U; i < ascii_len; i++) {
        int val;

        if ((ascii[i] == (uint8_t)' ') ||
            (ascii[i] == (uint8_t)'\r') ||
            (ascii[i] == (uint8_t)'\n') ||
            (ascii[i] == (uint8_t)'\t')) {
            continue;
        }

        val = hex_value(ascii[i]);
        if (val < 0) {
            *bad = true;
            return 0U;
        }

        if (high < 0) {
            high = val;
        } else {
            if (byte_len >= bytes_max) {
                *bad = true;
                return 0U;
            }
            bytes[byte_len++] = (uint8_t)(((uint32_t)high << 4) | (uint32_t)val);
            high = -1;
        }
    }

    if (high >= 0) {
        *bad = true;
        return 0U;
    }

    return byte_len;
}

static uint16_t read_be16(const uint8_t *data)
{
    return (uint16_t)(((uint16_t)data[0] << 8) | (uint16_t)data[1]);
}

static boot_frame_status_t parse_frame(const uint8_t *bytes, uint32_t len, boot_frame_t *frame)
{
    uint32_t expected_len;
    uint16_t rx_crc;
    uint16_t calc_crc;

    memset(frame, 0, sizeof(*frame));

    if (len < 13U) {
        return BOOT_FRAME_BAD;
    }

    frame->device_id = read_be16(&bytes[2]);
    frame->frame_type = bytes[4];
    frame->command = read_be16(&bytes[5]);
    frame->content_len = bytes[7];

    expected_len = 13U + (uint32_t)frame->content_len;
    if ((len != expected_len) ||
        (read_be16(&bytes[0]) != BOOT_PROTO_START) ||
        (bytes[8] != BOOT_PROTO_VERSION) ||
        (read_be16(&bytes[expected_len - 2U]) != BOOT_PROTO_END) ||
        (frame->content_len > sizeof(frame->content))) {
        return BOOT_FRAME_BAD;
    }

    rx_crc = read_be16(&bytes[9U + frame->content_len]);
    calc_crc = crc16_modbus(bytes, 9U + frame->content_len);
    if (rx_crc != calc_crc) {
        return BOOT_FRAME_BAD;
    }

    if ((frame->device_id != g_boot.device_id) &&
        (frame->device_id != BOOT_PROTO_BROADCAST_ID)) {
        return BOOT_FRAME_ID_MISMATCH;
    }

    if (frame->content_len != 0U) {
        memcpy(frame->content, &bytes[9], frame->content_len);
    }

    return BOOT_FRAME_OK;
}

static boot_frame_status_t wait_frame(uint32_t timeout_ms, boot_frame_t *frame)
{
    uint32_t start = GetTick();

    while ((GetTick() - start) < timeout_ms) {
        if (usart1_rx_flag != 0U) {
            uint32_t ascii_len = usart1_rx_len;
            uint32_t byte_len;
            bool bad;

            if (ascii_len > sizeof(g_frame_ascii)) {
                ascii_len = sizeof(g_frame_ascii);
            }
            memcpy(g_frame_ascii, usart1_rx_buffer, ascii_len);
            protocol_rx_enable();

            byte_len = ascii_hex_to_bytes(g_frame_ascii, ascii_len,
                                          g_frame_bytes, sizeof(g_frame_bytes), &bad);
            if (bad) {
                return BOOT_FRAME_BAD;
            }

            return parse_frame(g_frame_bytes, byte_len, frame);
        }
    }

    return BOOT_FRAME_NONE;
}

static void append_hex_byte(char *out, uint32_t *pos, uint8_t value)
{
    static const char hex[] = "0123456789ABCDEF";

    out[(*pos)++] = hex[(value >> 4) & 0x0FU];
    out[(*pos)++] = hex[value & 0x0FU];
}

static void send_frame(uint8_t frame_type, uint16_t command, const uint8_t *content, uint8_t content_len)
{
    uint8_t packet[32];
    char out[96];
    uint32_t pos = 0U;
    uint32_t out_pos = 0U;
    uint16_t crc;

    if (content_len > sizeof(((boot_frame_t *)0)->content)) {
        return;
    }

    packet[pos++] = (uint8_t)(BOOT_PROTO_START >> 8);
    packet[pos++] = (uint8_t)BOOT_PROTO_START;
    packet[pos++] = (uint8_t)(g_boot.device_id >> 8);
    packet[pos++] = (uint8_t)g_boot.device_id;
    packet[pos++] = frame_type;
    packet[pos++] = (uint8_t)(command >> 8);
    packet[pos++] = (uint8_t)command;
    packet[pos++] = content_len;
    packet[pos++] = BOOT_PROTO_VERSION;

    for (uint32_t i = 0U; i < content_len; i++) {
        packet[pos++] = content[i];
    }

    crc = crc16_modbus(packet, pos);
    packet[pos++] = (uint8_t)(crc >> 8);
    packet[pos++] = (uint8_t)crc;
    packet[pos++] = (uint8_t)(BOOT_PROTO_END >> 8);
    packet[pos++] = (uint8_t)BOOT_PROTO_END;

    for (uint32_t i = 0U; i < pos; i++) {
        append_hex_byte(out, &out_pos, packet[i]);
    }
    out[out_pos] = '\0';

    printf("%s\r\n", out);
}

static void send_ok(uint16_t command)
{
    uint8_t ok = 0xFFU;

    send_frame(BOOT_FRAME_TYPE_RESP, command, &ok, 1U);
}

static void send_error(uint16_t command)
{
    send_frame(BOOT_FRAME_TYPE_ERROR, command, NULL, 0U);
}

static bool staged_image_ok(const boot_image_info_t *info)
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

    return vector_ok(BOOT_STAGE_ADDR + BOOT_IMAGE_MAGIC_SIZE);
}

static boot_status_t receive_stage_image(void)
{
    boot_status_t ret;

    g_pending_valid = false;
    memset(&g_pending_image, 0, sizeof(g_pending_image));

    if (!prepare_stage_area()) {
        return BOOT_STATUS_FLASH;
    }

    oled_show_bootloader();

    ret = raw_download_receive_image(BOOT_STAGE_ADDR, BOOT_STAGE_SIZE, &g_pending_image);
    protocol_rx_enable();
    g_stage_erased = false;
    g_suppress_next_bad_frame = true;

    if (ret != BOOT_STATUS_OK) {
        return ret;
    }

    if (!staged_image_ok(&g_pending_image)) {
        return BOOT_STATUS_ERROR;
    }

    g_pending_valid = true;
    return BOOT_STATUS_OK;
}

static boot_status_t execute_upgrade(void)
{
    bool backup_ok = false;
    uint32_t image_size;

    if (!g_pending_valid || !staged_image_ok(&g_pending_image)) {
        return BOOT_STATUS_ERROR;
    }

    image_size = g_pending_image.size - BOOT_IMAGE_MAGIC_SIZE;
    if ((image_size == 0U) || (image_size > BOOT_APP_SIZE)) {
        return BOOT_STATUS_RANGE;
    }

    backup_ok = backup_app();

    if (!ROM_erase_range(BOOT_APP_ADDR, BOOT_APP_SIZE)) {
        return BOOT_STATUS_FLASH;
    }

    if (!copy_flash_range(BOOT_APP_ADDR, BOOT_STAGE_ADDR + BOOT_IMAGE_MAGIC_SIZE, image_size) ||
        !flash_equal(BOOT_APP_ADDR, BOOT_STAGE_ADDR + BOOT_IMAGE_MAGIC_SIZE, image_size) ||
        !app_can_boot()) {
        if (backup_ok) {
            (void)restore_backup_to_app();
        }
        return BOOT_STATUS_FLASH;
    }

    g_boot.boot_flag = BOOT_FLAG_NORMAL;
    if (!param_save()) {
        return BOOT_STATUS_FLASH;
    }

    return BOOT_STATUS_OK;
}

static boot_event_t process_frame_once(uint32_t timeout_ms)
{
    boot_frame_t frame;
    boot_frame_status_t status = wait_frame(timeout_ms, &frame);

    if (status == BOOT_FRAME_NONE) {
        return BOOT_EVENT_NONE;
    }

    if (status == BOOT_FRAME_ID_MISMATCH) {
        return BOOT_EVENT_KEEP_WAITING;
    }

    if (status == BOOT_FRAME_BAD) {
        if (g_suppress_next_bad_frame) {
            g_suppress_next_bad_frame = false;
            return BOOT_EVENT_KEEP_WAITING;
        }
        send_error(BOOT_CMD_ERROR);
        return BOOT_EVENT_KEEP_WAITING;
    }

    g_suppress_next_bad_frame = false;

    if ((frame.frame_type == BOOT_FRAME_TYPE_HEART) &&
        (frame.command == BOOT_CMD_BROADCAST)) {
        send_frame(BOOT_FRAME_TYPE_HEART, BOOT_CMD_HEARTBEAT, NULL, 0U);
        return BOOT_EVENT_KEEP_WAITING;
    }

    if (frame.frame_type != BOOT_FRAME_TYPE_CMD) {
        send_error(BOOT_CMD_ERROR);
        return BOOT_EVENT_KEEP_WAITING;
    }

    switch (frame.command) {
    case BOOT_CMD_QUERY_ID: {
        uint8_t content[2];

        content[0] = (uint8_t)(g_boot.device_id >> 8);
        content[1] = (uint8_t)g_boot.device_id;
        send_frame(BOOT_FRAME_TYPE_RESP, frame.command, content, sizeof(content));
        break;
    }

    case BOOT_CMD_QUERY_BAUD: {
        uint8_t content = g_boot.baud_code;

        send_frame(BOOT_FRAME_TYPE_RESP, frame.command, &content, 1U);
        break;
    }

    case BOOT_CMD_UPGRADE_READY: {
        boot_status_t ret;

        if (frame.content_len != 0U) {
            send_error(frame.command);
            break;
        }

        ret = receive_stage_image();
        if (ret == BOOT_STATUS_OK) {
            send_ok(frame.command);
            return BOOT_EVENT_IMAGE_STAGED;
        }

        send_error(frame.command);
        (void)prepare_stage_area();
        break;
    }

    case BOOT_CMD_UPGRADE_EXEC: {
        boot_status_t ret;

        if (frame.content_len != 0U) {
            send_error(frame.command);
            break;
        }

        if (!g_pending_valid) {
            send_error(frame.command);
            break;
        }

        send_ok(frame.command);

        oled_show_bootloader();

        ret = execute_upgrade();
        if (ret == BOOT_STATUS_OK) {
            jump_raw(BOOT_APP_ADDR);
        }

        oled_show_bootloader();
        break;
    }

    default:
        send_error(BOOT_CMD_ERROR);
        break;
    }

    return BOOT_EVENT_KEEP_WAITING;
}

static void print_wait_prompt_once(uint32_t remaining_sec, uint32_t *last_printed)
{
    if (((remaining_sec == 10U) ||
         (remaining_sec == 7U) ||
         (remaining_sec == 4U) ||
         (remaining_sec == 1U)) &&
        (*last_printed != remaining_sec)) {
        printf("wait for start Application(%lus)......\r\n", (unsigned long)remaining_sec);
        *last_printed = remaining_sec;
    }
}

void bootloader_init(void)
{
    param_load();
    protocol_rx_enable();
}

bool bootloader_update_requested(void)
{
    return g_boot.boot_flag == BOOT_FLAG_UPDATE;
}

bool bootloader_boot_default(void)
{
    if (app_can_boot()) {
        jump_raw(BOOT_APP_ADDR);
        return true;
    }

    if (restore_backup_to_app()) {
        jump_raw(BOOT_APP_ADDR);
        return true;
    }

    return false;
}

void bootloader_console(void)
{
    uint32_t start;
    uint32_t last_printed = 0xFFFFFFFFU;
    bool countdown_active = true;

    g_pending_valid = false;

    oled_show_bootloader();

    (void)prepare_stage_area();

    oled_show_bootloader();

    printf("using command to interrupt start Application\r\n");

    start = GetTick();
    while (1) {
        boot_event_t event;

        if (countdown_active) {
            uint32_t elapsed = GetTick() - start;
            uint32_t remaining = (elapsed >= BOOT_WAIT_APP_MS) ? 0U : (10U - (elapsed / 1000U));

            print_wait_prompt_once(remaining, &last_printed);
            event = process_frame_once(BOOT_FRAME_POLL_MS);

            if (event == BOOT_EVENT_IMAGE_STAGED) {
                countdown_active = false;
            }

            if (elapsed >= BOOT_WAIT_APP_MS) {
                if (g_boot.boot_flag == BOOT_FLAG_UPDATE) {
                    g_boot.boot_flag = BOOT_FLAG_NORMAL;
                    (void)param_save();
                }

                if (bootloader_boot_default()) {
                    while (1) {
                    }
                }

                countdown_active = false;
            }
        } else {
            (void)process_frame_once(1000U);
        }
    }
}

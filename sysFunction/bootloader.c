#include "bootloader.h"
#include "ROM.h"

#include <ctype.h>
#include <stddef.h>
#include <stdlib.h>

typedef enum {
    YMODEM_WAIT_HEADER = 0U,
    YMODEM_RECEIVE_DATA,
    YMODEM_WAIT_EOT,
    YMODEM_WAIT_END_PACKET,
    YMODEM_DONE
} ymodem_state_t;

static boot_control_block_t g_boot_control;
static boot_slot_t g_running_slot = BOOT_SLOT_INVALID;

static const char *bootloader_slot_name(boot_slot_t slot)
{
    if (slot == BOOT_SLOT_A) {
        return "slotA";
    }

    if (slot == BOOT_SLOT_B) {
        return "slotB";
    }

    return "none";
}

static uint32_t bootloader_crc32_update(uint32_t crc, const uint8_t *data, uint32_t len)
{
    for (uint32_t i = 0U; i < len; i++) {
        crc ^= data[i];
        for (uint32_t bit = 0U; bit < 8U; bit++) {
            if ((crc & 1U) != 0U) {
                crc = (crc >> 1U) ^ 0xEDB88320U;
            } else {
                crc >>= 1U;
            }
        }
    }
    return crc;
}

static uint32_t bootloader_crc32_buffer(const uint8_t *data, uint32_t len)
{
    uint32_t crc = 0xFFFFFFFFU;
    crc = bootloader_crc32_update(crc, data, len);
    return crc ^ 0xFFFFFFFFU;
}

static uint32_t bootloader_control_checksum(const boot_control_block_t *control)
{
    const uint8_t *bytes = (const uint8_t *)control;
    uint32_t length = (uint32_t)offsetof(boot_control_block_t, checksum);
    return bootloader_crc32_buffer(bytes, length);
}

static uint32_t bootloader_image_crc32(uint32_t addr, uint32_t len)
{
    uint32_t crc = 0xFFFFFFFFU;
    const uint8_t *image = (const uint8_t *)addr;

    while (len > 0U) {
        uint32_t chunk = (len > 256U) ? 256U : len;
        crc = bootloader_crc32_update(crc, image, chunk);
        image += chunk;
        len -= chunk;
    }

    return crc ^ 0xFFFFFFFFU;
}

static uint16_t bootloader_crc16_ccitt(const uint8_t *data, uint32_t len)
{
    uint16_t crc = 0U;

    for (uint32_t i = 0U; i < len; i++) {
        crc ^= (uint16_t)data[i] << 8;
        for (uint32_t bit = 0U; bit < 8U; bit++) {
            if ((crc & 0x8000U) != 0U) {
                crc = (uint16_t)((crc << 1U) ^ 0x1021U);
            } else {
                crc <<= 1U;
            }
        }
    }

    return crc;
}

static void bootloader_send_byte(uint8_t byte)
{
    uint16_t value = byte;
    USART1_SendData(&value, 1U);
}

static void bootloader_send_char(char ch)
{
    bootloader_send_byte((uint8_t)ch);
}

static const char *bootloader_trim(char *text)
{
    while ((*text == '\r') || (*text == '\n') || (*text == ' ') || (*text == '\t')) {
        text++;
    }

    size_t len = strlen(text);
    while ((len > 0U) && ((text[len - 1U] == '\r') || (text[len - 1U] == '\n') || (text[len - 1U] == ' ') || (text[len - 1U] == '\t'))) {
        text[--len] = '\0';
    }

    return text;
}

static void bootloader_to_lower(char *text)
{
    while (*text != '\0') {
        *text = (char)tolower((unsigned char)*text);
        text++;
    }
}

static uint32_t bootloader_slot_address(boot_slot_t slot)
{
    return (slot == BOOT_SLOT_A) ? BOOT_SLOT_A_ADDR : BOOT_SLOT_B_ADDR;
}

static boot_slot_t bootloader_other_slot(boot_slot_t slot)
{
    return (slot == BOOT_SLOT_A) ? BOOT_SLOT_B : BOOT_SLOT_A;
}

static bool bootloader_is_slot_valid(boot_slot_t slot)
{
    return (slot == BOOT_SLOT_A) || (slot == BOOT_SLOT_B);
}

static uint32_t bootloader_slot_index(boot_slot_t slot)
{
    return (slot == BOOT_SLOT_B) ? 1U : 0U;
}

static bool bootloader_vector_is_valid(uint32_t slot_addr)
{
    uint32_t stack_pointer = *(volatile uint32_t *)slot_addr;
    uint32_t reset_handler = *(volatile uint32_t *)(slot_addr + 4U);

    if ((stack_pointer < 0x20000000U) || (stack_pointer > 0x20030000U) || ((stack_pointer & 0x3U) != 0U)) {
        return false;
    }

    if ((reset_handler < ROM_FLASH_BASE) || (reset_handler >= (ROM_FLASH_BASE + ROM_FLASH_SIZE)) || ((reset_handler & 0x1U) == 0U)) {
        return false;
    }

    return true;
}

static void bootloader_control_defaults(void)
{
    memset(&g_boot_control, 0, sizeof(g_boot_control));
    g_boot_control.magic = BOOT_CONTROL_MAGIC;
    g_boot_control.version = BOOT_CONTROL_VERSION;
    g_boot_control.active_slot = BOOT_SLOT_A;
    g_boot_control.previous_slot = BOOT_SLOT_A;
    g_boot_control.pending_slot = BOOT_SLOT_INVALID;
    g_boot_control.trial_pending = 0U;
    g_boot_control.checksum = bootloader_control_checksum(&g_boot_control);
}

static bool bootloader_control_save(void)
{
    g_boot_control.checksum = bootloader_control_checksum(&g_boot_control);
    if (!ROM_erase_range(BOOT_PARAM_ADDR, BOOT_PARAM_SIZE)) {
        return false;
    }

    return ROM_buffer_write(BOOT_PARAM_ADDR, (const uint8_t *)&g_boot_control, sizeof(g_boot_control));
}

static void bootloader_control_load(void)
{
    memcpy(&g_boot_control, (const void *)BOOT_PARAM_ADDR, sizeof(g_boot_control));

    if ((g_boot_control.magic != BOOT_CONTROL_MAGIC) ||
        (g_boot_control.version != BOOT_CONTROL_VERSION) ||
        (g_boot_control.checksum != bootloader_control_checksum(&g_boot_control))) {
        bootloader_control_defaults();
        (void)bootloader_control_save();
    }
}

static uint32_t bootloader_slot_base(boot_slot_t slot)
{
    return bootloader_slot_address(slot);
}

static uint32_t bootloader_slot_limit(boot_slot_t slot)
{
    (void)slot;
    return BOOT_SLOT_SIZE;
}

static bool bootloader_validate_slot_record(boot_slot_t slot)
{
    boot_slot_record_t *record = &g_boot_control.slot[bootloader_slot_index(slot)];

    if ((record->valid == 0U) || (record->size == 0U) || (record->size > BOOT_SLOT_SIZE)) {
        return false;
    }

    uint32_t slot_addr = bootloader_slot_base(slot);
    uint32_t calculated_crc = bootloader_image_crc32(slot_addr, record->size);
    return (calculated_crc == record->crc32) && bootloader_vector_is_valid(slot_addr);
}

static bool bootloader_validate_slot_runtime(boot_slot_t slot)
{
    if (!bootloader_is_slot_valid(slot)) {
        return false;
    }

    if (bootloader_validate_slot_record(slot)) {
        return true;
    }

    return bootloader_vector_is_valid(bootloader_slot_base(slot));
}

static boot_slot_t bootloader_stable_slot(void)
{
    boot_slot_t stable = (g_boot_control.pending_slot <= BOOT_SLOT_B) ?
                         (boot_slot_t)g_boot_control.previous_slot :
                         (boot_slot_t)g_boot_control.active_slot;

    if (bootloader_is_slot_valid(stable) && bootloader_validate_slot_runtime(stable)) {
        return stable;
    }

    if (bootloader_validate_slot_runtime(BOOT_SLOT_A)) {
        return BOOT_SLOT_A;
    }

    if (bootloader_validate_slot_runtime(BOOT_SLOT_B)) {
        return BOOT_SLOT_B;
    }

    return BOOT_SLOT_INVALID;
}

static boot_slot_t bootloader_select_boot_slot(void)
{
    if (g_boot_control.pending_slot <= BOOT_SLOT_B) {
        boot_slot_t pending = (boot_slot_t)g_boot_control.pending_slot;
        boot_slot_t rollback = (boot_slot_t)g_boot_control.previous_slot;

        if (!bootloader_validate_slot_record(pending)) {
            g_boot_control.pending_slot = BOOT_SLOT_INVALID;
            g_boot_control.trial_pending = 0U;

            if (bootloader_validate_slot_runtime(rollback)) {
                g_boot_control.active_slot = rollback;
                g_boot_control.previous_slot = rollback;
            }

            (void)bootloader_control_save();
        } else if (g_boot_control.trial_pending != 0U) {
            g_boot_control.active_slot = pending;
            g_boot_control.trial_pending--;
            (void)bootloader_control_save();
            return pending;
        }

        if (bootloader_validate_slot_runtime(rollback)) {
            g_boot_control.active_slot = rollback;
            g_boot_control.pending_slot = BOOT_SLOT_INVALID;
            g_boot_control.previous_slot = rollback;
            g_boot_control.trial_pending = 0U;
            (void)bootloader_control_save();
            return rollback;
        }

        if (bootloader_validate_slot_runtime(pending)) {
            g_boot_control.active_slot = pending;
            g_boot_control.previous_slot = pending;
            g_boot_control.pending_slot = BOOT_SLOT_INVALID;
            g_boot_control.trial_pending = 0U;
            (void)bootloader_control_save();
            return pending;
        }
    }

    boot_slot_t active = (g_boot_control.active_slot <= BOOT_SLOT_B) ? (boot_slot_t)g_boot_control.active_slot : BOOT_SLOT_A;
    if (bootloader_validate_slot_runtime(active)) {
        return active;
    }

    boot_slot_t alternate = bootloader_other_slot(active);
    if (bootloader_validate_slot_runtime(alternate)) {
        g_boot_control.previous_slot = active;
        g_boot_control.active_slot = alternate;
        g_boot_control.pending_slot = BOOT_SLOT_INVALID;
        g_boot_control.trial_pending = 0U;
        (void)bootloader_control_save();
        return alternate;
    }

    return BOOT_SLOT_INVALID;
}

static void bootloader_jump_common(uint32_t slot_addr)
{
    uint32_t stack_pointer = *(volatile uint32_t *)slot_addr;
    uint32_t reset_handler = *(volatile uint32_t *)(slot_addr + 4U);

    __disable_irq();
    SysTick->CTRL = 0U;
    SysTick->LOAD = 0U;
    SysTick->VAL = 0U;

    for (uint32_t index = 0U; index < 8U; index++) {
        NVIC->ICER[index] = 0xFFFFFFFFU;
        NVIC->ICPR[index] = 0xFFFFFFFFU;
    }

    SCB->VTOR = slot_addr;
    __set_MSP(stack_pointer);

    ((void (*)(void))reset_handler)();
}

static void bootloader_parse_header(const uint8_t *payload, uint32_t payload_len, boot_image_info_t *info)
{
    memset(info, 0, sizeof(*info));

    uint32_t index = 0U;
    while ((index < payload_len) && (payload[index] != 0U) && (payload[index] != ' ')) {
        if (index < (sizeof(info->name) - 1U)) {
            info->name[index] = (char)payload[index];
        }
        index++;
    }
    info->name[sizeof(info->name) - 1U] = '\0';

    while ((index < payload_len) && ((payload[index] == 0U) || (payload[index] == ' '))) {
        index++;
    }

    char size_text[32];
    memset(size_text, 0, sizeof(size_text));
    uint32_t size_index = 0U;
    while ((index < payload_len) && (payload[index] != 0U) && (payload[index] != ' ') && (size_index < (sizeof(size_text) - 1U))) {
        size_text[size_index++] = (char)payload[index++];
    }
    info->size = (uint32_t)strtoul(size_text, NULL, 10);
}

static bool bootloader_receive_frame(uint8_t *frame, uint16_t *frame_len, uint32_t timeout_ms)
{
    uint32_t start = GetTick();

    while (usart1_rx_flag == 0U) {
        if ((GetTick() - start) >= timeout_ms) {
            return false;
        }
    }

    __disable_irq();
    *frame_len = usart1_rx_len;
    if (*frame_len >= MYDMA_USART1_RX_BUF_LEN) {
        *frame_len = MYDMA_USART1_RX_BUF_LEN - 1U;
    }

    memcpy(frame, (const void *)usart1_rx_buffer, *frame_len);
    frame[*frame_len] = 0U;
    USART1_ClearRxBuf();
    __enable_irq();

    return true;
}

static boot_status_t bootloader_ymodem_receive(boot_slot_t slot, boot_image_info_t *image_info)
{
    const uint32_t slot_addr = bootloader_slot_base(slot);
    const uint32_t slot_limit = bootloader_slot_limit(slot);
    ymodem_state_t state = YMODEM_WAIT_HEADER;
    static uint8_t frame[MYDMA_USART1_RX_BUF_LEN];
    uint32_t expected_sequence = 1U;
    uint32_t received_size = 0U;
    uint32_t expected_size = 0U;
    uint32_t image_crc = 0xFFFFFFFFU;
    uint8_t header_retry = 0U;
    uint8_t eot_seen = 0U;

    if (!ROM_erase_range(slot_addr, slot_limit)) {
        return BOOT_STATUS_FLASH;
    }

    USART1_ClearRxBuf();
    usart1_rx_flag = 0U;
    bootloader_send_char('C');

    while (state != YMODEM_DONE) {
        uint16_t frame_len = 0U;

        if (!bootloader_receive_frame(frame, &frame_len, 15000U)) {
            if (state == YMODEM_WAIT_HEADER) {
                if (header_retry++ < 5U) {
                    bootloader_send_char('C');
                    continue;
                }
            }
            return BOOT_STATUS_TIMEOUT;
        }

        if ((frame_len >= 2U) && (frame[0] == 0x18U) && (frame[1] == 0x18U)) {
            return BOOT_STATUS_CANCEL;
        }

        if ((frame_len == 1U) && (frame[0] == 0x04U)) {
            if (state == YMODEM_RECEIVE_DATA) {
                bootloader_send_byte(0x15U);
                state = YMODEM_WAIT_EOT;
                eot_seen = 1U;
                continue;
            }

            if ((state == YMODEM_WAIT_EOT) && (eot_seen != 0U)) {
                bootloader_send_byte(0x06U);
                bootloader_send_char('C');
                state = YMODEM_WAIT_END_PACKET;
                continue;
            }

            bootloader_send_byte(0x15U);
            continue;
        }

        if ((frame_len < 5U) || ((frame[0] != 0x01U) && (frame[0] != 0x02U))) {
            bootloader_send_byte(0x15U);
            continue;
        }

        uint32_t payload_len = (frame[0] == 0x01U) ? 128U : 1024U;
        uint32_t packet_len = payload_len + 5U;
        if (frame_len < packet_len) {
            bootloader_send_byte(0x15U);
            continue;
        }

        uint8_t sequence = frame[1];
        uint8_t sequence_inverse = frame[2];
        if ((uint8_t)(sequence ^ sequence_inverse) != 0xFFU) {
            bootloader_send_byte(0x15U);
            continue;
        }

        uint16_t received_crc = (uint16_t)((uint16_t)frame[packet_len - 2U] << 8) | frame[packet_len - 1U];
        uint16_t calculated_crc = bootloader_crc16_ccitt(&frame[3], payload_len);
        if (received_crc != calculated_crc) {
            bootloader_send_byte(0x15U);
            continue;
        }

        const uint8_t *payload = &frame[3];

        if ((state == YMODEM_WAIT_HEADER) && (sequence == 0U)) {
            bootloader_parse_header(payload, payload_len, image_info);
            expected_size = image_info->size;

            if ((expected_size == 0U) || (expected_size > BOOT_SLOT_SIZE)) {
                return BOOT_STATUS_RANGE;
            }

            image_crc = 0xFFFFFFFFU;
            expected_sequence = 1U;
            state = YMODEM_RECEIVE_DATA;
            bootloader_send_byte(0x06U);
            bootloader_send_char('C');
            continue;
        }

        if ((state == YMODEM_WAIT_END_PACKET) && (sequence == 0U) && (payload[0] == 0U)) {
            bootloader_send_byte(0x06U);
            state = YMODEM_DONE;
            continue;
        }

        if (state != YMODEM_RECEIVE_DATA) {
            bootloader_send_byte(0x15U);
            continue;
        }

        if (sequence == expected_sequence) {
            uint32_t remaining = expected_size - received_size;
            uint32_t chunk = (remaining > payload_len) ? payload_len : remaining;

            if (chunk > 0U) {
                image_crc = bootloader_crc32_update(image_crc, payload, chunk);

                if (!ROM_buffer_write(slot_addr + received_size, payload, chunk)) {
                    return BOOT_STATUS_FLASH;
                }

                received_size += chunk;
            }

            expected_sequence++;
            bootloader_send_byte(0x06U);

            if (received_size >= expected_size) {
                state = YMODEM_WAIT_EOT;
            }
            continue;
        }

        if (sequence == (uint8_t)(expected_sequence - 1U)) {
            bootloader_send_byte(0x06U);
            continue;
        }

        bootloader_send_byte(0x15U);
    }

    if (received_size != expected_size) {
        return BOOT_STATUS_PROTOCOL;
    }

    image_info->size = expected_size;
    image_info->crc32 = image_crc ^ 0xFFFFFFFFU;
    return BOOT_STATUS_OK;
}

static bool bootloader_apply_download_result(boot_slot_t slot, const boot_image_info_t *image_info)
{
    boot_slot_record_t *record = &g_boot_control.slot[bootloader_slot_index(slot)];
    uint32_t previous_active = (uint32_t)bootloader_stable_slot();
    uint32_t next_version = record->version + 1U;

    if (!bootloader_is_slot_valid((boot_slot_t)previous_active)) {
        previous_active = g_boot_control.active_slot;
    }

    memset(record, 0, sizeof(*record));
    record->valid = 1U;
    record->size = image_info->size;
    record->crc32 = image_info->crc32;
    record->version = next_version;
    strncpy(record->name, image_info->name, sizeof(record->name) - 1U);

    g_boot_control.previous_slot = previous_active;
    g_boot_control.active_slot = slot;
    g_boot_control.pending_slot = slot;
    g_boot_control.trial_pending = BOOT_TRIAL_ONCE;

    return bootloader_control_save();
}

void bootloader_init(void)
{
    bootloader_control_load();
    g_running_slot = BOOT_SLOT_INVALID;
}

void bootloader_print_status(void)
{
    boot_slot_t stable = bootloader_stable_slot();

    printf("\r\n[BOOT] active=%s pending=%s previous=%s stable=%s trial=%lu\r\n",
           bootloader_slot_name((boot_slot_t)g_boot_control.active_slot),
           bootloader_slot_name((boot_slot_t)g_boot_control.pending_slot),
           bootloader_slot_name((boot_slot_t)g_boot_control.previous_slot),
           bootloader_slot_name(stable),
           (unsigned long)g_boot_control.trial_pending);
    printf("[BOOT] slotA size=%lu crc=0x%08lX valid=%lu ver=%lu name=%s\r\n",
           (unsigned long)g_boot_control.slot[0].size,
           (unsigned long)g_boot_control.slot[0].crc32,
           (unsigned long)g_boot_control.slot[0].valid,
           (unsigned long)g_boot_control.slot[0].version,
           g_boot_control.slot[0].name);
    printf("[BOOT] slotB size=%lu crc=0x%08lX valid=%lu ver=%lu name=%s\r\n",
           (unsigned long)g_boot_control.slot[1].size,
           (unsigned long)g_boot_control.slot[1].crc32,
           (unsigned long)g_boot_control.slot[1].valid,
           (unsigned long)g_boot_control.slot[1].version,
           g_boot_control.slot[1].name);
}

boot_slot_t bootloader_get_download_slot(void)
{
    boot_slot_t stable = bootloader_stable_slot();

    if (stable == BOOT_SLOT_A) {
        return BOOT_SLOT_B;
    }

    if (stable == BOOT_SLOT_B) {
        return BOOT_SLOT_A;
    }

    if (!bootloader_validate_slot_runtime(BOOT_SLOT_A)) {
        return BOOT_SLOT_A;
    }

    return BOOT_SLOT_B;
}

boot_status_t bootloader_download_slot(boot_slot_t slot, boot_image_info_t *info)
{
    if (!bootloader_is_slot_valid(slot) || (info == NULL)) {
        return BOOT_STATUS_RANGE;
    }

    if (info->name[0] == '\0') {
        strncpy(info->name, "app.bin", sizeof(info->name) - 1U);
    }

    boot_status_t status = bootloader_ymodem_receive(slot, info);
    if (status != BOOT_STATUS_OK) {
        return status;
    }

    if (!bootloader_vector_is_valid(bootloader_slot_base(slot))) {
        return BOOT_STATUS_ERROR;
    }

    if (bootloader_image_crc32(bootloader_slot_base(slot), info->size) != info->crc32) {
        return BOOT_STATUS_CRC;
    }

    if (!bootloader_apply_download_result(slot, info)) {
        return BOOT_STATUS_FLASH;
    }

    return BOOT_STATUS_OK;
}

void bootloader_jump_to_slot(boot_slot_t slot)
{
    if (!bootloader_validate_slot_runtime(slot)) {
        printf("\r\n[BOOT] slot %u is invalid\r\n", (unsigned)slot);
        return;
    }

    g_running_slot = slot;
    bootloader_jump_common(bootloader_slot_base(slot));
}

void bootloader_commit_active_slot(void)
{
    bootloader_control_load();
    if (bootloader_is_slot_valid(g_running_slot)) {
        g_boot_control.active_slot = g_running_slot;
    } else if (g_boot_control.pending_slot <= BOOT_SLOT_B) {
        g_boot_control.active_slot = g_boot_control.pending_slot;
    }

    g_boot_control.previous_slot = g_boot_control.active_slot;
    g_boot_control.pending_slot = BOOT_SLOT_INVALID;
    g_boot_control.trial_pending = 0U;
    (void)bootloader_control_save();
}

bool bootloader_boot_default(void)
{
    boot_slot_t slot = bootloader_select_boot_slot();

    if (slot == BOOT_SLOT_INVALID) {
        return false;
    }

    bootloader_jump_to_slot(slot);
    return true;
}

static void bootloader_handle_command(char *command)
{
    command = (char *)bootloader_trim(command);
    bootloader_to_lower(command);

    if ((strcmp(command, "status") == 0) || (strcmp(command, "info") == 0)) {
        bootloader_print_status();
        return;
    }

    if ((strcmp(command, "help") == 0) || (strcmp(command, "?") == 0)) {
        printf("\r\nCommands: status, download, download a, download b, boot a, boot b, commit, rollback\r\n");
        return;
    }

    if (strcmp(command, "commit") == 0) {
        bootloader_commit_active_slot();
        printf("\r\n[BOOT] committed current slot\r\n");
        return;
    }

    if (strcmp(command, "rollback") == 0) {
        boot_slot_t rollback = (boot_slot_t)g_boot_control.previous_slot;
        if (bootloader_is_slot_valid(rollback)) {
            g_boot_control.active_slot = rollback;
            g_boot_control.pending_slot = BOOT_SLOT_INVALID;
            g_boot_control.trial_pending = 0U;
            (void)bootloader_control_save();
            printf("\r\n[BOOT] rollback to %s\r\n", bootloader_slot_name(rollback));
            bootloader_jump_to_slot(rollback);
            return;
        }

        printf("\r\n[BOOT] rollback slot invalid\r\n");
        return;
    }

    if (strcmp(command, "boot a") == 0) {
        bootloader_jump_to_slot(BOOT_SLOT_A);
        return;
    }

    if (strcmp(command, "boot b") == 0) {
        bootloader_jump_to_slot(BOOT_SLOT_B);
        return;
    }

    if ((strcmp(command, "download") == 0) || (strcmp(command, "ymodem") == 0)) {
        boot_slot_t target = bootloader_get_download_slot();
        boot_image_info_t info;

        memset(&info, 0, sizeof(info));
        printf("\r\n[BOOT] start YMODEM download to %s\r\n", bootloader_slot_name(target));
        boot_status_t status = bootloader_download_slot(target, &info);
        if (status == BOOT_STATUS_OK) {
            printf("\r\n[BOOT] download ok: %s size=%lu crc=0x%08lX\r\n", info.name, (unsigned long)info.size, (unsigned long)info.crc32);
            printf("[BOOT] jump to %s, call commit after app self-check\r\n", bootloader_slot_name(target));
            bootloader_jump_to_slot(target);
        } else {
            printf("\r\n[BOOT] download failed: %u\r\n", (unsigned)status);
        }
        return;
    }

    if ((strcmp(command, "download a") == 0) || (strcmp(command, "ymodem a") == 0)) {
        if (bootloader_stable_slot() == BOOT_SLOT_A) {
            printf("\r\n[BOOT] slotA is current stable app, use plain 'download' first\r\n");
            return;
        }

        boot_image_info_t info;
        memset(&info, 0, sizeof(info));
        printf("\r\n[BOOT] start YMODEM download to slotA\r\n");
        boot_status_t status = bootloader_download_slot(BOOT_SLOT_A, &info);
        if (status == BOOT_STATUS_OK) {
            printf("\r\n[BOOT] download ok: %s size=%lu crc=0x%08lX\r\n", info.name, (unsigned long)info.size, (unsigned long)info.crc32);
            printf("[BOOT] call commit after app self-check\r\n");
            bootloader_jump_to_slot(BOOT_SLOT_A);
        } else {
            printf("\r\n[BOOT] download failed: %u\r\n", (unsigned)status);
        }
        return;
    }

    if ((strcmp(command, "download b") == 0) || (strcmp(command, "ymodem b") == 0)) {
        if (bootloader_stable_slot() == BOOT_SLOT_B) {
            printf("\r\n[BOOT] slotB is current stable app, use plain 'download' first\r\n");
            return;
        }

        boot_image_info_t info;
        memset(&info, 0, sizeof(info));
        printf("\r\n[BOOT] start YMODEM download to slotB\r\n");
        boot_status_t status = bootloader_download_slot(BOOT_SLOT_B, &info);
        if (status == BOOT_STATUS_OK) {
            printf("\r\n[BOOT] download ok: %s size=%lu crc=0x%08lX\r\n", info.name, (unsigned long)info.size, (unsigned long)info.crc32);
            printf("[BOOT] call commit after app self-check\r\n");
            bootloader_jump_to_slot(BOOT_SLOT_B);
        } else {
            printf("\r\n[BOOT] download failed: %u\r\n", (unsigned)status);
        }
        return;
    }

    printf("\r\n[BOOT] unknown command: %s\r\n", command);
}

void bootloader_console(void)
{
    printf("\r\n[BOOT] console ready\r\n");
    printf("[BOOT] type 'help' for commands\r\n");
    printf("[BOOT] normal update path: send 'download', write inactive slot, commit after app self-check\r\n");
    bootloader_print_status();

    while (1) {
        if (usart1_rx_flag != 0U) {
            char command[USART1_RX_BUF_LEN];
            memcpy(command, (const void *)usart1_rx_buffer, sizeof(command));
            command[sizeof(command) - 1U] = '\0';
            USART1_ClearRxBuf();
            bootloader_handle_command(command);
        }
    }
}







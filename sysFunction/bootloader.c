#include "bootloader.h"

#include "crc_utils.h"
#include "ROM.h"
#include "ymodem.h"

#define BOOT_VECTOR_RELOC_SIZE  0x200U

static boot_control_block_t g_boot;
boot_slot_t g_running_slot = BOOT_SLOT_INVALID;


// 槽位名字只用于状态显示，别参与逻辑判断
static const char *slot_name(boot_slot_t slot)
{
    return (slot == BOOT_SLOT_A) ? "slotA" :
           (slot == BOOT_SLOT_B) ? "slotB" : "none";
}

// 根据槽位取 APP 起始地址
static uint32_t slot_addr(boot_slot_t slot)
{
    return (slot == BOOT_SLOT_B) ? BOOT_SLOT_B_ADDR : BOOT_SLOT_A_ADDR;
}

// A/B记录存在数组里，这里把枚举转成下标
static uint32_t slot_idx(boot_slot_t slot)
{
    return (slot == BOOT_SLOT_B) ? 1U : 0U;
}

//换solt
static boot_slot_t other_slot(boot_slot_t slot)
{
    return (slot == BOOT_SLOT_B) ? BOOT_SLOT_A : BOOT_SLOT_B;
}

//A/B
static bool slot_ok(boot_slot_t slot)
{
    return (slot == BOOT_SLOT_A) || (slot == BOOT_SLOT_B);
}


// 控制块校验只算 checksum 前面的字段
static uint32_t control_crc(const boot_control_block_t *control)
{
    return crc32_buffer((const uint8_t *)control, (uint32_t)offsetof(boot_control_block_t, checksum));
}

// 粗略判断 APP 向量表：栈顶要像 SRAM，复位入口要像 Flash 里的 Thumb 地址
static bool vector_ok(uint32_t addr)
{
    uint32_t sp = *(volatile uint32_t *)addr;
    uint32_t pc = *(volatile uint32_t *)(addr + 4U);

    if ((sp < 0x20000000U) || (sp > 0x20030000U) || ((sp & 3U) != 0U)) {
        return false;
    }

    if ((pc < ROM_FLASH_BASE) || (pc >= (ROM_FLASH_BASE + ROM_FLASH_SIZE)) || ((pc & 1U) == 0U)) {
        return false;
    }

    return true;
}

// APP 通常按 slotA 地址编译
// 同一个 bin 写到 slotB 后，复位入口可能仍指向 slotA，这里跳转前做一次地址换算
static uint32_t slot_reset_pc(boot_slot_t slot)
{
    uint32_t base = slot_addr(slot);
    uint32_t pc = *(volatile uint32_t *)(base + 4U);

    if ((slot == BOOT_SLOT_B) &&
        (pc >= BOOT_SLOT_A_ADDR) &&
        (pc < (BOOT_SLOT_A_ADDR + BOOT_SLOT_SIZE))) {
        pc = BOOT_SLOT_B_ADDR + (pc - BOOT_SLOT_A_ADDR);
    }

    return pc;
}


// 修正跳转到 B 的向量表
static void relocate_b_vectors(void)
{
    static uint8_t page_buf[ROM_PAGE_SIZE];

    // 第一页搬到 RAM 里
    memcpy(page_buf, (const void *)BOOT_SLOT_B_ADDR, sizeof(page_buf));

    for (uint32_t off = 4U; off < BOOT_VECTOR_RELOC_SIZE; off += 4U) {
        uint32_t val;

        memcpy(&val, &page_buf[off], sizeof(val));

        // 修正落在 slotA 范围内的函数入口
        if ((val >= BOOT_SLOT_A_ADDR) && (val < (BOOT_SLOT_A_ADDR + BOOT_SLOT_SIZE))) {
            uint32_t fixed = BOOT_SLOT_B_ADDR + (val - BOOT_SLOT_A_ADDR);
            memcpy(&page_buf[off], &fixed, sizeof(fixed));
        }
    }

// 改完后擦掉 B 槽第一页，再整页写回

    if (ROM_erase_range(BOOT_SLOT_B_ADDR, ROM_PAGE_SIZE)) {
        (void)ROM_buffer_write(BOOT_SLOT_B_ADDR, page_buf, sizeof(page_buf));
    }
}

// 参数区

// 参数区无效时的默认状态：先认为 A 是默认稳定槽
static void control_default(void)
{
    memset(&g_boot, 0, sizeof(g_boot));
    g_boot.magic = BOOT_CONTROL_MAGIC;
    g_boot.version = BOOT_CONTROL_VERSION;
    g_boot.active_slot = BOOT_SLOT_A;
    g_boot.previous_slot = BOOT_SLOT_A;
    g_boot.checksum = control_crc(&g_boot);
}

// 首次上电
static bool control_sanitize(void)
{
    bool changed = false;

    // active/previous 都必须是明确的 A/B
    if (!slot_ok((boot_slot_t)g_boot.active_slot)) {
        g_boot.active_slot = BOOT_SLOT_A;
        changed = true;
    }

    if (!slot_ok((boot_slot_t)g_boot.previous_slot)) {
        g_boot.previous_slot = g_boot.active_slot;
        changed = true;
    }

    for (uint32_t i = 0U; i < BOOT_SLOT_COUNT; i++) {
        boot_slot_record_t *rec = &g_boot.slot[i];

        // valid 只能是 0 或 1；擦除态 0xFFFFFFFF 直接当空记录处理
        if ((rec->valid != 0U) && (rec->valid != 1U)) {
            memset(rec, 0, sizeof(*rec));
            changed = true;
            continue;
        }

        // 请size/crc/version
        if ((rec->valid == 0U) &&
            ((rec->size != 0U) || (rec->crc32 != 0U) || (rec->version != 0U))) {
            memset(rec, 0, sizeof(*rec));
            changed = true;
            continue;
        }

        // 标记有效但大小错
        if ((rec->valid == 1U) && ((rec->size == 0U) || (rec->size > BOOT_SLOT_SIZE))) {
            memset(rec, 0, sizeof(*rec));
            changed = true;
        }
    }

    return changed;
}

// 保存控制块：先算校验，再擦参数页，再写回
static bool control_save(void)
{
    g_boot.checksum = control_crc(&g_boot);
    if (!ROM_erase_range(BOOT_PARAM_ADDR, BOOT_PARAM_SIZE)) {
        return false;
    }
    return ROM_buffer_write(BOOT_PARAM_ADDR, (const uint8_t *)&g_boot, sizeof(g_boot));
}

// 读取控制块：校验失败就恢复默认，绝不拿随机 Flash 字节当状态
static void control_load(void)
{
    bool need_save = false;

    //读
    memcpy(&g_boot, (const void *)BOOT_PARAM_ADDR, sizeof(g_boot));
    if ((g_boot.magic != BOOT_CONTROL_MAGIC) ||
        (g_boot.version != BOOT_CONTROL_VERSION) ||
        (g_boot.checksum != control_crc(&g_boot))) {
        control_default();
        need_save = true;
    }

    // 即使 checksum 对，也再清洗一次字段，防止旧版本结构留下脏值
    if (control_sanitize()) {
        need_save = true;
    }

    // 只有真的修过状态，才擦写参数页
    if (need_save) {
        control_save();
    }
}

// 启动选择

// 严格按记录校验：valid、size、向量表、CRC 都要过
static bool slot_record_ok(boot_slot_t slot)
{
    boot_slot_record_t *rec;

    if (!slot_ok(slot)) {
        return false;
    }

    rec = &g_boot.slot[slot_idx(slot)];
    if ((rec->valid != 1U) || (rec->size == 0U) || (rec->size > BOOT_SLOT_SIZE)) {
        return false;
    }

    return vector_ok(slot_addr(slot)) && (crc32_flash(slot_addr(slot), rec->size) == rec->crc32);
}

// 能启动/有完整记录/向量表
static bool slot_can_boot(boot_slot_t slot)
{
    return slot_ok(slot) && (slot_record_ok(slot) || vector_ok(slot_addr(slot)));
}

// 选择要启动的 APP，正常走 active，坏了就换另一个
static boot_slot_t boot_pick_and_save(void)
{
    boot_slot_t active = (boot_slot_t)g_boot.active_slot;
    boot_slot_t backup = other_slot(active);
    
    if (slot_can_boot(active)) {
        return active;
    }

    if (slot_can_boot(backup)) {
        return backup;
    }

    if (slot_can_boot(BOOT_SLOT_A)) {
        return BOOT_SLOT_A;
    }

    if (slot_can_boot(BOOT_SLOT_B)) {
        return BOOT_SLOT_B;
    }

    return BOOT_SLOT_INVALID;
}

// //////////////////////////跳转和下载结果////////////////////////////////////

//关中断、换向量表、换 MSP，然后调用 APP Reset_Handler
static void jump_raw(uint32_t addr, uint32_t pc)
{
    uint32_t sp = *(volatile uint32_t *)addr;

    __disable_irq();
    SysTick->CTRL = 0U;
    SysTick->LOAD = 0U;
    SysTick->VAL = 0U;

    for (uint32_t i = 0U; i < 8U; i++) {
        NVIC->ICER[i] = 0xFFFFFFFFU;
        NVIC->ICPR[i] = 0xFFFFFFFFU;
    }

    // VTOR 指向当前槽，所以 APP 不需要自己再设置中断向量表
    SCB->VTOR = addr;
    __set_MSP(sp);
    ((void (*)(void))pc)();
}

// 下载成功后更新solt记录
static bool save_download_result(boot_slot_t slot, const boot_image_info_t *info)
{
    boot_slot_record_t *rec = &g_boot.slot[slot_idx(slot)];
    uint32_t old_ver = rec->version;

    memset(rec, 0, sizeof(*rec));
    rec->valid = 1U;
    rec->size = info->size;
    rec->crc32 = info->crc32;
    rec->version = old_ver + 1U;
    strncpy(rec->name, info->name, sizeof(rec->name) - 1U);


    g_boot.previous_slot = slot;
    g_boot.active_slot = slot;
    return control_save();
}

////////////////////////////////////OLED//////////////////////////////////

// 简单阻塞延时，只用于下载结果停留一会儿
static void boot_delay_ms(uint32_t ms)
{
    uint32_t start = GetTick();

    while ((GetTick() - start) < ms) {
    }
}

// 等待 YMODEM 发送
static void show_download_wait(boot_slot_t slot)
{
    OLED_Clear();
    OLED_Printf(0, 0, 16, "YMODEM WAIT");
    OLED_Printf(0, 16, 16, "%s", slot_name(slot));
    OLED_Refresh();
}

// 下载结束后的简短结果页：状态码、最后帧信息、接收进度
static void show_download_result(boot_slot_t slot, boot_status_t ret, const boot_image_info_t *info)
{
    (void)slot;
    (void)info;
    OLED_Clear();
    OLED_Printf(0, 0, 16, "T%u R%lu B%lu",
                (unsigned)ret,
                (unsigned long)ymodem_debug_raw_len,
                (unsigned long)ymodem_debug_bad);
    OLED_Printf(0, 16, 16, "%lu/%lu",
                (unsigned long)ymodem_debug_recv,
                (unsigned long)ymodem_debug_expect);
    OLED_Refresh();
}

///////////////////////////////////// 对外接口///////////////////////////////////////////

// bootloader 初始化：读取并修正参数区状态
void bootloader_init(void)
{
    control_load();
    g_running_slot = BOOT_SLOT_INVALID;
}

// 正常启动
bool bootloader_boot_default(void)
{
    boot_slot_t slot = boot_pick_and_save();

    if (!slot_ok(slot)) {
        return false;
    }

    bootloader_jump_to_slot(slot);
    return true;
}

// 调试用状态打印
void bootloader_print_status(void)
{
    printf("\r\n[BOOT] active=%s prev=%s\r\n",
           slot_name((boot_slot_t)g_boot.active_slot),
           slot_name((boot_slot_t)g_boot.previous_slot));
    printf("[BOOT] A valid=%lu size=%lu ver=%lu\r\n",
           (unsigned long)g_boot.slot[0].valid,
           (unsigned long)g_boot.slot[0].size,
           (unsigned long)g_boot.slot[0].version);
    printf("[BOOT] B valid=%lu size=%lu ver=%lu\r\n",
           (unsigned long)g_boot.slot[1].valid,
           (unsigned long)g_boot.slot[1].size,
           (unsigned long)g_boot.slot[1].version);
}

// 选择本次下载目标槽
boot_slot_t bootloader_get_download_slot(void)
{
    boot_slot_t active = (boot_slot_t)g_boot.active_slot;

    // 空板写 slotA；之后，下另一边
    if (slot_ok(active) && slot_can_boot(active)) {
        return other_slot(active);
    }

    if (slot_can_boot(BOOT_SLOT_A)) {
        return BOOT_SLOT_B;
    }

    if (slot_can_boot(BOOT_SLOT_B)) {
        return BOOT_SLOT_A;
    }

    return BOOT_SLOT_A;
}

// 下载一个 APP 到指定槽，并做向量表、CRC、槽记录这些收尾
boot_status_t bootloader_download_slot(boot_slot_t slot, boot_image_info_t *info)
{
    boot_status_t ret;

    if (!slot_ok(slot) || (info == NULL)) {
        return BOOT_STATUS_RANGE;
    }

    // YMODEM 负责收文件和写入 slot 对应 Flash
    ret = ymodem_receive_image(slot_addr(slot), BOOT_SLOT_SIZE, info);
    if (ret != BOOT_STATUS_OK) {
        return ret;
    }

    // b补向量表
    if (slot == BOOT_SLOT_B) {
        relocate_b_vectors();
        info->crc32 = crc32_flash(slot_addr(slot), info->size);
    }

    // 起始向量不对，下载了也不跳
    if (!vector_ok(slot_addr(slot))) {
        return BOOT_STATUS_ERROR;
    }

    // 整体算一遍 Flash CRC
    if (crc32_flash(slot_addr(slot), info->size) != info->crc32) {
        return BOOT_STATUS_CRC;
    }

    // 更新参数区
    if (!save_download_result(slot, info)) {
        return BOOT_STATUS_FLASH;
    }

    return BOOT_STATUS_OK;
}

// 跳转到app,设置 VTOR/MSP
void bootloader_jump_to_slot(boot_slot_t slot)
{
    uint32_t pc;

    if (!slot_can_boot(slot)) {
        printf("\r\n[BOOT] %s invalid\r\n", slot_name(slot));
        return;
    }

    pc = slot_reset_pc(slot);
    g_running_slot = slot;
    jump_raw(slot_addr(slot), pc);
}
// 自动升级入口：等待 YMODEM，成功跳新槽，失败回旧槽
void bootloader_console(void)
{
    // 名字先保留给旧调用者；现在它实际是“等待 YMODEM 升级”
    while (1) {
        boot_image_info_t info;
        boot_slot_t slot = bootloader_get_download_slot();
        boot_status_t ret;

        memset(&info, 0, sizeof(info));

        // 进入 bootloader 后直接等 YMODEM，不再要求输入 download 命令
        //
        show_download_wait(slot);
        ret = bootloader_download_slot(slot, &info);
        show_download_result(slot, ret, &info);

        // 成功
        if (ret == BOOT_STATUS_OK) 
        {
            boot_delay_ms(2000U);
            bootloader_jump_to_slot(slot);
        } 
        else
        {
            boot_delay_ms(2000U);
            (void)bootloader_boot_default();
        }
    }
}

#include "file_mgr.h"
#include "ROM.h"
#include "ff.h"
#include "diskio.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>




FIL fdst;
FATFS fs;
UINT br = 0, bw = 0;


void file_mgr_init(void)
{
	uint16_t k = 5;
	DSTATUS stat = 0;
	uint8_t app_buf[app_buf_size];
	FRESULT res;

	do
	{
		stat = disk_initialize(0); 			//初始化SD卡
	} while ((stat != 0) && (--k));			//如果初始化失败，重试最多k次。

	f_mount(0, &fs);						 //挂载SD卡的文件系统（设备号0）。
	f_close(&fdst);						 //关闭文件对象fdst，确保它处于未打开状态。
	if (stat == 0)						 //返回挂载结果（FR_OK 表示成功）。
	{
		res = f_open(&fdst, "0:/Task.bin", FA_READ); //以只读模式打开bootloader.bin文件
		if (res != FR_OK)					 //检查文件是否成功打开，如果失败，返回错误代码。
		{
			printf("Failed to open file: %d\n", res);
			return;
		}

		uint32_t br_temp = 0;
		br = 0;
		bool erase_ok = ROM_erase_range(APP_FLASH_ADDR, APP_FLASH_SIZE); //擦除应用槽
		if (!erase_ok) {
			printf("Failed to erase app flash range\r\n");
			f_close(&fdst);
			return;
		}

		OLED_Printf(0, 16, 16, "ERASE:0");
		OLED_Refresh();

		while (1)
		{
			// 1. 读取数据
			res = f_read(&fdst, app_buf, app_buf_size, &br);

			// 2. 读取失败 → 退出
			if (res != FR_OK) {
				break;
			}

			// 3. 读到 0 字节 → 文件读完 → 退出
			if (br == 0) {
				break;
			}

			// 4. 只有读到有效数据，才写入Flash
			if (!ROM_buffer_write(APP_FLASH_ADDR + br_temp, app_buf, br)) {
				printf("Flash write failed at offset %lu\r\n", (unsigned long)br_temp);
				break;
			}

			// 5. 累计已读取长度
			br_temp += br;

			// 显示进度
			OLED_Printf(0, 0, 16, "READ:%d", br);
			OLED_Refresh();
		}

		f_close(&fdst); //关闭文件
	}
}
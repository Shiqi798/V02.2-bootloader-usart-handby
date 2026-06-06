# CIMC Bootloader Handoff

## Current Goal

This project now implements the CIMC preliminary Bootloader path for the USART1 RS485 upgrade flow.

- USART: USART1 over RS485
- Baud rate used by this Bootloader build: 115200
- RS485 direction pin: PE8, high for TX and low for RX
- Default device id: 0x0001
- Default baud code: 0x14

## Flash Layout

| Region | Start | End | Size |
| --- | --- | --- | --- |
| Bootloader | 0x08000000 | 0x0800FFFF | 64K |
| Parameter | 0x08010000 | 0x08010FFF | 4K |
| App | 0x08011000 | 0x08030FFF | 128K |
| App backup | 0x08031000 | 0x08050FFF | 128K |
| Firmware staging | 0x08051000 | 0x08070FFF | 128K |

## Parameter Block

The Bootloader owns the first record at `0x08010000`.

```c
typedef struct {
    uint32_t magic;      /* 0x424F4F54 */
    uint16_t device_id;  /* default 0x0001 */
    uint8_t baud_code;   /* default 0x14 */
    uint8_t boot_flag;   /* default 0x00 */
    uint32_t checksum;   /* CRC32 over the previous fields */
} boot_param_t;
```

`baud_code` mapping:

- `0x11`: 4800
- `0x12`: 9600
- `0x13`: 19200
- `0x14`: 115200

`boot_flag` mapping:

- `0x00`: normal boot; Bootloader waits silently and jumps to App.
- `0xA5`: upgrade mode; Bootloader prints the 10 second wait prompt and accepts upgrade commands.
- Any other value is treated as invalid and the parameter block is reset to defaults.

## Protocol Supported In Bootloader

Frames are ASCII hex representations of the binary frame:

`A5B6 + device_id + type + command + length + version + content + crc16_modbus + B6A5`

Current Bootloader commands:

- `0x0111`: query device id, replies with the persisted `device_id`.
- `0x0112`: query baud code, replies with the persisted `baud_code`.
- `0x0502`: prepare firmware transfer. After this frame, send the raw `.bin` file. The Bootloader stores it in the staging region and verifies the magic word.
- `0x0503`: execute upgrade. The Bootloader replies OK first, backs up the current App, copies staged firmware into the App region, clears `boot_flag`, and jumps to App.
- Heartbeat broadcast `type=0x05, command=0xFFFF`: replies with `type=0x05, command=0x8888`.

The firmware package magic is the first four bytes:

`5A A5 C3 3C`

The actual Cortex-M vector table starts at offset `+4` in the provided `.bin`. During execution, the Bootloader copies data from `staging + 4` to `0x08011000`.

## Test Notes

1. Build the Bootloader and confirm the image fits in 64K.
2. Erase the parameter sector or use a fresh device; first boot should create defaults.
3. Query `0x0111`; expected content is `0001`.
4. Query `0x0112`; expected content is `14`.
5. Enter Bootloader manually with PE15 held low, or set `boot_flag` to `0xA5` from the App and soft reset.
6. Send `0x0502`, wait about 500 ms, then send the CIMC V1/V2 `.bin` file as raw bytes.
7. After the Bootloader replies OK to `0x0502`, send `0x0503`.
8. After upgrade, the provided CIMC firmware should run from `0x08011000` and report ID `0008` at 115200.

## Remaining APP Work

The APP side still needs to share this parameter layout if it wants to trigger upgrades automatically. For the contest flow, APP should handle the upgrade request command, reply OK, write `boot_flag = 0xA5` using the same checksum rule, then soft reset into Bootloader.

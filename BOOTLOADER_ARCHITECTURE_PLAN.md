# Bootloader Architecture Plan

## Current Purpose

This is the live design and progress document for the CIMC Bootloader architecture cleanup.

It records what will be changed, what has already changed, known issues, and the next planned step. Update this file before and after each architecture-related implementation round.

## Goals And Boundaries

- Scope: only the current Bootloader project under `V02.2 bootloader-usart handby`.
- Out of scope: APP architecture, APP source migration, and importing files from sibling APP projects.
- Target architecture: organize Bootloader code according to the contest layering rule: `Driver / Protocol / Function`.
- Safety rule: do not delete, move, or remove old files from project references unless a separate cleanup plan is written and confirmed first.
- Migration rule: use copy-first and switch-later. New layered files may be added first; old working files remain until the new path is built and tested.

## Current Architecture Snapshot

Current entry flow:

`User/main.c -> sysFunction_Init() -> sysFunction_loop() -> bootloader_console()`

Current core files:

- `sysFunction/bootloader.c`: Bootloader parameter loading, protocol parsing, frame building, firmware staging, upgrade execution, OLED display, and App jump logic are currently mixed in one file.
- `sysFunction/bootloader.h`: Flash layout, parameter structure, boot flags, and public Bootloader entry APIs.
- `sysFunction/raw_download.c`: raw `.bin` receiving path after `0x0502`.
- `sysFunction/crc_utils.c`: CRC32 and CRC16 helpers.
- `Driver/HardWare/USART`: USART1 RS485 send/receive path and DMA-backed `printf`.
- `Driver/HardWare/ROM`: internal Flash erase/write/read helpers.
- `Driver/HardWare/OLED`: OLED display driver.
- `Driver/System/myDMA`: USART1 TX/RX DMA and ADC DMA helpers.

Current project state:

- Keil project: `project/TASK.uvprojx`.
- VS EIDE project: `project/vs eide/.eide/eide.yml`.
- Build base address: `0x08000000`.
- USART path: USART1 over RS485.
- OLED Bootloader display required by contest: first line `2026639584`, second line `Bootloader`.

Current Flash layout:

| Region | Start | End | Size |
| --- | --- | --- | --- |
| Bootloader | `0x08000000` | `0x0800FFFF` | 64K |
| Parameter | `0x08010000` | `0x08010FFF` | 4K |
| App | `0x08011000` | `0x08030FFF` | 128K |
| App backup | `0x08031000` | `0x08050FFF` | 128K |
| Firmware staging | `0x08051000` | `0x08070FFF` | 128K |

## Target Architecture Design

Layer dependency direction:

`Function -> Protocol -> Driver`

No reverse dependency should be introduced.

### Driver

Purpose: hardware drivers only.

Allowed content:

- USART1 RS485 send/receive and direction control.
- DMA configuration and buffer reset.
- OLED drawing primitives.
- ROM/internal Flash write and erase helpers.

Not allowed:

- Protocol command dispatch.
- Frame parsing or frame building.
- Bootloader upgrade decisions.

### Protocol

Purpose: contest frame parsing and response building.

Planned responsibilities:

- ASCII HEX to raw frame conversion.
- Raw frame validation.
- CRC16-Modbus calculation for protocol frames.
- Address filtering, including broadcast address handling.
- Response, OK, error, and heartbeat frame building.
- Public interface for waiting for one frame and sending Bootloader protocol responses.

Planned initial files:

- `Protocol/boot_protocol.c`
- `Protocol/boot_protocol.h`

### Function

Purpose: Bootloader business flow.

Planned responsibilities:

- Parameter block defaults, validation, load, and save.
- Boot flag handling.
- Bootloader start window and App jump flow.
- OLED Bootloader state display.
- Firmware staging, magic/vector validation, backup, copy, restore, and jump.
- Raw binary receiving coordination.

Planned initial files:

- `Function/boot_param.c`
- `Function/boot_param.h`
- `Function/boot_upgrade.c`
- `Function/boot_upgrade.h`
- `Function/boot_app.c`
- `Function/boot_app.h`

## Implementation Phases

| Phase | Goal | Status |
| --- | --- | --- |
| Phase 0 | Create this live architecture plan. No code change. | Done |
| Phase 1 | Add `Protocol` files and copy protocol parsing/building logic. Do not switch project references yet. | Pending |
| Phase 2 | Add `Function` files and copy parameter/upgrade/jump logic. Do not delete `sysFunction/bootloader.c`. | Pending |
| Phase 3 | Switch Keil and VS EIDE references to the new layered files. Verify build. | Pending |
| Phase 4 | Run Bootloader behavior regression tests and record issues. | Pending |
| Phase 5 | If cleanup is needed, write a separate deletion/removal plan and wait for confirmation. | Pending |

## Update Rule

Before each implementation round:

- Add a new entry in `Round Plans`.
- Write the files to be changed.
- Write the reason for the change.
- Write the files and behavior that must not be touched.

After each implementation round:

- Update `Implementation Phases`.
- Add a new entry in `Change Log`.
- Update `Known Issues`.
- Record build and test results.

Deletion, movement, project target rename, or old-file removal must be handled as a separate plan and must not be performed silently.

## Round Plans

### 2026-06-07 - Phase 0 Documentation

Planned files:

- Add `BOOTLOADER_ARCHITECTURE_PLAN.md`.

Reason:

- Establish a single place to track Bootloader architecture design, implementation progress, known issues, and future changes.

Not touched:

- No C source files.
- No header files.
- No Keil or VS EIDE project files.
- No APP files or sibling projects.

## Known Issues

| Date | Issue | Impact | Status | Related Files |
| --- | --- | --- | --- | --- |
| 2026-06-07 | `BOOTLOADER_HANDOFF.md` says parameter checksum is CRC32, but current Bootloader code uses CRC16-Modbus cast to `uint32_t`. | Documentation and implementation may confuse future APP/Bootloader parameter sharing. | Open | `BOOTLOADER_HANDOFF.md`, `sysFunction/bootloader.c`, `sysFunction/bootloader.h` |
| 2026-06-07 | `sysFunction/bootloader.c` mixes protocol, parameter, upgrade, display, and App jump logic. | Hard to maintain and does not match contest `Driver / Protocol / Function` layering. | Open | `sysFunction/bootloader.c` |

## Change Log

| Date | Purpose | Files Changed | Verification | Remaining Work |
| --- | --- | --- | --- | --- |
| 2026-06-07 | Establish live architecture plan. | `BOOTLOADER_ARCHITECTURE_PLAN.md` | File created in project root. No build needed because no code changed. | Start Phase 1 protocol extraction plan. |


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
| Phase 1 | Add `Protocol` files and copy protocol parsing/building logic. Do not switch project references yet. | Done |
| Phase 2 | Add `Function` files and copy parameter/upgrade/jump logic. Do not delete `sysFunction/bootloader.c`. | Done |
| Phase 3 | Switch Keil and VS EIDE references to the new layered files. Verify build. | Done |
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

### 2026-06-07 - Phase 1 Protocol Skeleton

Planned files:

- Add `Protocol/boot_protocol.h`.
- Add `Protocol/boot_protocol.c`.

Reason:

- Copy ASCII HEX frame parsing, device ID filtering, CRC16 frame check, and response building into a standalone Protocol layer.
- Keep the current Bootloader behavior available in `sysFunction/bootloader.c` until the new layer is compiled and tested.

Not touched:

- Do not edit `sysFunction/bootloader.c` in this round.
- Do not change `project/TASK.uvprojx`.
- Do not change `project/vs eide/.eide/eide.yml`.
- Do not delete, move, or remove any old files.
- Do not touch APP files.

### 2026-06-07 - Phase 1 Protocol Constant Fix

Planned files:

- Update `Protocol/boot_protocol.h`.
- Update `BOOTLOADER_ARCHITECTURE_PLAN.md`.

Reason:

- During Phase 2 review, the new Protocol skeleton was found to have draft frame constants that do not match current `sysFunction/bootloader.c`.
- Fix Protocol constants to mirror the currently working Bootloader before any Function layer starts depending on them.

Not touched:

- Do not edit `sysFunction/bootloader.c`.
- Do not change Keil or VS EIDE project references.
- Do not delete, move, or remove any old files.

### 2026-06-07 - Phase 2 Boot Parameter Layer

Planned files:

- Add `Function/boot_param.h`.
- Add `Function/boot_param.c`.
- Update `BOOTLOADER_ARCHITECTURE_PLAN.md`.

Reason:

- Move Bootloader parameter block rules into the Function layer first: defaults, value validation, checksum, load, save, and boot flag update.
- Keep the current working implementation in `sysFunction/bootloader.c` until the new layer is compiled and switched in a later phase.

Not touched:

- Do not edit `sysFunction/bootloader.c` in this round.
- Do not change Keil or VS EIDE project references.
- Do not delete, move, or remove any old files.
- Do not touch APP files.

### 2026-06-07 - Phase 2 App Jump And Upgrade Layer

Planned files:

- Add `Function/boot_app.h`.
- Add `Function/boot_app.c`.
- Add `Function/boot_upgrade.h`.
- Add `Function/boot_upgrade.c`.
- Update `BOOTLOADER_ARCHITECTURE_PLAN.md`.

Reason:

- Copy App vector validation and raw jump into a small Function module.
- Copy firmware staging, backup, Flash copy, compare, restore, and execute-upgrade flow into an upgrade Function module.
- Keep `sysFunction/bootloader.c` unchanged until the layered implementation is wired and compiled in a later phase.

Not touched:

- Do not edit `sysFunction/bootloader.c` in this round.
- Do not change Keil or VS EIDE project references.
- Do not delete, move, or remove any old files.
- Do not touch APP files.

### 2026-06-07 - Phase 2 Boot Flow Layer

Planned files:

- Add `Function/boot_flow.h`.
- Add `Function/boot_flow.c`.
- Update `BOOTLOADER_ARCHITECTURE_PLAN.md`.

Reason:

- Copy Bootloader console/state flow into the Function layer and make it call the new `boot_param`, `boot_protocol`, `boot_upgrade`, and `boot_app` modules.
- Keep behavior aligned with the current working flow: 10 second wait prompt, query ID/baud, heartbeat response, `0502` raw download, bad-frame suppression after raw download, `0503` OK-before-copy, and default App jump/backup restore.

Not touched:

- Do not edit `sysFunction/bootloader.c` in this round.
- Do not change Keil or VS EIDE project references.
- Do not delete, move, or remove any old files.
- Do not touch APP files.

### 2026-06-07 - Protocol Heartbeat Helper Fix

Planned files:

- Update `Protocol/boot_protocol.c`.
- Update `BOOTLOADER_ARCHITECTURE_PLAN.md`.

Reason:

- While checking the new Boot flow, `boot_proto_send_heartbeat()` was found to send a response frame. Current working `sysFunction/bootloader.c` sends heartbeat replies with frame type `HEART`.
- Fix the helper before any future switch to the new flow.

Not touched:

- Do not edit `sysFunction/bootloader.c`.
- Do not change Keil or VS EIDE project references.

### 2026-06-07 - Phase 3 Layer Wiring

Planned files:

- Update `sysFunction/bootloader.c`.
- Update `project/TASK.uvprojx`.
- Update `project/vs eide/.eide/eide.yml`.
- Update `BOOTLOADER_ARCHITECTURE_PLAN.md`.

Reason:

- Keep the old public Bootloader entry API, but turn `sysFunction/bootloader.c` into a thin wrapper around `boot_flow`.
- Add `Function` and `Protocol` source/header paths to Keil and VS EIDE so the new layered files can compile.
- Preserve current `User/main.c -> sysFunction_Init() -> sysFunction_loop() -> bootloader_*` entry flow.

Not touched:

- Do not delete `sysFunction/bootloader.c`.
- Do not delete or move any old source file.
- Do not edit `User/main.c`.
- Do not edit `sysFunction/Function.c`.
- Do not touch APP files.

### 2026-06-07 - Protocol CRC Ownership

Planned files:

- Add `Protocol/boot_crc.h`.
- Add `Protocol/boot_crc.c`.
- Update `Protocol/boot_protocol.c`.
- Update `Function/boot_param.c`.
- Update `sysFunction/raw_download.c`.
- Update `project/TASK.uvprojx`.
- Update `project/vs eide/.eide/eide.yml`.
- Update `BOOTLOADER_ARCHITECTURE_PLAN.md`.

Reason:

- The target architecture says CRC belongs to Protocol, but the new layered path still calls `sysFunction/crc_utils.*`.
- Add Protocol-owned CRC helpers with `boot_crc*` names and switch current Bootloader callers to them.
- Keep old `sysFunction/crc_utils.*` in place until a separate cleanup/removal plan is confirmed.

Not touched:

- Do not delete `sysFunction/crc_utils.c`.
- Do not delete `sysFunction/crc_utils.h`.
- Do not remove old project references in this round.
- Do not touch APP files.

### 2026-06-07 - ROM Warning Cleanup

Planned files:

- Update `Driver/HardWare/ROM/ROM.c`.
- Update `BOOTLOADER_ARCHITECTURE_PLAN.md`.

Reason:

- Keil full rebuild is clean except for `ROM.c(24)`: `rom_sector_ctl_from_addr` is compiled on GD32F470 but only used in the non-page-erase branch.
- Guard the sector table/helper with the same chip-family condition used by erase code.

Not touched:

- Do not change Flash erase behavior for GD32F470.
- Do not delete ROM APIs.
- Do not touch APP files.

### 2026-06-07 - Phase 4 Regression Checklist

Planned files:

- Update `BOOTLOADER_ARCHITECTURE_PLAN.md`.

Reason:

- The layered Bootloader now builds in Keil, so the next proof is board/protocol regression.
- Record the exact checks before running them on hardware.

Not touched:

- No C source changes in this checklist step.
- No project file changes in this checklist step.
- Do not mark hardware behavior as passed until it is tested on board.

### 2026-06-07 - Bootloader Public Header Decoupling

Planned files:

- Update `sysFunction/bootloader.h`.
- Update Function source files that relied on `bootloader.h -> HeaderFiles.h`.
- Update `BOOTLOADER_ARCHITECTURE_PLAN.md`.

Reason:

- `bootloader.h` is now the public Bootloader type/API header, but it still includes `HeaderFiles.h`, which pulls Driver, Function, and old CRC headers into every new layer header.
- Replace the total-header include with standard integer/bool headers and make source files include or declare only what they use.

Not touched:

- Do not change public Bootloader API names.
- Do not edit `User/main.c`.
- Do not delete `HeaderFiles.h`.
- Do not delete old files or project references.

### 2026-06-07 - myDMA Header Decoupling

Planned files:

- Update `Driver/System/myDMA.h`.
- Update `Protocol/boot_protocol.c`.
- Update `sysFunction/raw_download.c`.
- Update `BOOTLOADER_ARCHITECTURE_PLAN.md`.

Reason:

- `myDMA.h` only needs DMA types and integer types, but currently includes `HeaderFiles.h`.
- Make `myDMA.h` usable from Protocol/raw-download code without pulling in the total header.
- Replace hand-written DMA externs in callers with the actual Driver header.

Not touched:

- Do not change DMA register configuration.
- Do not change USART1 RX DMA buffer size.
- Do not delete old files or project references.

### 2026-06-07 - USART Header Decoupling

Planned files:

- Update `Driver/HardWare/USART/USART.h`.
- Update `Driver/HardWare/USART/USART.c`.
- Update `Protocol/boot_protocol.c`.
- Update `Function/boot_flow.c`.
- Update `sysFunction/raw_download.c`.
- Update `BOOTLOADER_ARCHITECTURE_PLAN.md`.

Reason:

- `USART.h` still includes `HeaderFiles.h`, but Protocol/Function only need USART state variables and small Driver APIs.
- Make USART Driver header usable without pulling in the total project header.
- Replace hand-written USART externs in new layers with the official Driver header.

Not touched:

- Do not change USART1 baud rate or RS485 direction behavior.
- Do not change USART DMA send/receive logic.
- Do not delete old files or project references.

## Known Issues

| Date | Issue | Impact | Status | Related Files |
| --- | --- | --- | --- | --- |
| 2026-06-07 | `BOOTLOADER_HANDOFF.md` says parameter checksum is CRC32, but current Bootloader code uses CRC16-Modbus cast to `uint32_t`. | Documentation and implementation may confuse future APP/Bootloader parameter sharing. | Open | `BOOTLOADER_HANDOFF.md`, `sysFunction/bootloader.c`, `sysFunction/bootloader.h` |
| 2026-06-07 | `sysFunction/bootloader.c` mixes protocol, parameter, upgrade, display, and App jump logic. | Hard to maintain and does not match contest `Driver / Protocol / Function` layering. | Open | `sysFunction/bootloader.c` |
| 2026-06-07 | Worktree reports `BOOTLOADER_HANDOFF.md` as deleted, source of deletion unknown. | Handoff note is not visible from the project root until restored or recreated. | Open | `BOOTLOADER_HANDOFF.md` |
| 2026-06-07 | `project/vs eide/.eide/eide.yml` currently lists `../../Protocol` in `srcDirs` even though Phase 1 plan said not to switch project references yet. | VS EIDE may try to compile the new Protocol skeleton earlier than planned. | Resolved in Phase 3: `srcDirs` restored to `[]`, new files are listed explicitly. | `project/vs eide/.eide/eide.yml`, `Protocol/boot_protocol.c` |
| 2026-06-07 | Keil build still reports one old warning: `ROM.c(24)`, `rom_sector_ctl_from_addr` declared but not referenced. | Does not block Phase 3 wiring, but the build is not warning-clean. | Resolved: sector helper/table are now compiled only for non-page-erase chips; Keil rebuild is `0 Warning(s)`. | `Driver/HardWare/ROM/ROM.c` |
| 2026-06-07 | Keil command-line build updated many `project/Objects` and `project/Listings` generated files. | Worktree is noisy after verification. Keep or clean should be decided intentionally. | Open | `project/Objects`, `project/Listings` |
| 2026-06-07 | Old `sysFunction/crc_utils.*` is still present and still listed in the projects, although current layered Bootloader callers use `Protocol/boot_crc.*`. | Source ownership is improved, but old CRC files remain as cleanup debt. Removing references/files should be handled by a separate cleanup plan. | Open | `sysFunction/crc_utils.c`, `sysFunction/crc_utils.h`, `Protocol/boot_crc.c`, `Protocol/boot_crc.h` |
| 2026-06-07 | Phase 4 board/protocol regression has not been run after layering. | Build proves compile/link only; runtime behavior still needs hardware verification. | Open | OLED, USART1 RS485, `0111/0112`, `0502/0503`, Flash upgrade flow |
| 2026-06-07 | Old Driver and sysFunction headers still depend heavily on `HeaderFiles.h`. | New Bootloader layer is less coupled, but full project-wide header cleanup remains outside the current safe change. | Open | `Driver/HeaderFiles/HeaderFiles.h`, `Driver/HardWare/*`, `Driver/System/*`, `sysFunction/Function.h` |

## Change Log

| Date | Purpose | Files Changed | Verification | Remaining Work |
| --- | --- | --- | --- | --- |
| 2026-06-07 | Establish live architecture plan. | `BOOTLOADER_ARCHITECTURE_PLAN.md` | File created in project root. No build needed because no code changed. | Start Phase 1 protocol extraction plan. |
| 2026-06-07 | Add Protocol layer skeleton. | `BOOTLOADER_ARCHITECTURE_PLAN.md`, `Protocol/boot_protocol.h`, `Protocol/boot_protocol.c` | New files created. Keil/VS EIDE references intentionally not changed, so no build result is claimed for this round. | Start Phase 2 Function layer copy plan. |
| 2026-06-07 | Fix Protocol skeleton constants to match current Bootloader. | `BOOTLOADER_ARCHITECTURE_PLAN.md`, `Protocol/boot_protocol.h` | Constants now mirror `sysFunction/bootloader.c`: version `0x02`, CMD `0x01`, RESP `0x02`, HEART `0x05`, ERROR `0xFF`. | Later switch command dispatch to Protocol layer. |
| 2026-06-07 | Add Function parameter layer skeleton. | `BOOTLOADER_ARCHITECTURE_PLAN.md`, `Function/boot_param.h`, `Function/boot_param.c` | New files created. Existing `sysFunction/bootloader.c` and Keil project references were not edited. | Continue Phase 2 with App jump and upgrade flow copy. |
| 2026-06-07 | Add Function App jump and upgrade skeleton. | `BOOTLOADER_ARCHITECTURE_PLAN.md`, `Function/boot_app.h`, `Function/boot_app.c`, `Function/boot_upgrade.h`, `Function/boot_upgrade.c` | New files created. Checked Chinese comments by UTF-8 line read; no comment/code line sticking. Checked jump cleanup, image magic, Flash addresses, and copy chunk against `sysFunction/bootloader.c`. | Continue Phase 2 with Bootloader console/state flow copy. |
| 2026-06-07 | Fix Protocol heartbeat helper frame type. | `BOOTLOADER_ARCHITECTURE_PLAN.md`, `Protocol/boot_protocol.c` | `boot_proto_send_heartbeat()` now sends `BOOT_PROTO_FRAME_HEART`, matching current `sysFunction/bootloader.c`. | Keep this helper when wiring new flow. |
| 2026-06-07 | Add Function Boot flow skeleton. | `BOOTLOADER_ARCHITECTURE_PLAN.md`, `Function/boot_flow.h`, `Function/boot_flow.c` | New flow covers query ID, query baud, heartbeat, `0502`, bad-frame suppression after raw download, `0503` OK-before-copy, countdown timeout, App jump, and backup restore. Old `sysFunction/bootloader.c` and Keil project were not edited. | Start Phase 3 project wiring plan before changing references. |
| 2026-06-07 | Wire layered Bootloader into projects. | `BOOTLOADER_ARCHITECTURE_PLAN.md`, `sysFunction/bootloader.c`, `project/TASK.uvprojx`, `project/vs eide/.eide/eide.yml` | Keil command-line build completed: `Program Size: Code=13660 RO-data=8632 RW-data=24 ZI-data=3512`, `0 Error(s), 1 Warning(s)`. Warning is existing `ROM.c(24)` unused static function. | Start Phase 4 board/protocol regression; decide whether to clean generated build outputs. |
| 2026-06-07 | Remove direct total-header include from Protocol layer. | `BOOTLOADER_ARCHITECTURE_PLAN.md`, `Protocol/boot_protocol.c` | `Protocol/boot_protocol.c` no longer directly includes `HeaderFiles.h`; full Keil rebuild still completes with `0 Error(s), 1 Warning(s)`. | Later consider moving CRC helpers into Protocol if the final architecture should avoid using `sysFunction/crc_utils.c`. |
| 2026-06-07 | Give Protocol ownership of CRC helpers. | `BOOTLOADER_ARCHITECTURE_PLAN.md`, `Protocol/boot_crc.h`, `Protocol/boot_crc.c`, `Protocol/boot_protocol.c`, `Function/boot_param.c`, `sysFunction/raw_download.c`, `project/TASK.uvprojx`, `project/vs eide/.eide/eide.yml` | Current layered callers now include/use `boot_crc*`; search found no direct `crc_utils` or `HeaderFiles` dependency in `Protocol`, `Function`, or `raw_download.c`. Full Keil rebuild: `0 Error(s), 1 Warning(s)`, warning remains old `ROM.c(24)`. | Separate cleanup plan needed before removing old `sysFunction/crc_utils.*` references/files. |
| 2026-06-07 | Clean ROM conditional compile warning. | `BOOTLOADER_ARCHITECTURE_PLAN.md`, `Driver/HardWare/ROM/ROM.c` | Full Keil rebuild: `Program Size: Code=13660 RO-data=8632 RW-data=24 ZI-data=3512`, `0 Error(s), 0 Warning(s)`. GD32F470 page erase path is unchanged. | Run Phase 4 board/protocol regression. |
| 2026-06-07 | Decouple Bootloader public headers from total header. | `BOOTLOADER_ARCHITECTURE_PLAN.md`, `sysFunction/bootloader.h`, `sysFunction/raw_download.h`, `sysFunction/raw_download.c`, `Function/boot_app.c`, `Function/boot_flow.c`, `Function/boot_param.c`, `Function/boot_upgrade.c` | `bootloader.h` and `raw_download.h` no longer include `HeaderFiles.h`. Search found no direct `HeaderFiles.h`/`crc_utils.h` dependency in `Protocol`, `Function`, `bootloader.h`, `raw_download.h`, or `raw_download.c`. Full Keil rebuild stays `0 Error(s), 0 Warning(s)`. | Keep old project-wide `HeaderFiles.h` cleanup as a separate, broader plan. |
| 2026-06-07 | Decouple `myDMA.h` from total header. | `BOOTLOADER_ARCHITECTURE_PLAN.md`, `Driver/System/myDMA.h`, `Driver/System/myDMA.c`, `Protocol/boot_protocol.c`, `sysFunction/raw_download.c` | `myDMA.h` now includes only `gd32f4xx_dma.h` and `<stdint.h>`. Protocol/raw-download callers include `myDMA.h` directly instead of hand-written DMA externs. Full Keil rebuild stays `0 Error(s), 0 Warning(s)`. | Continue broader Driver header cleanup only with separate small plans. |
| 2026-06-07 | Decouple `USART.h` from total header. | `BOOTLOADER_ARCHITECTURE_PLAN.md`, `Driver/HardWare/USART/USART.h`, `Driver/HardWare/USART/USART.c`, `Protocol/boot_protocol.c`, `Function/boot_flow.c`, `sysFunction/raw_download.c` | `USART.h` no longer includes `HeaderFiles.h`; Protocol/Function/raw-download include the USART Driver header instead of hand-written USART externs. `rs485_printf` now returns `int` to stay compatible with the existing `printf` macro. Full Keil rebuild: `Code=13664`, `0 Error(s), 0 Warning(s)`. | Continue broader Driver header cleanup only with separate small plans. |

## Phase 4 Regression Checklist

Build evidence:

- Keil full rebuild must stay at `0 Error(s), 0 Warning(s)`.
- Bootloader image must remain under 64K.

Board checks to run:

- OLED shows `2026639584` and `Bootloader` after reset.
- Normal boot path: when `boot_flag = 0x00`, Bootloader waits 5 seconds in `sysFunction_loop()` then jumps App if App vector is valid.
- Update path: when `boot_flag = 0xA5`, Bootloader enters console and prints wait prompts at 10/7/4/1 seconds.
- `0111` returns current `device_id`.
- `0112` returns current `baud_code`.
- Heartbeat broadcast returns HEART frame with command `0x8888`.
- Bad CRC or malformed frame returns one error frame, except the first stale frame after raw download is suppressed.
- `0502` accepts raw bin into staging, validates `5A A5 C3 3C` and the vector at `+4`.
- `0503` sends OK before Flash copy, backs up App, copies staging `+4` into App, clears `boot_flag`, and jumps App.
- Upgrade failure attempts backup restore and does not leave App half-written if backup is valid.

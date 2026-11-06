# TM4C GPIO — Embedded C Lab

University exercise configuring GPIO through memory-mapped registers on a TM4C microcontroller.

## Program flow

1. Enable the Port N clock and wait for peripheral readiness.
2. Configure direction and digital enable registers with a `0x0F` mask.
3. Write an initial output value and repeatedly toggle bits with `0x03`.
4. Use a busy-wait delay between changes.

## Tool configuration

The original `.ccsproject` identifies **TM4C1290NCPDT**, Code Composer Studio 11.0.0, and TI ARM compiler 20.2.5.LTS. The imported project includes startup code, linker configuration, and target configuration.

Import this directory as an existing CCS project, select an installed compatible compiler, and review the configured target before building. Local tool paths in the original configuration may need adjustment.

## Hardware assumptions

Confirm the actual MCU, board routing, output pins, and debugger connection before programming hardware. The original code uses a masked Port N data address (`0x4006400C`) and XOR mask `0x03`; this does not identify a specific LED wiring arrangement by itself. Busy-wait timing depends on the clock and compiler optimization and is not a calibrated timer.

## Validation

Source and project file bytes were copied unchanged from `Practica2.zip`. Workspace caches, browser data, generated build products, and unrelated workspace project metadata were excluded. Compilation and board execution have not been tested in this environment.

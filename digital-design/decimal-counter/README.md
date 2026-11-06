# Decimal Counter — VHDL

Historical university exercise implementing a clocked decimal counter with start/pause and synchronous reset.

| Signal | Direction | Meaning |
| --- | --- | --- |
| `CLK` | Input | Clock, described in the source as 50 MHz |
| `INI` | Input | Enable counting when high; pause when low |
| `RESET` | Input | Reset the delay and counter on a rising clock edge |
| `DISPLAY[6:0]` | Output | Declared seven-segment interface; no assignment in the supplied architecture |

`RETRASO_FIN = 49_999_999` targets one increment per second with a 50 MHz clock. The internal count wraps from 9 to 0.

## Open the project

Open `Contador.qpf` in a compatible Quartus installation. The original settings identify Quartus II 9.1 SP2, the Stratix II family, and automatic device selection. Before using a physical board, select the actual device, define clock and pin constraints, and implement the display decoder.

## Known limitations

- `DISPLAY` is declared but never driven: the supplied source is not a complete seven-segment display implementation.
- No board-specific pin assignments or timing constraints were found in the supplied configuration.
- No testbench was supplied. Synthesis and simulation have not been revalidated.
- Original source bytes and comments are retained, including the original text encoding.

This repository preserves the exercise as received. Completing the decoder and adding a testbench would be follow-up development, not part of the migration.

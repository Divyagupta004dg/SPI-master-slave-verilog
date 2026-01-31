# SPI Master–Slave Protocol Design (SystemVerilog)

A complete RTL design and verification of the SPI (Serial Peripheral Interface) Master–Slave protocol using **SystemVerilog**, simulated with **ModelSim** and structured for industry-style documentation.

![Image](https://github.com/user-attachments/assets/f7ce9016-a2ca-4a65-bf78-7694217e82c6)
---

## 🔍 Project Overview

SPI (Serial Peripheral Interface) is a high-speed, full-duplex, synchronous communication protocol widely used in SoCs, microcontrollers, sensors, and memory devices.

This project implements:
- SPI Master (FSM-based)
- SPI Slave (FSM-based)
- Mode-0 operation (CPOL = 0, CPHA = 0)
- 8-bit full-duplex data transfer
- Clean simulation and waveform verification

---

## 🛠 Tools Used

- **SystemVerilog**
- **ModelSim Intel FPGA Starter Edition**
- **Vivado ML Standard (for FPGA flow – optional)**
- **Git & GitHub**

---


## 📁 Project Structure

```text
spi-master-slave-verilog/
│
├── rtl/        # RTL source files (SPI Master & Slave)
├── tb/         # Testbenches
├── sim/        # ModelSim simulation workspace
├── waveforms/  # Simulation waveforms & screenshots
├── docs/       # Architecture diagrams, FSMs, reports
└── README.md

```
---

## 🧾 Language Used

This project is written in **SystemVerilog**, not legacy Verilog.

SystemVerilog features used:
- `logic` data types
- `typedef enum` for FSM state encoding
- `always_ff` and `always_comb` constructs
- Strongly-typed FSM control logic


---

## 🧠 RTL Design Status

- Language: **SystemVerilog**
- Design Style: **FSM-based control logic**
- Tool: **ModelSim (Intel FPGA Edition)**
- Compilation: ✅ Clean (0 errors, 0 warnings)

### FSM States Implemented
- `IDLE` – Wait for start signal
- `LOAD` – Load transmit data
- `TRANSFER` – Shift out 8-bit data on MOSI
- `DONE` – Transaction complete, return to IDLE

The RTL has been successfully compiled using:
```bash
vlog -sv rtl/spi_master.v
```

## 🔍 Functional Simulation (ModelSim)

The SPI Master RTL was verified using ModelSim.
The waveform below shows correct operation of:
- FSM state transitions
- SPI clock (SCLK)
- MOSI shifting
- Chip Select (CS)
- DONE flag

<img width="2873" height="1707" alt="image" src="https://github.com/user-attachments/assets/759529a2-c850-4442-9354-e369a4c4fa73" />


✅ What this waveform proves (signal-by-signal)

I’ll map it directly to your screenshot.

🟢 start

Goes high once

FSM leaves IDLE
✔️ Correct trigger behavior

🟢 cs (chip select)

HIGH → LOW → HIGH

LOW during transfer
✔️ Active-low CS is perfect

🟢 sclk

Toggles only when cs = 0

Clean, uniform clock pulses
✔️ SPI clock divider is working

🟢 mosi

Changes only on clock edges

Bit stream visible
✔️ Data shifting is correct

🟢 tx_data = 10100101 (0xA5)

Matches MOSI bit pattern
✔️ Correct transmission

🟢 dbg_shift_reg

You can clearly see:

10100101
01001010
10010100
00101000
...


✔️ Left-shift each bit → PERFECT

🟢 dbg_bit_cnt
000 → 001 → 010 → ... → 111


✔️ Exactly 8 bits transferred

🟢 dbg_state
IDLE → LOAD → TRANSFER → DONE → IDLE


✔️ FSM sequencing is textbook-correct

🟢 done

Pulses HIGH at the end
✔️ Transfer completion flag works



---

## FPGA Synthesis using Vivado

The SPI Master RTL design was synthesized and analyzed using Xilinx Vivado
targeting an Artix-7 FPGA.

➡️ Detailed Vivado synthesis documentation is available here:  
[vivado/README_VIVADO.md](vivado/README_VIVADO.md)



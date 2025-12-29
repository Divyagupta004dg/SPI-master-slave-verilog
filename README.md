# SPI Master–Slave Protocol Design (SystemVerilog)

A complete RTL design and verification of the SPI (Serial Peripheral Interface) Master–Slave protocol using **SystemVerilog**, simulated with **ModelSim** and structured for industry-style documentation.

![Image](https://github.com/user-attachments/assets/44c73bee-7c67-453b-9b87-dd7b87606678)


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


# Vivado Synthesis & FPGA Implementation – SPI Master

This document describes the synthesis and FPGA implementation of the SPI Master
design using Xilinx Vivado.

The RTL was first verified functionally using ModelSim and then synthesized
for an Artix-7 FPGA.

---

## Tool Details
- Tool: Xilinx Vivado 2025.2
- Target FPGA Family: Artix-7
- Device Part: xc7a35tcpg236-1
- HDL: Verilog
- Design Type: FSM-based SPI Master

---

## Design Sources
- RTL Source:
  - rtl/spi_master.v

> Testbench files were excluded from synthesis.

---

## Synthesis Overview
- RTL successfully synthesized
- Design mapped correctly onto FPGA resources
- No latches inferred
- Fully synchronous design

---

## FPGA Implementation Artifacts
The following artifacts are generated using Vivado:

- RTL Schematic
- FPGA Device (Floorplan) View
- Resource Utilization Report
- Timing Summary Report

> files are added of the above.

---
## Implementation, Timing & Bitstream

The SPI Master design was fully implemented on an Artix-7 FPGA.

### Implementation
- Placement and routing completed successfully
- No routing errors reported

### Timing Analysis
- Worst Negative Slack (WNS): ≥ 0 ns
- All setup and hold timing constraints met

### Resource Utilization
- Low LUT and FF utilization
- No BRAM or DSP usage
- Efficient mapping for small control-oriented design

### Bitstream Generation
A valid FPGA bitstream was generated successfully, confirming that the
design is hardware-ready even without a physical board.


## Conclusion
This completes the RTL-to-FPGA synthesis flow for the SPI Master module.
The design is ready for integration or bitstream generation.

# Digital Design Workshop: IEEE CUSB

## Workshop Content Overview:

This workshop covers various aspects of digital design and FPGA/ASIC flows, focusing on Verilog RTL coding, advanced testbench development, FPGA design using Xilinx Vivado, ASIC flow basics, and low-power design techniques.

### Workshop Modules:

- **Verilog RTL Coding:**

  - Combinational Logic
  - Sequential Logic
  - Finite State Machines (FSMs)
  - Memory Implementation

- **Advanced Testbench Development:**

  - Self-checking methodologies
  - Tasks and Functions for efficient verification

- **FPGA Design Flow with Xilinx Vivado:**

  - Synthesis
  - Static Timing Analysis (STA)
  - Linting for code quality

- **ASIC Flow Basics:**

  - Synthesis considerations
  - Handling Clock Domain Crossing (CDC)

- **Low-Power Design Techniques:**
  - Strategies for reducing power consumption in digital designs

## Final Project: 32-Bit Single-Cycle RISC-V Processor

### Project Description:

Designed and implemented a functional RV32I processor capable of executing base RISC-V instructions. The processor operates synchronously and supports arithmetic, load/store, and branching operations.

### Project Phases:

1. **RTL Design:**

   - ALU (Arithmetic Logic Unit)
   - Register File
   - Control Unit
   - Program Counter (PC) Logic

2. **Integration and Verification:**

   - Implemented a comprehensive self-checking testbench for verification purposes.

3. **FPGA Synthesis and Timing Analysis:**

   - Utilized Xilinx Vivado for synthesizing the design and performing timing analysis to ensure operational correctness.

4. **Functional Simulation:**
   - Validated the processor functionality through extensive functional simulation using QuestaSim.

## Repository Structure:

- **/ALU_mini_proj/:** ALU mini project for Combinational logic practice.
- **/Assignments/:** Includes all the assignments throughout the workshop.
- **/Extras/:** Includes extra reading material.
- **/Labs/:** Includes all the Labs throughout the workshop.
- **/Single Cycle RV-32I Processor/:** Contains Verilog RTL files for the processor components.

## Getting Started:

To explore the project:

1. Clone the repository.
2. Navigate to specific directories (`/Single Cycle RV-32I Processor/`) for detailed files and setups.

## Contributors:

- Youssef Bassem

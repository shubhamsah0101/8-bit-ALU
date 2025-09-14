# 8-bit Arithmetic Logic Unit (ALU)
# Overview

This project implements an 8-bit Arithmetic Logic Unit (ALU) in Verilog HDL, which performs a variety of arithmetic and logical operations.
It is a fundamental building block of a CPU, designed as part of a digital systems project.

# Features
- Arithmetic Operations
  - Addition
  - Subtraction
  - Multiplication
  - Division (gives Quotient and Remainder)

- Logical Operations
  - NOT
  - AND
  - OR
  - NAND
  - NOR
  - XOR
  - XNOR

# Module Structure
- ALU_8bit.v — Top-level ALU module
- ParallelAdder.v — 8-bit Ripple Carry Adder
- ParallelSubtractor.v — 8-bit Subtractor using Full Adders
- Multiplier.v — 8-bit Binary Multiplier
- Divider.v — 8-bit Binary Divider
- FullAdder.v — Basic 1-bit Full Adder used in other modules
- ALU_tb.v — Testbench for verifying all operations

# Inputs and Outputs
- Inputs:
  - A [7:0] — 8-bit input operand
  - B [7:0] — 8-bit input operand
  - sel [3:0] — 4-bit select signal to choose the operation

- Outputs:
  - result [15:0] — Result of the selected operation
  - Q [7:0] — Quotient (for division only)
  - R [7:0] — Remainder (for division only)

# Operation Select Codes
- 0000 ->	Addition
- 0001 ->	Subtraction
- 0010 ->	Multiplication
- 0011 ->	Division
- 0100 ->	NOT (on A)
- 0101 ->	AND
- 0110 ->	OR
- 0111 ->	NAND
- 1000 ->	NOR
- 1001 ->	XOR
- 1010 ->	XNOR

# Future Improvements
- Add status flags (Zero, Carry, Overflow, Negative)
- Add shift and rotate operations
- Expand to 16-bit ALU

# Author
Shubham Kumar Sah

# Efficient Data Extraction Circuit for Posit Number System

## Project Overview

This repository contains the implementation and analysis of an efficient data extraction circuit for the Posit number system, focusing on the LDD-Based Posit Decoder. The project compares three key decoding algorithms—Leading One Detector (LOD), Leading Zero Detector (LZD), and Leading Difference Detector (LDD)—for optimal hardware realization.

---

## Key Features

- **Posit Number System:** 
  - Dynamic precision and range for efficient representation.
  - Eliminates NaN and subnormal numbers to simplify hardware.
- **Algorithms Implemented:**
  - **LOD**: Efficient detection of the first '1' in the binary representation.
  - **LZD**: Efficient detection of the first '0' in the binary representation.
  - **LDD**: Accurate identification of bit differences for regime extraction.
- **Hardware Metrics Analysis:**
  - Area, Power, Delay, Power-Delay Product (PDP), and normalized PDP comparisons.
- **Post-Synthesis Simulations:**
  - Results for 8-bit, 16-bit, 32-bit, and 64-bit Posit numbers.

---

## Algorithms

### 1. **Leading One Detector (LOD)**
   - Identifies the position of the first '1' in the binary string.
   - Used for regime value calculation.
   - Enables bit shifts for exponent and fraction extraction.

### 2. **Leading Zero Detector (LZD)**
   - Similar to LOD but identifies the position of the first '0'.
   - Supports optimized hardware for Posit decoding.

### 3. **Leading Difference Detector (LDD)**
   - Uses bitwise operations (XNOR, AND) to determine bit changes.
   - Allows optimal structure estimation with fewer delays.

---

## Comparison of Decoders

| Metric              | LOD 16     | LDD 16     | LOD 32     | LDD 32     | LOD 64     | LDD 64     |
|---------------------|------------|------------|------------|------------|------------|------------|
| **Area (µm²)**      | 373.81     | 304.72     | 1122.10    | 998.98     | 3637.84    | 3375.54    |
| **Power (µW)**      | 5.47       | 3.44       | 14.35      | 8.72       | 28.87      | 22.56      |
| **Delay (ns)**      | 3.82       | 3.43       | 8.69       | 5.35       | 10.99      | 9.26       |
| **PDP (fJ)**        | 20.89      | 11.79      | 124.63     | 46.66      | 317.21     | 208.92     |
| **Normalized PDP**  | 1.77       | 1.00       | 10.57      | 3.96       | 26.91      | 17.73      |

---

## Team Members

- **K.S.V. Rohit** ([komaragiri.sai@iiitb.ac.in](mailto:komaragiri.sai@iiitb.ac.in))
- **A. Nishith** ([a.nishith@iiitb.ac.in](mailto:a.nishith@iiitb.ac.in))
- **A. Lokesh** ([lokeshkumar.aravapalli@iiitb.ac.in](mailto:lokeshkumar.aravapalli@iiitb.ac.in))
- **M. Lohitaksh** ([lohitaksh.maruvada@iiitb.ac.in](mailto:lohitaksh.maruvada@iiitb.ac.in))
- **T.V.S Chaitanya** ([tvs.chaitanya@iiitb.ac.in](mailto:tvs.chaitanya@iiitb.ac.in))
- **G. Pradyumna** ([pradyumna.g@iiitb.ac.in](mailto:pradyumna.g@iiitb.ac.in))

---

## Repository Structure

```plaintext
├── /src
│   ├── lod_decoder.v      # Verilog implementation of LOD
│   ├── lzd_decoder.v      # Verilog implementation of LZD
│   ├── ldd_decoder.v      # Verilog implementation of LDD
│   ├── posit_decoder_tb.v # Testbench for decoder modules
├── /docs
│   ├── posit_system_overview.pdf
│   ├── experimental_results.csv
└── README.md

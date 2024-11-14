# LeakyDSP

This repository contains the experiments of evaluation and case studies discussed in the paper :
* "LeakyDSP: Exploiting Digital Signal Processing Blocks to Sense Voltage Fluctuations".

LeakyDSP is a novel on-chip sensor that exploits Digital Signal Processing (DSP) blocks to craft a stealthy power side channel. We mount different power side channel attacks via LeakyDSP successfully.

## Tested Setup

### Software dependencies

To run the experiments and proof-of-concepts, the following prerequisites need to be fulfilled:

* Linux installation
  * Build tools (gcc, make)
  * Python 3
  * Vivado

### Hardware dependencies

To perform the characterization and AES key extraction attack, we use a Basys3 board connected to a Huawei MateBook 14 laptop via UART and powered through the USB interface. For the covert channel evaluation, we use an ALINX AXU3EGB ARM-FPGA board.

| Property          | ALINX AXU3EGB          | Basys 3    |
| ----------------- | ---------------------- | ---------- |
| FPGA Family       | Zynq UltraScale+ MPSoC | Artix-7    |
| Number of DSPs    | 360                    | 90         |
| LUT Elements      | 70560                  | 20800      |
| FlipFlops         | 141120                 | 41600      |
| FPGA Core Voltage | 0.825∼0.876V           | 0.95∼1.05V |


## Materials

This repository contains the following materials:

* `E1-Extracting_AES_Keys`: This directory contains the hardware description language code for implementing LeakyDSP on the Basys3 FPGA. By modifying the code from https://github.com/mirjanastojilovic/RDS/tree/main/basys3, LeakyDSP has been used to extract AES full keys.
* `E2-Establishing_Covert_Channels`: This project features a hardware design that incorporates LeakyDSP, along with code for sending and receiving data through covert channels, as well as code for calculating the bit error rate (BER) and transmission rate (TR).

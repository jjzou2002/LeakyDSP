# Extracting AES Keys

The equipment used in this experiment is the Basys3 development board, which features a 7-series FPGA chip.

## Hardware

```
Content: 
  |dspe1.v           	  : In this module, three DSPs are instantiated using the DSP48E1 primitive, and the 48-bit output of the final stage DSP is taken as the output of this module.
  |LeakyDSP.v             : In this module, the IDELAYE2 primitive is called twice, specifically for calibrating the two inputs A and CLK of the dspe1 module, and the dspe1 module is instantiated.
```

Using the code [RDS/basys3/hw at main · mirjanastojilovic/RDS · GitHub](https://github.com/mirjanastojilovic/RDS/tree/main/basys3/hw), replace the sensor part of the original project with LeakyDSP to enable attacks on AES.

- In the Vivado project, you can modify the output clock frequency of the `aes_clk` output port in the `clock_generator_inst` IP core to change the operating frequency of the AES. In this project, the default operating frequency of the AES is 20 MHz.
- By adjusting the pblock location information in the xdc constraints file, you can optimize the layout of LeakyDSP on the FPGA.
- In the Vivado tool, click the `Generate Bitstream` button to generate the bitstream for the implementation. Then, program the FPGA with the generated bitstream.


## Software

Using the code from [RDS/basys3/sw at main · mirjanastojilovic/RDS · GitHub](https://github.com/mirjanastojilovic/RDS/tree/main/basys3/sw), implement PC-triggered AES encryption and capture the output traces from LeakyDSP during the AES encryption process. Please ensure you have programmed the FPGA with the bitstream and make sure SW15 on the Basys3 board is in the ON position.

- Adjust the function `set_idf` in the source code `data_utils.c`, which is used for setting fine-tuning calibration parameters: In the original function, there is an array `buffer[12]`. In the revised project, only `buffer[0]` and `buffer[1]` are specified as valid, used respectively to set the `CNTVALUEIN` values of the `IDELAYE2` primitives for calibration CLK and A in LeakyDSP. During calibration, only `buffer[0]` and `buffer[1]` need to be modified.




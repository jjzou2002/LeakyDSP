# Extracting AES Keys

The equipment used in this experiment is the Basys3 development board, which features a 7-series FPGA chip.

## bitstream

The `bitstream` directory contains the `system_top.bit` file. In this bitstream, the AES operating frequency is set to 20 MHz, and the LeakyDSP position is set at placement 6 in `LeakyDSP` Fig 5. This bitstream can be directly programmed into the Basys3 board.

## hw

The `hw` directory contains the necessary files to restore the Vivado project, and the code is referenced from [RDS/basys3/hw at main · mirjanastojilovic/RDS · GitHub](https://github.com/mirjanastojilovic/RDS/tree/main/basys3/hw). For more detailed information, please refer to this. Below are the emphasized different files:

```
rtl/sensor/
  |dspe1.v           	  : In this module, three DSPs are instantiated using the DSP48E1 primitive, and the 48-bit output of the final stage DSP is taken as the output of this module.
  |DSPSensor.v            : In this module, the IDELAYE2 primitive is called twice, specifically for calibrating the two inputs A and CLK of the dspe1 module, and the dspe1 module is instantiated.
```

You can restore the Vivado project in the TCL command-line interface by following these steps:

1. Give a name to your project as follows:

   ```
   set project_name <your_project_name>
   ```

2. Execute the TCL script by typing:

   ```
   source LeakyDSP_AES.tcl
   ```

After restoring the Vivado project, you can reproduce the settings from `LeakyDSP`  based on the following points:

- You can modify the output clock frequency of the `aes_clk` output port in the `clock_generator_inst` IP core to change the operating frequency of the AES. In this project, the default operating frequency of the AES is 20 MHz.
- By modifying the pblock location information in the file `./xdc/constraints_LeakyDSP.xdc`, you can adjust the layout of LeakyDSP on the FPGA. In this project, the default position of LeakyDSP is set at placement 6.


## sw

Using the code from [RDS/basys3/sw at main · mirjanastojilovic/RDS · GitHub](https://github.com/mirjanastojilovic/RDS/tree/main/basys3/sw), implement PC-triggered AES encryption and capture the output traces from LeakyDSP during the AES encryption process. Based on the source code, we made modifications to the `data_utils.c` and `data_utils.h` files in the `src` directory. The changes primarily focus on the following two functions:

- modify the original `set_idf` function that was used for fine calibration: in the original function, there was an array `buffer[12]`. After the modification, only `buffer[0]` and `buffer[1]` are specified as valid, used respectively to set the `CNTVALUEIN` values of the `IDELAYE2` primitives for calibration CLK and A in LeakyDSP. During calibration, only `buffer[0]` and `buffer[1]` need to be modified.
- modify the `calibrate_sensor` function： During calibration, focus on the output of the LeakyDSP before the AES starts encryption, and call the modified `set_idf` function to sequentially adjust the `CNTVALUEIN` values of the two `IDELAYE2` primitives until the calibration conditions are met.

Please ensure you have programmed the FPGA with the bitstream and make sure SW15 on the Basys3 board is in the ON position.

1. Compile the software part in the directory `sw` by entering the command `make`.

2. Change to the directory `./sw/bin`. For example, to sample the output traces from LeakyDSP while using the same key for AES encryption 70,000 times, you can enter the following command: `./interface -k 0 -pt 1 -t 70000 -s`.

   The expected console output during the sampling process is as follows:

```
Trace :69997
Transfering sensor trace...
Sensor trace transfer done!
Key:7d 26 6a ec b1 53 b4 d5 d6 b1 71 a5 81 36 60 5b
Plain text:08 c8 c1 93 2f 03 af b6 f6 12 2f b2 cb d4 81 f0
Cipher text: 1b 35 ca 81 e5 1a ee 75 d7 73 2f f6 db 67 84 10
Trace :69998
Transfering sensor trace...
Sensor trace transfer done!
Key:7d 26 6a ec b1 53 b4 d5 d6 b1 71 a5 81 36 60 5b
Plain text: 1b 35 ca 81 e5 1a ee 75 d7 73 2f f6 db 67 84 10
Cipher text:24 d6 3c co d7 3a 06 db 47 20 88 2d 5a 85 44 9a
```

3. After sampling, extract two files from the `/bin` directory, which contain the LeakyDSP output traces and the ciphertexts obtained from each round of encryption (e.g., `sensor_traces_70k.csv` and `ciphertexts.bin`). These files are used to perform Correlation Power Analysis (CPA) and compute the Key Rank Estimation. For the CPA source code, please refer to [RDS/key_rank at main · mirjanastojilovic/RDS (github.com)](https://github.com/mirjanastojilovic/RDS/tree/main/key_rank).

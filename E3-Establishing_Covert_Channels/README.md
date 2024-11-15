# Establishing Covert Channels

The equipment used in this experiment is the ALINX AXU3EGB, which features a Zynq UltraScale+ MPSoC chip.

## HDF

This directory contains the hardware platform file exported by the original vivado project, which includes bitstream. Using this hdf file and the petalinux tool, an image can be generated.

## PL

The `hw` directory contains the necessary source files to restore the original Vivado project. By executing the `ultra+covert_channel.tcl` script, the project can be reconstructed. Below is a description of the files in the `hw/src` directory.

```
hw/src/
  |dspe2.v           	  : In this module, three DSPs are instantiated using the DSP48E2 primitive, and the 48-bit output of the final stage DSP is taken as the output of this module.
  |DSPSensor.v            : In this module, the IDELAYE3 primitive is called twice, specifically for calibrating the two inputs A and CLK of the dspe2 module, and the dspe2 module is instantiated.
  |power_virus.v          : Enabling this module can generate a substantial amount of switching activity, inducing fluctuations on the PDN within the FPGA.
```

You can restore the Vivado project in the TCL command-line interface by following these steps:

1. Give a name to your project as follows:

   ```
   set project_name <your_project_name>
   ```

2. Execute the TCL script by typing:

   ```
   source ultra+covert_channel.tcl
   ```

After generating the bitstream in the reconstructed project, you can export the hardware platform file.


## PS

```
Content:
  |dsp_cali.c          	  : Calibrate the LeakyDSP.
  |error-rate.c           : Calculates the error rate between sent and received data.
  |receiver.c             : Determine the received bit value by calculating the average of the LeakyDSP output for each bit transmission time.
  |sender.c               : Sends a sequence of bits by stressing the FPGA. It agrees on the number of bits to be sent and the sending time for each bit with the receiver.
  |test.sh                : A script used to observe the error rate of this covert channel under different sending times per bit.
```

Execute the above code on the ARM core of the ALINX AXU3EGB through the `test.sh` script to obtain the error rates under different sending times per bit. The results will be written to `result.txt`.

```shell
./test.sh
```

- In this script, first execute the program for calibrating the LeakyDSP, then control the different sending times for each bit to send messages using the covert channel. Finally, calculate the bit error rate under different settings and save the results in the `result.txt` file.

The content in the `result.txt` file is roughly as follows:

```
...
send_time/bit: 6000 us

real	1m0.474s
user	1m0.444s
sys	0m0.008s
len1 is 10000
len2 is 10000
error rate is:0.00 %
send_time/bit: 5500 us

real	0m55.440s
user	0m55.412s
sys	0m0.004s
len1 is 10000
len2 is 10000
error rate is:0.01 %
...
```

- The time displayed after `send_time/bit` indicates the time per bit controlled by the sender. The time displayed after `real` is used to calculate the transmission rate (TR), and the error rate shows the current bit error rate at the specified send time per bit.

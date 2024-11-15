# Characterizing LeakyDSP

The equipment used in this experiment is the Basys3 development board, which features a 7-series FPGA chip.

Below is a description of the files contained in this directory.

```
Overview:
│   │
│   └───README.md
│   │
│   └───power_virus.v: Enabling this module can generate a substantial amount of switching activity,   inducing fluctuations on the PDN within the FPGA.
|
└───LeakyDSP/
│   │
│   └───dspe1.v: In this module, three DSPs are instantiated using the DSP48E1 primitive, and the 48-bit output of the final stage DSP is taken as the output of this module.
│   │
│   └───DSPSensor.v: In this module, the IDELAYE2 primitive is called twice, specifically for calibrating the two inputs A and CLK of the dspe1 module, and the dspe1 module is instantiated.
│
└───TDC/
    │
    └───sensor.vhd: The TDC circuit implementation code for the 7-series FPGA. This code is identical to the one found at (https://github.com/mirjanastojilovic/RDS/blob/main/sakura_x/hw/sources/TDC/sensor.vhd)
```


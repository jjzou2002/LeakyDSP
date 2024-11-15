// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sat Sep  7 10:25:21 2024
// Host        : LAPTOP-8Q5FUMTO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top clock_generator -prefix
//               clock_generator_ clock_generator_stub.v
// Design      : clock_generator
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clock_generator(aes_clk, sensor_clk, ttest_clk, clk_out4, resetn, 
  locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="aes_clk,sensor_clk,ttest_clk,clk_out4,resetn,locked,clk_in1" */;
  output aes_clk;
  output sensor_clk;
  output ttest_clk;
  output clk_out4;
  input resetn;
  output locked;
  input clk_in1;
endmodule

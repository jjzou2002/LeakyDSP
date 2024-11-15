// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Tue Nov  5 10:51:52 2024
// Design      : design_1_DSPSensor_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sfvc784-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "DSPSensor,Vivado 2019.1" *)
module design_1_DSPSensor_0_0(ref_clk, rst, A, clk, taps_clk, taps_A, P)
/* synthesis syn_black_box black_box_pad_pin="ref_clk,rst,A,clk,taps_clk[8:0],taps_A[8:0],P[47:0]" */;
  input ref_clk;
  input rst;
  input A;
  input clk;
  input [8:0]taps_clk;
  input [8:0]taps_A;
  output [47:0]P;
endmodule

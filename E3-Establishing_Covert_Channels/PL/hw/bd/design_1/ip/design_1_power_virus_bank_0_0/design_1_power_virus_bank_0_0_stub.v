// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Tue Nov  5 19:41:59 2024
// Design      : design_1_power_virus_bank_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sfvc784-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "power_virus_bank,Vivado 2019.1" *)
module design_1_power_virus_bank_0_0(clk, enable, z)
/* synthesis syn_black_box black_box_pad_pin="clk,enable[7:0],z" */;
  input clk;
  input [7:0]enable;
  output z;
endmodule

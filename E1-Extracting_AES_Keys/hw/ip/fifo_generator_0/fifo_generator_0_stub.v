// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sat Dec  2 16:13:07 2023
// Host        : LAPTOP-PKPET6QB running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/FPGA_Proj/RMUX4/RMUX4_sensor/RMUX4_sensor.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0_stub.v
// Design      : fifo_generator_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_5,Vivado 2020.1" *)
module fifo_generator_0(wr_clk, wr_rst, rd_clk, rd_rst, din, wr_en, rd_en, 
  dout, full, wr_ack, empty, valid)
/* synthesis syn_black_box black_box_pad_pin="wr_clk,wr_rst,rd_clk,rd_rst,din[127:0],wr_en,rd_en,dout[127:0],full,wr_ack,empty,valid" */;
  input wr_clk;
  input wr_rst;
  input rd_clk;
  input rd_rst;
  input [127:0]din;
  input wr_en;
  input rd_en;
  output [127:0]dout;
  output full;
  output wr_ack;
  output empty;
  output valid;
endmodule

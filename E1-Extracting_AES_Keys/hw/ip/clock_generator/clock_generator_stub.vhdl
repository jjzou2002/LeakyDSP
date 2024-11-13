-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Sat Sep  7 10:25:21 2024
-- Host        : LAPTOP-8Q5FUMTO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top clock_generator -prefix
--               clock_generator_ clock_generator_stub.vhdl
-- Design      : clock_generator
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_generator is
  Port ( 
    aes_clk : out STD_LOGIC;
    sensor_clk : out STD_LOGIC;
    ttest_clk : out STD_LOGIC;
    clk_out4 : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clock_generator;

architecture stub of clock_generator is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aes_clk,sensor_clk,ttest_clk,clk_out4,resetn,locked,clk_in1";
begin
end;

-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Tue Nov  5 10:51:52 2024
-- Design      : design_1_DSPSensor_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu3eg-sfvc784-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_DSPSensor_0_0 is
  Port ( 
    ref_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    A : in STD_LOGIC;
    clk : in STD_LOGIC;
    taps_clk : in STD_LOGIC_VECTOR ( 8 downto 0 );
    taps_A : in STD_LOGIC_VECTOR ( 8 downto 0 );
    P : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );

end design_1_DSPSensor_0_0;

architecture stub of design_1_DSPSensor_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ref_clk,rst,A,clk,taps_clk[8:0],taps_A[8:0],P[47:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "DSPSensor,Vivado 2019.1";
begin
end;

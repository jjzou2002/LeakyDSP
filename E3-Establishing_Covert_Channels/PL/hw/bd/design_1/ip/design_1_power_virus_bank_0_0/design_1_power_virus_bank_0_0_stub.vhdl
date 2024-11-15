-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Tue Nov  5 19:42:00 2024
-- Design      : design_1_power_virus_bank_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu3eg-sfvc784-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_power_virus_bank_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    enable : in STD_LOGIC_VECTOR ( 7 downto 0 );
    z : out STD_LOGIC
  );

end design_1_power_virus_bank_0_0;

architecture stub of design_1_power_virus_bank_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,enable[7:0],z";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "power_virus_bank,Vivado 2019.1";
begin
end;

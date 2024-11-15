-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Tue Nov  5 10:51:52 2024
-- Host        : zjj-virtual-machine running 64-bit unknown
-- Command     : write_vhdl -force -mode funcsim
--               /home/zjj/work/DSPSensor/ZynqUltra/3eg.srcs/sources_1/bd/design_1/ip/design_1_DSPSensor_0_0/design_1_DSPSensor_0_0_sim_netlist.vhdl
-- Design      : design_1_DSPSensor_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu3eg-sfvc784-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_DSPSensor_0_0_dspe2 is
  port (
    P : out STD_LOGIC_VECTOR ( 47 downto 0 );
    CLK : in STD_LOGIC;
    rst : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_DSPSensor_0_0_dspe2 : entity is "dspe2";
end design_1_DSPSensor_0_0_dspe2;

architecture STRUCTURE of design_1_DSPSensor_0_0_dspe2 is
  signal P0 : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal P1 : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_DSP48E2_inst_1_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_1_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_1_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_1_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_1_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_1_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_1_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_DSP48E2_inst_1_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_DSP48E2_inst_1_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_DSP48E2_inst_1_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 30 );
  signal NLW_DSP48E2_inst_1_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_DSP48E2_inst_1_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_DSP48E2_inst_2_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_2_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_2_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_2_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_2_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_2_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_2_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_DSP48E2_inst_2_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_DSP48E2_inst_2_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_DSP48E2_inst_2_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 30 );
  signal NLW_DSP48E2_inst_2_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_DSP48E2_inst_2_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_DSP48E2_inst_3_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_3_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_3_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_3_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_3_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_3_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_DSP48E2_inst_3_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_DSP48E2_inst_3_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_DSP48E2_inst_3_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_DSP48E2_inst_3_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_DSP48E2_inst_3_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of DSP48E2_inst_1 : label is "PRIMITIVE";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of DSP48E2_inst_1 : label is "{SYNTH-11 {cell *THIS*}}";
  attribute BOX_TYPE of DSP48E2_inst_2 : label is "PRIMITIVE";
  attribute METHODOLOGY_DRC_VIOS of DSP48E2_inst_2 : label is "{SYNTH-11 {cell *THIS*}}";
  attribute BOX_TYPE of DSP48E2_inst_3 : label is "PRIMITIVE";
begin
DSP48E2_inst_1: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 0,
      ADREG => 0,
      ALUMODEREG => 1,
      AMULTSEL => "AD",
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 1,
      BMULTSEL => "B",
      BREG => 1,
      B_INPUT => "DIRECT",
      CARRYINREG => 1,
      CARRYINSELREG => 1,
      CREG => 0,
      DREG => 0,
      INMODEREG => 1,
      IS_ALUMODE_INVERTED => B"0000",
      IS_CARRYIN_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_INMODE_INVERTED => B"00000",
      IS_OPMODE_INVERTED => B"000000000",
      IS_RSTALLCARRYIN_INVERTED => '0',
      IS_RSTALUMODE_INVERTED => '0',
      IS_RSTA_INVERTED => '0',
      IS_RSTB_INVERTED => '0',
      IS_RSTCTRL_INVERTED => '0',
      IS_RSTC_INVERTED => '0',
      IS_RSTD_INVERTED => '0',
      IS_RSTINMODE_INVERTED => '0',
      IS_RSTM_INVERTED => '0',
      IS_RSTP_INVERTED => '0',
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 1,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 0,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29) => A(0),
      A(28) => A(0),
      A(27) => A(0),
      A(26) => A(0),
      A(25) => A(0),
      A(24) => A(0),
      A(23) => A(0),
      A(22) => A(0),
      A(21) => A(0),
      A(20) => A(0),
      A(19) => A(0),
      A(18) => A(0),
      A(17) => A(0),
      A(16) => A(0),
      A(15) => A(0),
      A(14) => A(0),
      A(13) => A(0),
      A(12) => A(0),
      A(11) => A(0),
      A(10) => A(0),
      A(9) => A(0),
      A(8) => A(0),
      A(7) => A(0),
      A(6) => A(0),
      A(5) => A(0),
      A(4) => A(0),
      A(3) => A(0),
      A(2) => A(0),
      A(1) => A(0),
      A(0) => A(0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_DSP48E2_inst_1_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000000000000000001",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_DSP48E2_inst_1_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '1',
      CARRYCASCOUT => NLW_DSP48E2_inst_1_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_DSP48E2_inst_1_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '1',
      CEA2 => '1',
      CEAD => '1',
      CEALUMODE => '1',
      CEB1 => '1',
      CEB2 => '1',
      CEC => '1',
      CECARRYIN => '1',
      CECTRL => '1',
      CED => '1',
      CEINMODE => '1',
      CEM => '1',
      CEP => '1',
      CLK => CLK,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00100",
      MULTSIGNIN => '1',
      MULTSIGNOUT => NLW_DSP48E2_inst_1_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => NLW_DSP48E2_inst_1_OVERFLOW_UNCONNECTED,
      P(47 downto 30) => NLW_DSP48E2_inst_1_P_UNCONNECTED(47 downto 30),
      P(29 downto 0) => P0(29 downto 0),
      PATTERNBDETECT => NLW_DSP48E2_inst_1_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_DSP48E2_inst_1_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_DSP48E2_inst_1_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => rst,
      RSTALLCARRYIN => rst,
      RSTALUMODE => rst,
      RSTB => rst,
      RSTC => rst,
      RSTCTRL => rst,
      RSTD => rst,
      RSTINMODE => rst,
      RSTM => rst,
      RSTP => rst,
      UNDERFLOW => NLW_DSP48E2_inst_1_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_DSP48E2_inst_1_XOROUT_UNCONNECTED(7 downto 0)
    );
DSP48E2_inst_2: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 0,
      ADREG => 0,
      ALUMODEREG => 1,
      AMULTSEL => "AD",
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 1,
      BMULTSEL => "B",
      BREG => 1,
      B_INPUT => "DIRECT",
      CARRYINREG => 1,
      CARRYINSELREG => 1,
      CREG => 0,
      DREG => 0,
      INMODEREG => 1,
      IS_ALUMODE_INVERTED => B"0000",
      IS_CARRYIN_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_INMODE_INVERTED => B"00000",
      IS_OPMODE_INVERTED => B"000000000",
      IS_RSTALLCARRYIN_INVERTED => '0',
      IS_RSTALUMODE_INVERTED => '0',
      IS_RSTA_INVERTED => '0',
      IS_RSTB_INVERTED => '0',
      IS_RSTCTRL_INVERTED => '0',
      IS_RSTC_INVERTED => '0',
      IS_RSTD_INVERTED => '0',
      IS_RSTINMODE_INVERTED => '0',
      IS_RSTM_INVERTED => '0',
      IS_RSTP_INVERTED => '0',
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 1,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 0,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 0) => P0(29 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_DSP48E2_inst_2_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000000000000000001",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_DSP48E2_inst_2_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '1',
      CARRYCASCOUT => NLW_DSP48E2_inst_2_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_DSP48E2_inst_2_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '1',
      CEA2 => '1',
      CEAD => '1',
      CEALUMODE => '1',
      CEB1 => '1',
      CEB2 => '1',
      CEC => '1',
      CECARRYIN => '1',
      CECTRL => '1',
      CED => '1',
      CEINMODE => '1',
      CEM => '1',
      CEP => '1',
      CLK => CLK,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00100",
      MULTSIGNIN => '1',
      MULTSIGNOUT => NLW_DSP48E2_inst_2_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => NLW_DSP48E2_inst_2_OVERFLOW_UNCONNECTED,
      P(47 downto 30) => NLW_DSP48E2_inst_2_P_UNCONNECTED(47 downto 30),
      P(29 downto 0) => P1(29 downto 0),
      PATTERNBDETECT => NLW_DSP48E2_inst_2_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_DSP48E2_inst_2_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_DSP48E2_inst_2_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => rst,
      RSTALLCARRYIN => rst,
      RSTALUMODE => rst,
      RSTB => rst,
      RSTC => rst,
      RSTCTRL => rst,
      RSTD => rst,
      RSTINMODE => rst,
      RSTM => rst,
      RSTP => rst,
      UNDERFLOW => NLW_DSP48E2_inst_2_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_DSP48E2_inst_2_XOROUT_UNCONNECTED(7 downto 0)
    );
DSP48E2_inst_3: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 0,
      ADREG => 0,
      ALUMODEREG => 1,
      AMULTSEL => "AD",
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 1,
      BMULTSEL => "B",
      BREG => 1,
      B_INPUT => "DIRECT",
      CARRYINREG => 1,
      CARRYINSELREG => 1,
      CREG => 0,
      DREG => 0,
      INMODEREG => 1,
      IS_ALUMODE_INVERTED => B"0000",
      IS_CARRYIN_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_INMODE_INVERTED => B"00000",
      IS_OPMODE_INVERTED => B"000000000",
      IS_RSTALLCARRYIN_INVERTED => '0',
      IS_RSTALUMODE_INVERTED => '0',
      IS_RSTA_INVERTED => '0',
      IS_RSTB_INVERTED => '0',
      IS_RSTCTRL_INVERTED => '0',
      IS_RSTC_INVERTED => '0',
      IS_RSTD_INVERTED => '0',
      IS_RSTINMODE_INVERTED => '0',
      IS_RSTM_INVERTED => '0',
      IS_RSTP_INVERTED => '0',
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 1,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 1,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 0) => P1(29 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_DSP48E2_inst_3_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000000000000000001",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_DSP48E2_inst_3_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '1',
      CARRYCASCOUT => NLW_DSP48E2_inst_3_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_DSP48E2_inst_3_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '1',
      CEA2 => '1',
      CEAD => '1',
      CEALUMODE => '1',
      CEB1 => '1',
      CEB2 => '1',
      CEC => '1',
      CECARRYIN => '1',
      CECTRL => '1',
      CED => '1',
      CEINMODE => '1',
      CEM => '1',
      CEP => '1',
      CLK => CLK,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00100",
      MULTSIGNIN => '1',
      MULTSIGNOUT => NLW_DSP48E2_inst_3_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => NLW_DSP48E2_inst_3_OVERFLOW_UNCONNECTED,
      P(47 downto 0) => P(47 downto 0),
      PATTERNBDETECT => NLW_DSP48E2_inst_3_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_DSP48E2_inst_3_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_DSP48E2_inst_3_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => rst,
      RSTALLCARRYIN => rst,
      RSTALUMODE => rst,
      RSTB => rst,
      RSTC => rst,
      RSTCTRL => rst,
      RSTD => rst,
      RSTINMODE => rst,
      RSTM => rst,
      RSTP => rst,
      UNDERFLOW => NLW_DSP48E2_inst_3_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_DSP48E2_inst_3_XOROUT_UNCONNECTED(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_DSPSensor_0_0_DSPSensor is
  port (
    P : out STD_LOGIC_VECTOR ( 47 downto 0 );
    rst : in STD_LOGIC;
    ref_clk : in STD_LOGIC;
    clk : in STD_LOGIC;
    taps_clk : in STD_LOGIC_VECTOR ( 8 downto 0 );
    A : in STD_LOGIC;
    taps_A : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_DSPSensor_0_0_DSPSensor : entity is "DSPSensor";
end design_1_DSPSensor_0_0_DSPSensor;

architecture STRUCTURE of design_1_DSPSensor_0_0_DSPSensor is
  signal delay_A : STD_LOGIC;
  signal delay_clk : STD_LOGIC;
  signal NLW_IDELAYCTRL_inst_RDY_UNCONNECTED : STD_LOGIC;
  signal NLW_IDELAYE3_A_CASC_IN_UNCONNECTED : STD_LOGIC;
  signal NLW_IDELAYE3_A_CASC_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_IDELAYE3_A_CASC_RETURN_UNCONNECTED : STD_LOGIC;
  signal NLW_IDELAYE3_A_IDATAIN_UNCONNECTED : STD_LOGIC;
  signal NLW_IDELAYE3_A_CNTVALUEOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_IDELAYE3_CLK_CASC_IN_UNCONNECTED : STD_LOGIC;
  signal NLW_IDELAYE3_CLK_CASC_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_IDELAYE3_CLK_CASC_RETURN_UNCONNECTED : STD_LOGIC;
  signal NLW_IDELAYE3_CLK_IDATAIN_UNCONNECTED : STD_LOGIC;
  signal NLW_IDELAYE3_CLK_CNTVALUEOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of IDELAYCTRL_inst : label is "PRIMITIVE";
  attribute BOX_TYPE of IDELAYE3_A : label is "PRIMITIVE";
  attribute BOX_TYPE of IDELAYE3_CLK : label is "PRIMITIVE";
begin
IDELAYCTRL_inst: unisim.vcomponents.IDELAYCTRL
    generic map(
      SIM_DEVICE => "ULTRASCALE"
    )
        port map (
      RDY => NLW_IDELAYCTRL_inst_RDY_UNCONNECTED,
      REFCLK => ref_clk,
      RST => rst
    );
IDELAYE3_A: unisim.vcomponents.IDELAYE3
    generic map(
      CASCADE => "NONE",
      DELAY_FORMAT => "COUNT",
      DELAY_SRC => "DATAIN",
      DELAY_TYPE => "VAR_LOAD",
      DELAY_VALUE => 0,
      IS_CLK_INVERTED => '0',
      IS_RST_INVERTED => '0',
      LOOPBACK => "FALSE",
      REFCLK_FREQUENCY => 300.000000,
      SIM_DEVICE => "ULTRASCALE_PLUS",
      SIM_VERSION => 2.000000,
      UPDATE_MODE => "ASYNC"
    )
        port map (
      CASC_IN => NLW_IDELAYE3_A_CASC_IN_UNCONNECTED,
      CASC_OUT => NLW_IDELAYE3_A_CASC_OUT_UNCONNECTED,
      CASC_RETURN => NLW_IDELAYE3_A_CASC_RETURN_UNCONNECTED,
      CE => '0',
      CLK => ref_clk,
      CNTVALUEIN(8 downto 0) => taps_A(8 downto 0),
      CNTVALUEOUT(8 downto 0) => NLW_IDELAYE3_A_CNTVALUEOUT_UNCONNECTED(8 downto 0),
      DATAIN => A,
      DATAOUT => delay_A,
      EN_VTC => '0',
      IDATAIN => NLW_IDELAYE3_A_IDATAIN_UNCONNECTED,
      INC => '1',
      LOAD => '1',
      RST => rst
    );
IDELAYE3_CLK: unisim.vcomponents.IDELAYE3
    generic map(
      CASCADE => "NONE",
      DELAY_FORMAT => "COUNT",
      DELAY_SRC => "DATAIN",
      DELAY_TYPE => "VAR_LOAD",
      DELAY_VALUE => 0,
      IS_CLK_INVERTED => '0',
      IS_RST_INVERTED => '0',
      LOOPBACK => "FALSE",
      REFCLK_FREQUENCY => 300.000000,
      SIM_DEVICE => "ULTRASCALE_PLUS",
      SIM_VERSION => 2.000000,
      UPDATE_MODE => "ASYNC"
    )
        port map (
      CASC_IN => NLW_IDELAYE3_CLK_CASC_IN_UNCONNECTED,
      CASC_OUT => NLW_IDELAYE3_CLK_CASC_OUT_UNCONNECTED,
      CASC_RETURN => NLW_IDELAYE3_CLK_CASC_RETURN_UNCONNECTED,
      CE => '0',
      CLK => ref_clk,
      CNTVALUEIN(8 downto 0) => taps_clk(8 downto 0),
      CNTVALUEOUT(8 downto 0) => NLW_IDELAYE3_CLK_CNTVALUEOUT_UNCONNECTED(8 downto 0),
      DATAIN => clk,
      DATAOUT => delay_clk,
      EN_VTC => '0',
      IDATAIN => NLW_IDELAYE3_CLK_IDATAIN_UNCONNECTED,
      INC => '1',
      LOAD => '1',
      RST => rst
    );
dspe2_cas: entity work.design_1_DSPSensor_0_0_dspe2
     port map (
      A(0) => delay_A,
      CLK => delay_clk,
      P(47 downto 0) => P(47 downto 0),
      rst => rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_DSPSensor_0_0 is
  port (
    ref_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    A : in STD_LOGIC;
    clk : in STD_LOGIC;
    taps_clk : in STD_LOGIC_VECTOR ( 8 downto 0 );
    taps_A : in STD_LOGIC_VECTOR ( 8 downto 0 );
    P : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_DSPSensor_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_DSPSensor_0_0 : entity is "design_1_DSPSensor_0_0,DSPSensor,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_DSPSensor_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of design_1_DSPSensor_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of design_1_DSPSensor_0_0 : entity is "DSPSensor,Vivado 2019.1";
end design_1_DSPSensor_0_0;

architecture STRUCTURE of design_1_DSPSensor_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 299997009, PHASE 0.000, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk2, INSERT_VIP 0";
  attribute x_interface_info of ref_clk : signal is "xilinx.com:signal:clock:1.0 ref_clk CLK";
  attribute x_interface_parameter of ref_clk : signal is "XIL_INTERFACENAME ref_clk, FREQ_HZ 299997009, PHASE 0.000, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  attribute x_interface_info of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute x_interface_parameter of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of taps_clk : signal is "xilinx.com:signal:clock:1.0 taps_clk CLK";
  attribute x_interface_parameter of taps_clk : signal is "XIL_INTERFACENAME taps_clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
begin
U0: entity work.design_1_DSPSensor_0_0_DSPSensor
     port map (
      A => A,
      P(47 downto 0) => P(47 downto 0),
      clk => clk,
      ref_clk => ref_clk,
      rst => rst,
      taps_A(8 downto 0) => taps_A(8 downto 0),
      taps_clk(8 downto 0) => taps_clk(8 downto 0)
    );
end STRUCTURE;

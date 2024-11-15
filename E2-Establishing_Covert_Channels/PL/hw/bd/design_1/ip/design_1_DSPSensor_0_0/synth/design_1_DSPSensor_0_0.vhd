-- (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:DSPSensor:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_DSPSensor_0_0 IS
  PORT (
    ref_clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    A : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    taps_clk : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    taps_A : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    P : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
  );
END design_1_DSPSensor_0_0;

ARCHITECTURE design_1_DSPSensor_0_0_arch OF design_1_DSPSensor_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_DSPSensor_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT DSPSensor IS
    PORT (
      ref_clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      A : IN STD_LOGIC;
      clk : IN STD_LOGIC;
      taps_clk : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      taps_A : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      P : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
    );
  END COMPONENT DSPSensor;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_DSPSensor_0_0_arch: ARCHITECTURE IS "DSPSensor,Vivado 2019.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_DSPSensor_0_0_arch : ARCHITECTURE IS "design_1_DSPSensor_0_0,DSPSensor,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_DSPSensor_0_0_arch: ARCHITECTURE IS "design_1_DSPSensor_0_0,DSPSensor,{x_ipProduct=Vivado 2019.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=DSPSensor,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF design_1_DSPSensor_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF taps_clk: SIGNAL IS "XIL_INTERFACENAME taps_clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF taps_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 taps_clk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 299997009, PHASE 0.000, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk2, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF rst: SIGNAL IS "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF rst: SIGNAL IS "xilinx.com:signal:reset:1.0 rst RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ref_clk: SIGNAL IS "XIL_INTERFACENAME ref_clk, FREQ_HZ 299997009, PHASE 0.000, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ref_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ref_clk CLK";
BEGIN
  U0 : DSPSensor
    PORT MAP (
      ref_clk => ref_clk,
      rst => rst,
      A => A,
      clk => clk,
      taps_clk => taps_clk,
      taps_A => taps_A,
      P => P
    );
END design_1_DSPSensor_0_0_arch;

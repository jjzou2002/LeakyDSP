// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Tue Nov  5 10:51:52 2024
// Design      : design_1_DSPSensor_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfvc784-1-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_DSPSensor_0_0,DSPSensor,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "DSPSensor,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module design_1_DSPSensor_0_0
   (ref_clk,
    rst,
    A,
    clk,
    taps_clk,
    taps_A,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ref_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME ref_clk, FREQ_HZ 299997009, PHASE 0.000, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input ref_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input A;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 299997009, PHASE 0.000, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk2, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 taps_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME taps_clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input [8:0]taps_clk;
  input [8:0]taps_A;
  output [47:0]P;

  wire A;
  wire [47:0]P;
  wire clk;
  wire ref_clk;
  wire rst;
  wire [8:0]taps_A;
  wire [8:0]taps_clk;

  design_1_DSPSensor_0_0_DSPSensor U0
       (.A(A),
        .P(P),
        .clk(clk),
        .ref_clk(ref_clk),
        .rst(rst),
        .taps_A(taps_A),
        .taps_clk(taps_clk));
endmodule

(* ORIG_REF_NAME = "DSPSensor" *) 
module design_1_DSPSensor_0_0_DSPSensor
   (P,
    rst,
    ref_clk,
    clk,
    taps_clk,
    A,
    taps_A);
  output [47:0]P;
  input rst;
  input ref_clk;
  input clk;
  input [8:0]taps_clk;
  input A;
  input [8:0]taps_A;

  wire A;
  wire [47:0]P;
  wire clk;
  wire delay_A;
  wire delay_clk;
  wire ref_clk;
  wire rst;
  wire [8:0]taps_A;
  wire [8:0]taps_clk;
  wire NLW_IDELAYCTRL_inst_RDY_UNCONNECTED;
  wire NLW_IDELAYE3_A_CASC_IN_UNCONNECTED;
  wire NLW_IDELAYE3_A_CASC_OUT_UNCONNECTED;
  wire NLW_IDELAYE3_A_CASC_RETURN_UNCONNECTED;
  wire NLW_IDELAYE3_A_IDATAIN_UNCONNECTED;
  wire [8:0]NLW_IDELAYE3_A_CNTVALUEOUT_UNCONNECTED;
  wire NLW_IDELAYE3_CLK_CASC_IN_UNCONNECTED;
  wire NLW_IDELAYE3_CLK_CASC_OUT_UNCONNECTED;
  wire NLW_IDELAYE3_CLK_CASC_RETURN_UNCONNECTED;
  wire NLW_IDELAYE3_CLK_IDATAIN_UNCONNECTED;
  wire [8:0]NLW_IDELAYE3_CLK_CNTVALUEOUT_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  IDELAYCTRL #(
    .SIM_DEVICE("ULTRASCALE")) 
    IDELAYCTRL_inst
       (.RDY(NLW_IDELAYCTRL_inst_RDY_UNCONNECTED),
        .REFCLK(ref_clk),
        .RST(rst));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IDELAYE3 #(
    .CASCADE("NONE"),
    .DELAY_FORMAT("COUNT"),
    .DELAY_SRC("DATAIN"),
    .DELAY_TYPE("VAR_LOAD"),
    .DELAY_VALUE(0),
    .IS_CLK_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .LOOPBACK("FALSE"),
    .REFCLK_FREQUENCY(300.000000),
    .SIM_DEVICE("ULTRASCALE_PLUS"),
    .SIM_VERSION(2.000000),
    .UPDATE_MODE("ASYNC")) 
    IDELAYE3_A
       (.CASC_IN(NLW_IDELAYE3_A_CASC_IN_UNCONNECTED),
        .CASC_OUT(NLW_IDELAYE3_A_CASC_OUT_UNCONNECTED),
        .CASC_RETURN(NLW_IDELAYE3_A_CASC_RETURN_UNCONNECTED),
        .CE(1'b0),
        .CLK(ref_clk),
        .CNTVALUEIN(taps_A),
        .CNTVALUEOUT(NLW_IDELAYE3_A_CNTVALUEOUT_UNCONNECTED[8:0]),
        .DATAIN(A),
        .DATAOUT(delay_A),
        .EN_VTC(1'b0),
        .IDATAIN(NLW_IDELAYE3_A_IDATAIN_UNCONNECTED),
        .INC(1'b1),
        .LOAD(1'b1),
        .RST(rst));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IDELAYE3 #(
    .CASCADE("NONE"),
    .DELAY_FORMAT("COUNT"),
    .DELAY_SRC("DATAIN"),
    .DELAY_TYPE("VAR_LOAD"),
    .DELAY_VALUE(0),
    .IS_CLK_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .LOOPBACK("FALSE"),
    .REFCLK_FREQUENCY(300.000000),
    .SIM_DEVICE("ULTRASCALE_PLUS"),
    .SIM_VERSION(2.000000),
    .UPDATE_MODE("ASYNC")) 
    IDELAYE3_CLK
       (.CASC_IN(NLW_IDELAYE3_CLK_CASC_IN_UNCONNECTED),
        .CASC_OUT(NLW_IDELAYE3_CLK_CASC_OUT_UNCONNECTED),
        .CASC_RETURN(NLW_IDELAYE3_CLK_CASC_RETURN_UNCONNECTED),
        .CE(1'b0),
        .CLK(ref_clk),
        .CNTVALUEIN(taps_clk),
        .CNTVALUEOUT(NLW_IDELAYE3_CLK_CNTVALUEOUT_UNCONNECTED[8:0]),
        .DATAIN(clk),
        .DATAOUT(delay_clk),
        .EN_VTC(1'b0),
        .IDATAIN(NLW_IDELAYE3_CLK_IDATAIN_UNCONNECTED),
        .INC(1'b1),
        .LOAD(1'b1),
        .RST(rst));
  design_1_DSPSensor_0_0_dspe2 dspe2_cas
       (.A(delay_A),
        .CLK(delay_clk),
        .P(P),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "dspe2" *) 
module design_1_DSPSensor_0_0_dspe2
   (P,
    CLK,
    rst,
    A);
  output [47:0]P;
  input CLK;
  input rst;
  input [0:0]A;

  wire [0:0]A;
  wire CLK;
  wire [47:0]P;
  wire [29:0]P0;
  wire [29:0]P1;
  wire rst;
  wire NLW_DSP48E2_inst_1_CARRYCASCOUT_UNCONNECTED;
  wire NLW_DSP48E2_inst_1_MULTSIGNOUT_UNCONNECTED;
  wire NLW_DSP48E2_inst_1_OVERFLOW_UNCONNECTED;
  wire NLW_DSP48E2_inst_1_PATTERNBDETECT_UNCONNECTED;
  wire NLW_DSP48E2_inst_1_PATTERNDETECT_UNCONNECTED;
  wire NLW_DSP48E2_inst_1_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_DSP48E2_inst_1_ACOUT_UNCONNECTED;
  wire [17:0]NLW_DSP48E2_inst_1_BCOUT_UNCONNECTED;
  wire [3:0]NLW_DSP48E2_inst_1_CARRYOUT_UNCONNECTED;
  wire [47:30]NLW_DSP48E2_inst_1_P_UNCONNECTED;
  wire [47:0]NLW_DSP48E2_inst_1_PCOUT_UNCONNECTED;
  wire [7:0]NLW_DSP48E2_inst_1_XOROUT_UNCONNECTED;
  wire NLW_DSP48E2_inst_2_CARRYCASCOUT_UNCONNECTED;
  wire NLW_DSP48E2_inst_2_MULTSIGNOUT_UNCONNECTED;
  wire NLW_DSP48E2_inst_2_OVERFLOW_UNCONNECTED;
  wire NLW_DSP48E2_inst_2_PATTERNBDETECT_UNCONNECTED;
  wire NLW_DSP48E2_inst_2_PATTERNDETECT_UNCONNECTED;
  wire NLW_DSP48E2_inst_2_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_DSP48E2_inst_2_ACOUT_UNCONNECTED;
  wire [17:0]NLW_DSP48E2_inst_2_BCOUT_UNCONNECTED;
  wire [3:0]NLW_DSP48E2_inst_2_CARRYOUT_UNCONNECTED;
  wire [47:30]NLW_DSP48E2_inst_2_P_UNCONNECTED;
  wire [47:0]NLW_DSP48E2_inst_2_PCOUT_UNCONNECTED;
  wire [7:0]NLW_DSP48E2_inst_2_XOROUT_UNCONNECTED;
  wire NLW_DSP48E2_inst_3_CARRYCASCOUT_UNCONNECTED;
  wire NLW_DSP48E2_inst_3_MULTSIGNOUT_UNCONNECTED;
  wire NLW_DSP48E2_inst_3_OVERFLOW_UNCONNECTED;
  wire NLW_DSP48E2_inst_3_PATTERNBDETECT_UNCONNECTED;
  wire NLW_DSP48E2_inst_3_PATTERNDETECT_UNCONNECTED;
  wire NLW_DSP48E2_inst_3_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_DSP48E2_inst_3_ACOUT_UNCONNECTED;
  wire [17:0]NLW_DSP48E2_inst_3_BCOUT_UNCONNECTED;
  wire [3:0]NLW_DSP48E2_inst_3_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_DSP48E2_inst_3_PCOUT_UNCONNECTED;
  wire [7:0]NLW_DSP48E2_inst_3_XOROUT_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-11 {cell *THIS*}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(0),
    .ALUMODEREG(1),
    .AMULTSEL("AD"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BMULTSEL("B"),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .CREG(0),
    .DREG(0),
    .INMODEREG(1),
    .IS_ALUMODE_INVERTED(4'b0000),
    .IS_CARRYIN_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_INMODE_INVERTED(5'b00000),
    .IS_OPMODE_INVERTED(9'b000000000),
    .IS_RSTALLCARRYIN_INVERTED(1'b0),
    .IS_RSTALUMODE_INVERTED(1'b0),
    .IS_RSTA_INVERTED(1'b0),
    .IS_RSTB_INVERTED(1'b0),
    .IS_RSTCTRL_INVERTED(1'b0),
    .IS_RSTC_INVERTED(1'b0),
    .IS_RSTD_INVERTED(1'b0),
    .IS_RSTINMODE_INVERTED(1'b0),
    .IS_RSTM_INVERTED(1'b0),
    .IS_RSTP_INVERTED(1'b0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(1),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(0),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    DSP48E2_inst_1
       (.A({A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_DSP48E2_inst_1_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_DSP48E2_inst_1_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b1),
        .CARRYCASCOUT(NLW_DSP48E2_inst_1_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_DSP48E2_inst_1_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEAD(1'b1),
        .CEALUMODE(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEC(1'b1),
        .CECARRYIN(1'b1),
        .CECTRL(1'b1),
        .CED(1'b1),
        .CEINMODE(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(CLK),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b1,1'b0,1'b0}),
        .MULTSIGNIN(1'b1),
        .MULTSIGNOUT(NLW_DSP48E2_inst_1_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_DSP48E2_inst_1_OVERFLOW_UNCONNECTED),
        .P({NLW_DSP48E2_inst_1_P_UNCONNECTED[47:30],P0}),
        .PATTERNBDETECT(NLW_DSP48E2_inst_1_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_DSP48E2_inst_1_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_DSP48E2_inst_1_PCOUT_UNCONNECTED[47:0]),
        .RSTA(rst),
        .RSTALLCARRYIN(rst),
        .RSTALUMODE(rst),
        .RSTB(rst),
        .RSTC(rst),
        .RSTCTRL(rst),
        .RSTD(rst),
        .RSTINMODE(rst),
        .RSTM(rst),
        .RSTP(rst),
        .UNDERFLOW(NLW_DSP48E2_inst_1_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_DSP48E2_inst_1_XOROUT_UNCONNECTED[7:0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-11 {cell *THIS*}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(0),
    .ALUMODEREG(1),
    .AMULTSEL("AD"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BMULTSEL("B"),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .CREG(0),
    .DREG(0),
    .INMODEREG(1),
    .IS_ALUMODE_INVERTED(4'b0000),
    .IS_CARRYIN_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_INMODE_INVERTED(5'b00000),
    .IS_OPMODE_INVERTED(9'b000000000),
    .IS_RSTALLCARRYIN_INVERTED(1'b0),
    .IS_RSTALUMODE_INVERTED(1'b0),
    .IS_RSTA_INVERTED(1'b0),
    .IS_RSTB_INVERTED(1'b0),
    .IS_RSTCTRL_INVERTED(1'b0),
    .IS_RSTC_INVERTED(1'b0),
    .IS_RSTD_INVERTED(1'b0),
    .IS_RSTINMODE_INVERTED(1'b0),
    .IS_RSTM_INVERTED(1'b0),
    .IS_RSTP_INVERTED(1'b0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(1),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(0),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    DSP48E2_inst_2
       (.A(P0),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_DSP48E2_inst_2_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_DSP48E2_inst_2_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b1),
        .CARRYCASCOUT(NLW_DSP48E2_inst_2_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_DSP48E2_inst_2_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEAD(1'b1),
        .CEALUMODE(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEC(1'b1),
        .CECARRYIN(1'b1),
        .CECTRL(1'b1),
        .CED(1'b1),
        .CEINMODE(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(CLK),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b1,1'b0,1'b0}),
        .MULTSIGNIN(1'b1),
        .MULTSIGNOUT(NLW_DSP48E2_inst_2_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_DSP48E2_inst_2_OVERFLOW_UNCONNECTED),
        .P({NLW_DSP48E2_inst_2_P_UNCONNECTED[47:30],P1}),
        .PATTERNBDETECT(NLW_DSP48E2_inst_2_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_DSP48E2_inst_2_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_DSP48E2_inst_2_PCOUT_UNCONNECTED[47:0]),
        .RSTA(rst),
        .RSTALLCARRYIN(rst),
        .RSTALUMODE(rst),
        .RSTB(rst),
        .RSTC(rst),
        .RSTCTRL(rst),
        .RSTD(rst),
        .RSTINMODE(rst),
        .RSTM(rst),
        .RSTP(rst),
        .UNDERFLOW(NLW_DSP48E2_inst_2_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_DSP48E2_inst_2_XOROUT_UNCONNECTED[7:0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(0),
    .ALUMODEREG(1),
    .AMULTSEL("AD"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BMULTSEL("B"),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .CREG(0),
    .DREG(0),
    .INMODEREG(1),
    .IS_ALUMODE_INVERTED(4'b0000),
    .IS_CARRYIN_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_INMODE_INVERTED(5'b00000),
    .IS_OPMODE_INVERTED(9'b000000000),
    .IS_RSTALLCARRYIN_INVERTED(1'b0),
    .IS_RSTALUMODE_INVERTED(1'b0),
    .IS_RSTA_INVERTED(1'b0),
    .IS_RSTB_INVERTED(1'b0),
    .IS_RSTCTRL_INVERTED(1'b0),
    .IS_RSTC_INVERTED(1'b0),
    .IS_RSTD_INVERTED(1'b0),
    .IS_RSTINMODE_INVERTED(1'b0),
    .IS_RSTM_INVERTED(1'b0),
    .IS_RSTP_INVERTED(1'b0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(1),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    DSP48E2_inst_3
       (.A(P1),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_DSP48E2_inst_3_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_DSP48E2_inst_3_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b1),
        .CARRYCASCOUT(NLW_DSP48E2_inst_3_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_DSP48E2_inst_3_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEAD(1'b1),
        .CEALUMODE(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEC(1'b1),
        .CECARRYIN(1'b1),
        .CECTRL(1'b1),
        .CED(1'b1),
        .CEINMODE(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CLK(CLK),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b1,1'b0,1'b0}),
        .MULTSIGNIN(1'b1),
        .MULTSIGNOUT(NLW_DSP48E2_inst_3_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_DSP48E2_inst_3_OVERFLOW_UNCONNECTED),
        .P(P),
        .PATTERNBDETECT(NLW_DSP48E2_inst_3_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_DSP48E2_inst_3_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_DSP48E2_inst_3_PCOUT_UNCONNECTED[47:0]),
        .RSTA(rst),
        .RSTALLCARRYIN(rst),
        .RSTALUMODE(rst),
        .RSTB(rst),
        .RSTC(rst),
        .RSTCTRL(rst),
        .RSTD(rst),
        .RSTINMODE(rst),
        .RSTM(rst),
        .RSTP(rst),
        .UNDERFLOW(NLW_DSP48E2_inst_3_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_DSP48E2_inst_3_XOROUT_UNCONNECTED[7:0]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

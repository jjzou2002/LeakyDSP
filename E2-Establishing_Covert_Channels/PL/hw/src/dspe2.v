`timescale 1ns / 1ps

module dspe2(
    input  wire       CLK,
    input  wire       RST,
    input  wire[29:0] A,
    output wire[47:0] P2
    );

wire[47:0] P0;
wire[47:0] P1;

DSP48E2 #(
  // Feature Control Attributes: Data Path Selection
  .AMULTSEL("AD"),                    // Selects A input to multiplier (A, AD)
  .A_INPUT("DIRECT"),                // Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
  .BMULTSEL("B"),                    // Selects B input to multiplier (AD, B)
  .B_INPUT("DIRECT"),                // Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
  .PREADDINSEL("A"),                 // Selects input to pre-adder (A, B)
  .RND(48'h000000000000),            // Rounding Constant
  .USE_MULT("MULTIPLY"),             // Select multiplier usage (DYNAMIC, MULTIPLY, NONE)
  .USE_SIMD("ONE48"),                // SIMD selection (FOUR12, ONE48, TWO24)
  .USE_WIDEXOR("FALSE"),             // Use the Wide XOR function (FALSE, TRUE)
  .XORSIMD("XOR24_48_96"),           // Mode of operation for the Wide XOR (XOR12, XOR24_48_96)
  // Pattern Detector Attributes: Pattern Detection Configuration
  .AUTORESET_PATDET("NO_RESET"),     // NO_RESET, RESET_MATCH, RESET_NOT_MATCH
  .AUTORESET_PRIORITY("RESET"),      // Priority of AUTORESET vs. CEP (CEP, RESET).
  .MASK(48'h3fffffffffff),           // 48-bit mask value for pattern detect (1=ignore)
  .PATTERN(48'h000000000000),        // 48-bit pattern match for pattern detect
  .SEL_MASK("MASK"),                 // C, MASK, ROUNDING_MODE1, ROUNDING_MODE2
  .SEL_PATTERN("PATTERN"),           // Select pattern value (C, PATTERN)
  .USE_PATTERN_DETECT("NO_PATDET"),  // Enable pattern detect (NO_PATDET, PATDET)
  // Register Control Attributes: Pipeline Register Configuration
  .ACASCREG(0),                      // Number of pipeline stages between A/ACIN and ACOUT (0-2)
  .ADREG(0),                         // Pipeline stages for pre-adder (0-1)
  .ALUMODEREG(1),                    // Pipeline stages for ALUMODE (0-1)
  .AREG(0),                          // Pipeline stages for A (0-2)
  .BCASCREG(1),                      // Number of pipeline stages between B/BCIN and BCOUT (0-2)
  .BREG(1),                          // Pipeline stages for B (0-2)
  .CARRYINREG(1),                    // Pipeline stages for CARRYIN (0-1)
  .CARRYINSELREG(1),                 // Pipeline stages for CARRYINSEL (0-1)
  .CREG(0),                          // Pipeline stages for C (0-1)
  .DREG(0),                          // Pipeline stages for D (0-1)
  .INMODEREG(1),                     // Pipeline stages for INMODE (0-1)
  .MREG(0),                          // Multiplier pipeline stages (0-1)
  .OPMODEREG(1),                     // Pipeline stages for OPMODE (0-1)
  .PREG(0)                           // Number of pipeline stages for P (0-1)
)
DSP48E2_inst_1 (
  // Cascade outputs: Cascade Ports
  .ACOUT(),                   // 30-bit output: A port cascade
  .BCOUT(),                   // 18-bit output: B cascade
  .CARRYCASCOUT(),     // 1-bit output: Cascade carry
  .MULTSIGNOUT(),       // 1-bit output: Multiplier sign cascade
  .PCOUT(),                   // 48-bit output: Cascade output
  // Control outputs: Control Inputs/Status Bits
  .OVERFLOW(),             // 1-bit output: Overflow in add/acc
  .PATTERNBDETECT(), // 1-bit output: Pattern bar detect
  .PATTERNDETECT(),   // 1-bit output: Pattern detect
  .UNDERFLOW(),           // 1-bit output: Underflow in add/acc
  // Data outputs: Data Ports
  .CARRYOUT(),             // 4-bit output: Carry
  .P(P0),                           // 48-bit output: Primary data
  .XOROUT(),                 // 8-bit output: XOR data
  // Cascade inputs: Cascade Ports
  .ACIN(30'd0),                     // 30-bit input: A cascade data
  .BCIN(18'd0),                     // 18-bit input: B cascade
  .CARRYCASCIN(1'b1),       // 1-bit input: Cascade carry
  .MULTSIGNIN(1'b1),         // 1-bit input: Multiplier sign cascade
  .PCIN(),                     // 48-bit input: P cascade
  // Control inputs: Control Inputs/Status Bits
  .ALUMODE(4'b0000),               // 4-bit input: ALU control
  .CARRYINSEL(3'd0),         // 3-bit input: Carry select
  .CLK(CLK),                       // 1-bit input: Clock
  .INMODE(5'b00100),                 // 5-bit input: INMODE control
  .OPMODE(9'b000000101),                 // 9-bit input: Operation mode
  // Data inputs: Data Ports
  .A(A),                           // 30-bit input: A data
  .B(18'd1),                           // 18-bit input: B data
  .C(48'd0),                           // 48-bit input: C data
  .CARRYIN(1'b0),               // 1-bit input: Carry-in
  .D(25'd0),                           // 27-bit input: D data
  // Reset/Clock Enable inputs: Reset/Clock Enable Inputs
  .CEA1(1'b1),                     // 1-bit input: Clock enable for 1st stage AREG
  .CEA2(1'b1),                     // 1-bit input: Clock enable for 2nd stage AREG
  .CEAD(1'b1),                     // 1-bit input: Clock enable for ADREG
  .CEALUMODE(1'b1),           // 1-bit input: Clock enable for ALUMODE
  .CEB1(1'b1),                     // 1-bit input: Clock enable for 1st stage BREG
  .CEB2(1'b1),                     // 1-bit input: Clock enable for 2nd stage BREG
  .CEC(1'b1),                       // 1-bit input: Clock enable for CREG
  .CECARRYIN(1'b1),           // 1-bit input: Clock enable for CARRYINREG
  .CECTRL(1'b1),                 // 1-bit input: Clock enable for OPMODEREG and CARRYINSELREG
  .CED(1'b1),                       // 1-bit input: Clock enable for DREG
  .CEINMODE(1'b1),             // 1-bit input: Clock enable for INMODEREG
  .CEM(1'b1),                       // 1-bit input: Clock enable for MREG
  .CEP(1'b1),                       // 1-bit input: Clock enable for PREG
  .RSTA(RST),                     // 1-bit input: Reset for AREG
  .RSTALLCARRYIN(RST),   // 1-bit input: Reset for CARRYINREG
  .RSTALUMODE(RST),         // 1-bit input: Reset for ALUMODEREG
  .RSTB(RST),                     // 1-bit input: Reset for BREG
  .RSTC(RST),                     // 1-bit input: Reset for CREG
  .RSTCTRL(RST),               // 1-bit input: Reset for OPMODEREG and CARRYINSELREG
  .RSTD(RST),                     // 1-bit input: Reset for DREG and ADREG
  .RSTINMODE(RST),           // 1-bit input: Reset for INMODEREG
  .RSTM(RST),                     // 1-bit input: Reset for MREG
  .RSTP(RST)                      // 1-bit input: Reset for PREG
);

DSP48E2 #(
  // Feature Control Attributes: Data Path Selection
  .AMULTSEL("AD"),                    // Selects A input to multiplier (A, AD)
  .A_INPUT("DIRECT"),                // Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
  .BMULTSEL("B"),                    // Selects B input to multiplier (AD, B)
  .B_INPUT("DIRECT"),                // Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
  .PREADDINSEL("A"),                 // Selects input to pre-adder (A, B)
  .RND(48'h000000000000),            // Rounding Constant
  .USE_MULT("MULTIPLY"),             // Select multiplier usage (DYNAMIC, MULTIPLY, NONE)
  .USE_SIMD("ONE48"),                // SIMD selection (FOUR12, ONE48, TWO24)
  .USE_WIDEXOR("FALSE"),             // Use the Wide XOR function (FALSE, TRUE)
  .XORSIMD("XOR24_48_96"),           // Mode of operation for the Wide XOR (XOR12, XOR24_48_96)
  // Pattern Detector Attributes: Pattern Detection Configuration
  .AUTORESET_PATDET("NO_RESET"),     // NO_RESET, RESET_MATCH, RESET_NOT_MATCH
  .AUTORESET_PRIORITY("RESET"),      // Priority of AUTORESET vs. CEP (CEP, RESET).
  .MASK(48'h3fffffffffff),           // 48-bit mask value for pattern detect (1=ignore)
  .PATTERN(48'h000000000000),        // 48-bit pattern match for pattern detect
  .SEL_MASK("MASK"),                 // C, MASK, ROUNDING_MODE1, ROUNDING_MODE2
  .SEL_PATTERN("PATTERN"),           // Select pattern value (C, PATTERN)
  .USE_PATTERN_DETECT("NO_PATDET"),  // Enable pattern detect (NO_PATDET, PATDET)
  // Register Control Attributes: Pipeline Register Configuration
  .ACASCREG(0),                      // Number of pipeline stages between A/ACIN and ACOUT (0-2)
  .ADREG(0),                         // Pipeline stages for pre-adder (0-1)
  .ALUMODEREG(1),                    // Pipeline stages for ALUMODE (0-1)
  .AREG(0),                          // Pipeline stages for A (0-2)
  .BCASCREG(1),                      // Number of pipeline stages between B/BCIN and BCOUT (0-2)
  .BREG(1),                          // Pipeline stages for B (0-2)
  .CARRYINREG(1),                    // Pipeline stages for CARRYIN (0-1)
  .CARRYINSELREG(1),                 // Pipeline stages for CARRYINSEL (0-1)
  .CREG(0),                          // Pipeline stages for C (0-1)
  .DREG(0),                          // Pipeline stages for D (0-1)
  .INMODEREG(1),                     // Pipeline stages for INMODE (0-1)
  .MREG(0),                          // Multiplier pipeline stages (0-1)
  .OPMODEREG(1),                     // Pipeline stages for OPMODE (0-1)
  .PREG(0)                           // Number of pipeline stages for P (0-1)
)
DSP48E2_inst_2 (
  // Cascade outputs: Cascade Ports
  .ACOUT(),                   // 30-bit output: A port cascade
  .BCOUT(),                   // 18-bit output: B cascade
  .CARRYCASCOUT(),     // 1-bit output: Cascade carry
  .MULTSIGNOUT(),       // 1-bit output: Multiplier sign cascade
  .PCOUT(),                   // 48-bit output: Cascade output
  // Control outputs: Control Inputs/Status Bits
  .OVERFLOW(),             // 1-bit output: Overflow in add/acc
  .PATTERNBDETECT(), // 1-bit output: Pattern bar detect
  .PATTERNDETECT(),   // 1-bit output: Pattern detect
  .UNDERFLOW(),           // 1-bit output: Underflow in add/acc
  // Data outputs: Data Ports
  .CARRYOUT(),             // 4-bit output: Carry
  .P(P1),                           // 48-bit output: Primary data
  .XOROUT(),                 // 8-bit output: XOR data
  // Cascade inputs: Cascade Ports
  .ACIN(30'd0),                     // 30-bit input: A cascade data
  .BCIN(18'd0),                     // 18-bit input: B cascade
  .CARRYCASCIN(1'b1),       // 1-bit input: Cascade carry
  .MULTSIGNIN(1'b1),         // 1-bit input: Multiplier sign cascade
  .PCIN(),                     // 48-bit input: P cascade
  // Control inputs: Control Inputs/Status Bits
  .ALUMODE(4'b0000),               // 4-bit input: ALU control
  .CARRYINSEL(3'd0),         // 3-bit input: Carry select
  .CLK(CLK),                       // 1-bit input: Clock
  .INMODE(5'b00100),                 // 5-bit input: INMODE control
  .OPMODE(9'b000000101),                 // 9-bit input: Operation mode
  // Data inputs: Data Ports
  .A(P0[29:0]),                           // 30-bit input: A data
  .B(18'd1),                           // 18-bit input: B data
  .C(48'd0),                           // 48-bit input: C data
  .CARRYIN(1'b0),               // 1-bit input: Carry-in
  .D(25'd0),                           // 27-bit input: D data
  // Reset/Clock Enable inputs: Reset/Clock Enable Inputs
  .CEA1(1'b1),                     // 1-bit input: Clock enable for 1st stage AREG
  .CEA2(1'b1),                     // 1-bit input: Clock enable for 2nd stage AREG
  .CEAD(1'b1),                     // 1-bit input: Clock enable for ADREG
  .CEALUMODE(1'b1),           // 1-bit input: Clock enable for ALUMODE
  .CEB1(1'b1),                     // 1-bit input: Clock enable for 1st stage BREG
  .CEB2(1'b1),                     // 1-bit input: Clock enable for 2nd stage BREG
  .CEC(1'b1),                       // 1-bit input: Clock enable for CREG
  .CECARRYIN(1'b1),           // 1-bit input: Clock enable for CARRYINREG
  .CECTRL(1'b1),                 // 1-bit input: Clock enable for OPMODEREG and CARRYINSELREG
  .CED(1'b1),                       // 1-bit input: Clock enable for DREG
  .CEINMODE(1'b1),             // 1-bit input: Clock enable for INMODEREG
  .CEM(1'b1),                       // 1-bit input: Clock enable for MREG
  .CEP(1'b1),                       // 1-bit input: Clock enable for PREG
  .RSTA(RST),                     // 1-bit input: Reset for AREG
  .RSTALLCARRYIN(RST),   // 1-bit input: Reset for CARRYINREG
  .RSTALUMODE(RST),         // 1-bit input: Reset for ALUMODEREG
  .RSTB(RST),                     // 1-bit input: Reset for BREG
  .RSTC(RST),                     // 1-bit input: Reset for CREG
  .RSTCTRL(RST),               // 1-bit input: Reset for OPMODEREG and CARRYINSELREG
  .RSTD(RST),                     // 1-bit input: Reset for DREG and ADREG
  .RSTINMODE(RST),           // 1-bit input: Reset for INMODEREG
  .RSTM(RST),                     // 1-bit input: Reset for MREG
  .RSTP(RST)                      // 1-bit input: Reset for PREG
);

DSP48E2 #(
  // Feature Control Attributes: Data Path Selection
  .AMULTSEL("AD"),                    // Selects A input to multiplier (A, AD)
  .A_INPUT("DIRECT"),                // Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
  .BMULTSEL("B"),                    // Selects B input to multiplier (AD, B)
  .B_INPUT("DIRECT"),                // Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
  .PREADDINSEL("A"),                 // Selects input to pre-adder (A, B)
  .RND(48'h000000000000),            // Rounding Constant
  .USE_MULT("MULTIPLY"),             // Select multiplier usage (DYNAMIC, MULTIPLY, NONE)
  .USE_SIMD("ONE48"),                // SIMD selection (FOUR12, ONE48, TWO24)
  .USE_WIDEXOR("FALSE"),             // Use the Wide XOR function (FALSE, TRUE)
  .XORSIMD("XOR24_48_96"),           // Mode of operation for the Wide XOR (XOR12, XOR24_48_96)
  // Pattern Detector Attributes: Pattern Detection Configuration
  .AUTORESET_PATDET("NO_RESET"),     // NO_RESET, RESET_MATCH, RESET_NOT_MATCH
  .AUTORESET_PRIORITY("RESET"),      // Priority of AUTORESET vs. CEP (CEP, RESET).
  .MASK(48'h3fffffffffff),           // 48-bit mask value for pattern detect (1=ignore)
  .PATTERN(48'h000000000000),        // 48-bit pattern match for pattern detect
  .SEL_MASK("MASK"),                 // C, MASK, ROUNDING_MODE1, ROUNDING_MODE2
  .SEL_PATTERN("PATTERN"),           // Select pattern value (C, PATTERN)
  .USE_PATTERN_DETECT("NO_PATDET"),  // Enable pattern detect (NO_PATDET, PATDET)
  // Register Control Attributes: Pipeline Register Configuration
  .ACASCREG(0),                      // Number of pipeline stages between A/ACIN and ACOUT (0-2)
  .ADREG(0),                         // Pipeline stages for pre-adder (0-1)
  .ALUMODEREG(1),                    // Pipeline stages for ALUMODE (0-1)
  .AREG(0),                          // Pipeline stages for A (0-2)
  .BCASCREG(1),                      // Number of pipeline stages between B/BCIN and BCOUT (0-2)
  .BREG(1),                          // Pipeline stages for B (0-2)
  .CARRYINREG(1),                    // Pipeline stages for CARRYIN (0-1)
  .CARRYINSELREG(1),                 // Pipeline stages for CARRYINSEL (0-1)
  .CREG(0),                          // Pipeline stages for C (0-1)
  .DREG(0),                          // Pipeline stages for D (0-1)
  .INMODEREG(1),                     // Pipeline stages for INMODE (0-1)
  .MREG(0),                          // Multiplier pipeline stages (0-1)
  .OPMODEREG(1),                     // Pipeline stages for OPMODE (0-1)
  .PREG(1)                           // Number of pipeline stages for P (0-1)
)
DSP48E2_inst_3 (
  // Cascade outputs: Cascade Ports
  .ACOUT(),                   // 30-bit output: A port cascade
  .BCOUT(),                   // 18-bit output: B cascade
  .CARRYCASCOUT(),     // 1-bit output: Cascade carry
  .MULTSIGNOUT(),       // 1-bit output: Multiplier sign cascade
  .PCOUT(),                   // 48-bit output: Cascade output
  // Control outputs: Control Inputs/Status Bits
  .OVERFLOW(),             // 1-bit output: Overflow in add/acc
  .PATTERNBDETECT(), // 1-bit output: Pattern bar detect
  .PATTERNDETECT(),   // 1-bit output: Pattern detect
  .UNDERFLOW(),           // 1-bit output: Underflow in add/acc
  // Data outputs: Data Ports
  .CARRYOUT(),             // 4-bit output: Carry
  .P(P2),                           // 48-bit output: Primary data
  .XOROUT(),                 // 8-bit output: XOR data
  // Cascade inputs: Cascade Ports
  .ACIN(30'd0),                     // 30-bit input: A cascade data
  .BCIN(18'd0),                     // 18-bit input: B cascade
  .CARRYCASCIN(1'b1),       // 1-bit input: Cascade carry
  .MULTSIGNIN(1'b1),         // 1-bit input: Multiplier sign cascade
  .PCIN(),                     // 48-bit input: P cascade
  // Control inputs: Control Inputs/Status Bits
  .ALUMODE(4'b0000),               // 4-bit input: ALU control
  .CARRYINSEL(3'd0),         // 3-bit input: Carry select
  .CLK(CLK),                       // 1-bit input: Clock
  .INMODE(5'b00100),                 // 5-bit input: INMODE control
  .OPMODE(9'b000000101),                 // 9-bit input: Operation mode
  // Data inputs: Data Ports
  .A(P1[29:0]),                           // 30-bit input: A data
  .B(18'd1),                           // 18-bit input: B data
  .C(48'd0),                           // 48-bit input: C data
  .CARRYIN(1'b0),               // 1-bit input: Carry-in
  .D(25'd0),                           // 27-bit input: D data
  // Reset/Clock Enable inputs: Reset/Clock Enable Inputs
  .CEA1(1'b1),                     // 1-bit input: Clock enable for 1st stage AREG
  .CEA2(1'b1),                     // 1-bit input: Clock enable for 2nd stage AREG
  .CEAD(1'b1),                     // 1-bit input: Clock enable for ADREG
  .CEALUMODE(1'b1),           // 1-bit input: Clock enable for ALUMODE
  .CEB1(1'b1),                     // 1-bit input: Clock enable for 1st stage BREG
  .CEB2(1'b1),                     // 1-bit input: Clock enable for 2nd stage BREG
  .CEC(1'b1),                       // 1-bit input: Clock enable for CREG
  .CECARRYIN(1'b1),           // 1-bit input: Clock enable for CARRYINREG
  .CECTRL(1'b1),                 // 1-bit input: Clock enable for OPMODEREG and CARRYINSELREG
  .CED(1'b1),                       // 1-bit input: Clock enable for DREG
  .CEINMODE(1'b1),             // 1-bit input: Clock enable for INMODEREG
  .CEM(1'b1),                       // 1-bit input: Clock enable for MREG
  .CEP(1'b1),                       // 1-bit input: Clock enable for PREG
  .RSTA(RST),                     // 1-bit input: Reset for AREG
  .RSTALLCARRYIN(RST),   // 1-bit input: Reset for CARRYINREG
  .RSTALUMODE(RST),         // 1-bit input: Reset for ALUMODEREG
  .RSTB(RST),                     // 1-bit input: Reset for BREG
  .RSTC(RST),                     // 1-bit input: Reset for CREG
  .RSTCTRL(RST),               // 1-bit input: Reset for OPMODEREG and CARRYINSELREG
  .RSTD(RST),                     // 1-bit input: Reset for DREG and ADREG
  .RSTINMODE(RST),           // 1-bit input: Reset for INMODEREG
  .RSTM(RST),                     // 1-bit input: Reset for MREG
  .RSTP(RST)                      // 1-bit input: Reset for PREG
);
endmodule

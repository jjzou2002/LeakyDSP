`timescale 1ns / 1ps
module DSPSensor(
    input   wire        ref_clk,
    input   wire        rst,
    input   wire        A,
    input   wire        clk,
    input   wire[4:0]   taps_clk,
    input   wire[4:0]   taps_A,
    output  wire[47:0]  P
    );
    
    wire       delay_clk;
    wire       delay_A;
    
    wire[29:0] data_A; 
    genvar i;
    generate
        for (i = 0; i < 30; i = i + 1) begin 
            assign data_A[i] = delay_A;
        end
    endgenerate
    
   IDELAYCTRL IDELAYCTRL_inst (
      .RDY(),           // 1-bit output: Ready output
      .REFCLK(ref_clk),  // 1-bit input: Reference clock input
      .RST(rst)         // 1-bit input: Active high reset input
   );
   
   IDELAYE2 #(
      .CINVCTRL_SEL("FALSE"),            // Enable dynamic clock inversion (FALSE, TRUE)
      .DELAY_SRC("DATAIN"),              // Delay input (IDATAIN, DATAIN)
      .HIGH_PERFORMANCE_MODE("TRUE"),    // Reduced jitter ("TRUE"), Reduced power ("FALSE")
      .IDELAY_TYPE("VAR_LOAD"),         // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
      .IDELAY_VALUE(0),                  // Input delay tap setting (0-31)
      .PIPE_SEL("FALSE"),               // Select pipelined mode, FALSE, TRUE
      .REFCLK_FREQUENCY(300.0),          // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
      .SIGNAL_PATTERN("CLOCK")          // DATA, CLOCK input signal
   )
   IDELAYE2_CLK (
      .CNTVALUEOUT(),                     // 5-bit output: Counter value output
      .DATAOUT(delay_clk),                // 1-bit output: Delayed data output
      .C(ref_clk),                     // 1-bit input: Clock input
      .CE(1'b0),                       // 1-bit input: Active high enable increment/decrement input
      .CINVCTRL(1'b0),                 // 1-bit input: Dynamic clock inversion input
      .CNTVALUEIN(taps_clk),               // 5-bit input: Counter value input
      .DATAIN(clk),                    // 1-bit input: Internal delay data input
      .IDATAIN(),                      // 1-bit input: Data input from the I/O
      .INC(1'b1),                      // 1-bit input: Increment / Decrement tap delay input
      .LD(1'b1),                      // 1-bit input: Load IDELAY_VALUE input
      .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
      .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
   );
   
   
   IDELAYE2 #(
      .CINVCTRL_SEL("FALSE"),            // Enable dynamic clock inversion (FALSE, TRUE)
      .DELAY_SRC("DATAIN"),              // Delay input (IDATAIN, DATAIN)
      .HIGH_PERFORMANCE_MODE("TRUE"),    // Reduced jitter ("TRUE"), Reduced power ("FALSE")
      .IDELAY_TYPE("VAR_LOAD"),         // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
      .IDELAY_VALUE(0),                  // Input delay tap setting (0-31)
      .PIPE_SEL("FALSE"),               // Select pipelined mode, FALSE, TRUE
      .REFCLK_FREQUENCY(300.0),          // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
      .SIGNAL_PATTERN("CLOCK")          // DATA, CLOCK input signal
   )
   IDELAYE2_A (
      .CNTVALUEOUT(),                     // 5-bit output: Counter value output
      .DATAOUT(delay_A),                // 1-bit output: Delayed data output
      .C(ref_clk),                     // 1-bit input: Clock input
      .CE(1'b0),                       // 1-bit input: Active high enable increment/decrement input
      .CINVCTRL(1'b0),                 // 1-bit input: Dynamic clock inversion input
      .CNTVALUEIN(taps_A),               // 5-bit input: Counter value input
      .DATAIN(A),                    // 1-bit input: Internal delay data input
      .IDATAIN(),                      // 1-bit input: Data input from the I/O
      .INC(1'b1),                      // 1-bit input: Increment / Decrement tap delay input
      .LD(1'b1),                      // 1-bit input: Load IDELAY_VALUE input
      .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
      .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
   );
   
   dspe1 dspe1_cas(
        .CLK(delay_clk),
        .RST(rst),
        .A(data_A),
        .P2(P)
   );
endmodule

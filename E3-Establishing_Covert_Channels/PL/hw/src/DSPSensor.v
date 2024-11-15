`timescale 1ns / 1ps
module DSPSensor(
    input   wire        ref_clk,
    input   wire        rst,
    input   wire        A,
    input   wire        clk,
    input   wire[8:0]   taps_clk,
    input   wire[8:0]   taps_A,
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
    
   IDELAYCTRL #(
      .SIM_DEVICE("ULTRASCALE")  // Must be set to "ULTRASCALE" 
   )
   IDELAYCTRL_inst (
      .RDY(),       // 1-bit output: Ready output
      .REFCLK(ref_clk), // 1-bit input: Reference clock input
      .RST(rst)        // 1-bit input: Active high reset input. Asynchronous assert, synchronous deassert to REFCLK.
   );
   
   IDELAYE3 #(
      .CASCADE("NONE"),               // Cascade setting (MASTER, NONE, SLAVE_END, SLAVE_MIDDLE)
      .DELAY_FORMAT("COUNT"),          // Units of the DELAY_VALUE (COUNT, TIME)
      .DELAY_SRC("DATAIN"),          // Delay input (DATAIN, IDATAIN)
      .DELAY_TYPE("VAR_LOAD"),           // Set the type of tap delay line (FIXED, VARIABLE, VAR_LOAD)
      .DELAY_VALUE(0),                // Input delay value setting
      .IS_CLK_INVERTED(1'b0),         // Optional inversion for CLK
      .IS_RST_INVERTED(1'b0),         // Optional inversion for RST
      .REFCLK_FREQUENCY(300.0),       // IDELAYCTRL clock input frequency in MHz (200.0-2667.0)
      .SIM_DEVICE("ULTRASCALE_PLUS"), // Set the device version (ULTRASCALE, ULTRASCALE_PLUS,
                                      // ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
      .UPDATE_MODE("ASYNC")           // Determines when updates to the delay will take effect (ASYNC, MANUAL,
                                      // SYNC)
   )
   IDELAYE3_CLK (
      .CASC_OUT(),       // 1-bit output: Cascade delay output to ODELAY input cascade
      .CNTVALUEOUT(), // 9-bit output: Counter value output
      .DATAOUT(delay_clk),         // 1-bit output: Delayed data output
      .CASC_IN(),         // 1-bit input: Cascade delay input from slave ODELAY CASCADE_OUT
      .CASC_RETURN(), // 1-bit input: Cascade delay returning from slave ODELAY DATAOUT
      .CE(1'b0),                   // 1-bit input: Active high enable increment/decrement input
      .CLK(ref_clk),                 // 1-bit input: Clock input
      .CNTVALUEIN(taps_clk),   // 9-bit input: Counter value input
      .DATAIN(clk),           // 1-bit input: Data input from the logic
      .EN_VTC(1'b0),           // 1-bit input: Keep delay constant over VT
      .IDATAIN(),         // 1-bit input: Data input from the IOBUF
      .INC(1'b1),                 // 1-bit input: Increment / Decrement tap delay input
      .LOAD(1'b1),               // 1-bit input: Load DELAY_VALUE input
      .RST(rst)                  // 1-bit input: Asynchronous Reset to the DELAY_VALUE
   );
   
   IDELAYE3 #(
      .CASCADE("NONE"),               // Cascade setting (MASTER, NONE, SLAVE_END, SLAVE_MIDDLE)
      .DELAY_FORMAT("COUNT"),          // Units of the DELAY_VALUE (COUNT, TIME)
      .DELAY_SRC("DATAIN"),          // Delay input (DATAIN, IDATAIN)
      .DELAY_TYPE("VAR_LOAD"),           // Set the type of tap delay line (FIXED, VARIABLE, VAR_LOAD)
      .DELAY_VALUE(0),                // Input delay value setting
      .IS_CLK_INVERTED(1'b0),         // Optional inversion for CLK
      .IS_RST_INVERTED(1'b0),         // Optional inversion for RST
      .REFCLK_FREQUENCY(300.0),       // IDELAYCTRL clock input frequency in MHz (200.0-2667.0)
      .SIM_DEVICE("ULTRASCALE_PLUS"), // Set the device version (ULTRASCALE, ULTRASCALE_PLUS,
                                      // ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
      .UPDATE_MODE("ASYNC")           // Determines when updates to the delay will take effect (ASYNC, MANUAL,
                                      // SYNC)
   )
   IDELAYE3_A (
      .CASC_OUT(),       // 1-bit output: Cascade delay output to ODELAY input cascade
      .CNTVALUEOUT(), // 9-bit output: Counter value output
      .DATAOUT(delay_A),         // 1-bit output: Delayed data output
      .CASC_IN(),         // 1-bit input: Cascade delay input from slave ODELAY CASCADE_OUT
      .CASC_RETURN(), // 1-bit input: Cascade delay returning from slave ODELAY DATAOUT
      .CE(1'b0),                   // 1-bit input: Active high enable increment/decrement input
      .CLK(ref_clk),                 // 1-bit input: Clock input
      .CNTVALUEIN(taps_A),   // 9-bit input: Counter value input
      .DATAIN(A),           // 1-bit input: Data input from the logic
      .EN_VTC(1'b0),           // 1-bit input: Keep delay constant over VT
      .IDATAIN(),         // 1-bit input: Data input from the IOBUF
      .INC(1'b1),                 // 1-bit input: Increment / Decrement tap delay input
      .LOAD(1'b1),               // 1-bit input: Load DELAY_VALUE input
      .RST(rst)                  // 1-bit input: Asynchronous Reset to the DELAY_VALUE
   );
   
  
   
   dspe2 dspe2_cas(
        .CLK(delay_clk),
        .RST(rst),
        .A(data_A),
        .P2(P)
   );
   
endmodule
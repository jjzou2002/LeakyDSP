//create a power virus which does nothing but draw power
//when enabled, activity factor is 1
module power_virus(input clk, input enable, output z);
    
    wire w1, w2, w3;
    
    FDCE FDCE_0 (.Q(w1), .D(w3), .CE(1), .C(clk), .CLR(0));
    assign w2 = ~w1;
    assign w3 = w2 & enable;
    assign z = w1;
    
    //(* LOCK_PINS = "ALL" *) LUT1 #(.INIT(2'b01)) LUT_INV (.O(w2), .I0(w1));
    //(* LOCK_PINS = "ALL" *) LUT2 #(.INIT(4'b1000)) LUT_AND (.O(w3), .I0(w2), .I1(enable));
endmodule

module power_virus_set(input clk, input enable, output z);
parameter BANK_SIZE  = 1000;
wire [BANK_SIZE-1:0] x;
genvar i;
generate
for(i = 0; i < BANK_SIZE; i=i+1) begin: virus_set
    power_virus pv (.clk(clk), .enable(enable), .z(x[i]));
end
endgenerate
assign z = ^x;
endmodule

//create a bank of power viruses
module power_virus_bank(input clk, input [BANK_COUNT-1:0] enable, output z);
parameter BANK_COUNT =  8;
parameter BANK_SIZE  = 1000;
wire [BANK_COUNT-1:0] x;
genvar i;
generate
for(i = 0; i < BANK_COUNT; i=i+1) begin : virus_bank
    power_virus_set pvs (.clk(clk), .enable(enable[i]), .z(x[i]));
end
endgenerate
assign z = ^x;
endmodule
//https://hdlbits.01xz.net/wiki/Mt2015_lfsr

module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    always @(posedge KEY[0]) begin
        case (KEY[1])
            1'b0: LEDR <= {LEDR[1]^LEDR[2],LEDR[0],LEDR[2]};
            1'b1: LEDR <= SW;
        endcase
    end


endmodule

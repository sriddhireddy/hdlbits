//https://hdlbits.01xz.net/wiki/Mt2015_muxdff

module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    wire d;
    
    assign d= L? r_in:q_in;
    always @(posedge clk)
        Q<=d;
        

endmodule

//https://hdlbits.01xz.net/wiki/Bugs_nand3

module top_module (input a, input b, input c, output out);//
	
    wire res;
    andgate inst1 ( res, a, b, c, 1'b1, 1'b1 );
    assign out = ~res;

endmodule

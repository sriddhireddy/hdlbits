//https://hdlbits.01xz.net/wiki/Edgedetect

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0]in_prev;
    
    always @(posedge clk) begin
        pedge = in & (~in_prev);
        in_prev <= in;
    end

endmodule

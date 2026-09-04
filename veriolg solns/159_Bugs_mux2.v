//https://hdlbits.01xz.net/wiki/Bugs_mux2

module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out  );

    always @(*) begin
        case(sel)
            1'b0: out = b;
            1'b1: out = a;
        endcase
    end

endmodule

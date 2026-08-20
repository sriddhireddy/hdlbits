//https://hdlbits.01xz.net/wiki/Countslow

module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always @(posedge clk) begin
        if (reset) q <= 4'b0;
        else if (slowena) begin
            if (q==4'd9) q <= 4'b0;
            else q <= q+4'b1;
        end
    end

endmodule



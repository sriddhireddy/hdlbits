//https://hdlbits.01xz.net/wiki/Countbcd

module count10 (input clk, reset, en, output reg [3:0]q);
    always @(posedge clk) begin
        if (reset) q <= 4'd0;
        else if (en) begin
            q <= ((q==4'd9)? 4'd0 : (q + 1'b1));
        end
    end
endmodule 

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    wire [3:0]q3,q2,q1,q0;
    
    assign ena[1] = (q0 == 4'd9);
    assign ena[2] = (q0 == 4'd9) && (q1 == 4'd9);
    assign ena[3] = (q0 == 4'd9) && (q1 == 4'd9) && (q2 == 4'd9);
    
    count10 c0(clk,reset,1'b1,q0);
    count10 c1(clk,reset,ena[1],q1);
    count10 c2(clk,reset,ena[2],q2);
    count10 c3(clk,reset,ena[3],q3);
    
    assign q={q3,q2,q1,q0};

endmodule

//https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q4

module dff(input wire clk, input wire d, output reg q);
    always @ (posedge clk) begin
       q <= d;
    end
endmodule

module top_module (
    input clk,
    input x,
    output z
); 
    
    reg [2:0]q;
    dff d1(.clk(clk), .d(q[0]^x), .q(q[0]));
    dff d2(.clk(clk), .d(~q[1]&x), .q(q[1]));
    dff d3(.clk(clk), .d(~q[2]|x), .q(q[2]));
    
    assign z = ~(q[0]|q[1]|q[2]);

endmodule

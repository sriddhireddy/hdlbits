//https://hdlbits.01xz.net/wiki/Exams/m2014_q4d

module top_module (
    input clk,
    input in, 
    output out);
    wire d;
    
    assign d = in^out;
    always @(posedge clk)
        out<=d;

endmodule

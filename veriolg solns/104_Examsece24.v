//https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q7b

module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0]q2,q1,q0;
    
    assign c_enable[0] = 1'b1; //always
    assign c_enable[1] = (q0==4'd9); //when it reaches 9
    assign c_enable[2] = (q0==4'd9)&&(q1==4'd9); //when it reaches 99

    bcdcount counter0 (clk, reset, c_enable[0],q0);
    bcdcount counter1 (clk, reset, c_enable[1],q1);
    bcdcount counter2 (clk, reset, c_enable[2],q2);
    
    assign OneHertz = (q0==4'd9)&&(q1==4'd9)&&(q2==4'd9); //when it reaches 999

endmodule

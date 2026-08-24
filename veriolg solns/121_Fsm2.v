//https://hdlbits.01xz.net/wiki/Fsm2

module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            1'b0: next_state = j? 1'b1 : 1'b0;
            1'b1: next_state = k? 1'b0 : 1'b1;
        endcase        
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if (areset) state <= 1'b0;
        else state <= next_state;
    end

    // Output logic
    assign out = state;

endmodule

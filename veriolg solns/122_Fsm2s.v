//https://hdlbits.01xz.net/wiki/Fsm2s

module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
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

    always @(posedge clk) begin
        // State flip-flops with synchronous reset
        if (reset) state <= 1'b0;
        else state <= next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = state;


endmodule

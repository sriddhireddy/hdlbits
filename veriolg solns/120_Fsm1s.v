//https://hdlbits.01xz.net/wiki/Fsm1s

// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A=0, B=1;

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            present_state <= 1'b1;
        end 
        else begin
            case (present_state)
                // Fill in state transition logicQ
                1'b0: next_state = in? 1'b0 : 1'b1;
            	1'b1: next_state = in? 1'b1 : 1'b0;
            endcase

            // State flip-flops
            present_state <= next_state;   
        end
    end
    assign out = present_state;

endmodule

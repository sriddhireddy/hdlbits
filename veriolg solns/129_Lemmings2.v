//https://hdlbits.01xz.net/wiki/Lemmings2

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter left=2'b00, right=2'b01, fall_l=2'b10, fall_r=2'b11;
    reg [1:0]state, next_state;
    
    always @(*) begin
        case(state)
            left: next_state= ground? (bump_left? right : left) : fall_l;
            right: next_state= ground? (bump_right? left : right) : fall_r;
            fall_l: next_state= ground? left : fall_l;
            fall_r: next_state= ground? right : fall_r;
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if (areset) state <= left;
        else state <= next_state;
    end
    
    assign walk_left = (state==left);
    assign walk_right = (state==right);
    assign aaah = (state==fall_l || state==fall_r);

endmodule

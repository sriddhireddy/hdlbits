//https://hdlbits.01xz.net/wiki/Lemmings3

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter left=3'b000, right=3'b001, fall_l=3'b010, fall_r=3'b011, dig_l=3'b100, dig_r=3'b101;
    reg [2:0]state, next_state;
    
    always @(*) begin
        case(state)
            left: next_state= ground? (dig? dig_l : (bump_left? right : left)) : fall_l;
            right: next_state= ground? (dig? dig_r : (bump_right? left : right)) : fall_r;
            fall_l: next_state= ground? left : fall_l;
            fall_r: next_state= ground? right : fall_r;
            dig_l: next_state = ground? dig_l : fall_l;
            dig_r: next_state = ground? dig_r : fall_r;
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if (areset) state <= left;
        else state <= next_state;
    end
    
    assign walk_left = (state==left);
    assign walk_right = (state==right);
    assign aaah = (state==fall_l || state==fall_r);
    assign digging = (state==dig_l || state==dig_r);

endmodule


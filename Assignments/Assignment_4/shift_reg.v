module shift_reg(
    input [63:0] load,
    input en,
    input clk,
    input [1:0] amount,
    output reg [63:0] q
);




always @(posedge clk) begin
    if (!en) begin
        q <= load;
    end
    else begin
        case (amount)
            2'b00: q <= load << 1; // Shift left by 1
            2'b01: q <= load << 8; // Shift left by 8
            2'b10: q <= {load[63], load [63:1]}; // Shift right by 1 with sign extension
            2'b11: q <= {{8{load[63]}}, load [63:8]}; // Shift right by 8 with sign extension
            default: q <= load; // Default case, no shift
        endcase
    end
end

endmodule
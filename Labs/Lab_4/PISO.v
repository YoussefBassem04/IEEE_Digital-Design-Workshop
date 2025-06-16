module PISO(input [3:0] P_in, input clk,rst,load_shift, output reg S_out);

reg [3:0] shift_reg;
always @(posedge clk) begin
    if (!rst) begin
        S_out = 1'b0; // Reset output to 0
    end
    else begin
        if(load_shift) begin
          shift_reg <= P_in; // Load the input into the shift register
        end
        else begin
          S_out <= shift_reg[3]; // Output the MOST significant bit
          shift_reg <= shift_reg << 1; // Shift left
        end
    end
    
end

endmodule
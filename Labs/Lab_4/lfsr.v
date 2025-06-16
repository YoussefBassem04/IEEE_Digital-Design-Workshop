module lfsr(input clk, rst, output reg [3:0] lfsr_out);

wire feedback;
assign feedback = lfsr_out[3] ^ lfsr_out[2]; // XOR of the last two bits
always @(posedge clk) begin
    if (!rst) begin
        lfsr_out <= 4'b0001; // Initialize LFSR to a non-zero value
    end else begin
        lfsr_out <= {lfsr_out[2:0], feedback}; // Shift left and insert feedback bit
    end
end

endmodule
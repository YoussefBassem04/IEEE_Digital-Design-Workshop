module lfsr (
    input clk,
    input rst,
    output reg [3:0] out
);

    wire feedback;

    assign feedback = out[3] ^ out[2]; // XOR tap positions (bits 4 and 3)

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            
            out <= 4'b0001;  // seed
        end else begin
            out <= {out[2:0], feedback};  // shift left, insert feedback in LSB
        end
    end

endmodule

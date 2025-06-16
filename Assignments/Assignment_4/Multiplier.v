module Multiplier #(parameter N = 8)(
    input [N-1:0] A,
    input [N-1:0] B,
    output [2*N-1:0] out
);
assign out = A * B; // Assign the product of A and B to out


endmodule
module rem(input [2:0] A,B, output [3:0] out);
assign out[2] = A[2] ^ B[2];
assign out[1:0] = A[1:0] % B[1:0];
assign out[3] = (A[2] & B[2]) | (A[1] & B[1]) | (A[0] & B[0]); // Overflow condition
endmodule
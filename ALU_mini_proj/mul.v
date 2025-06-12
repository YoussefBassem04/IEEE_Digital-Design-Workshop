module mul(input [2:0] A,B, output reg [3:0] out);


always @(*) begin
    out[3:0] = A[1:0] * B[1:0];
    out [2] = A[2] ^ B[2];
end
endmodule
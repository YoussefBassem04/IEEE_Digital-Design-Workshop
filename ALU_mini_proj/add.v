module add(input [2:0] A,B, output reg [3:0] out);

reg [2:0] c;
reg [2:0] s;
reg overflow;
reg [2:0] A_temp, B_temp;
reg sign_flag;

always @(*) begin
    A_temp = A;
    B_temp = B;
    if (A[2]) begin
        A_temp [2] = A[2]; // Keep sign bit as is
        A_temp [1:0] = ~(A[1:0]) + 1; // Two's complement for negative numbers
    end
    if (B[2]) begin
        B_temp [2] = B[2]; // Keep sign bit as is
        B_temp [1:0] = ~(B[1:0]) + 1; // Two's complement for negative numbers
    end
    {c, s} = A_temp + B_temp; 
    overflow = c[2] ^ c[1];
    sign_flag = s[2] ^ overflow; // Sign bit of the result
    if (sign_flag) begin
        s[1:0] = ~(s[1:0]) + 1; // Two's complement for negative result
    end
    out = {overflow, sign_flag, s[1:0]}; 

end


endmodule
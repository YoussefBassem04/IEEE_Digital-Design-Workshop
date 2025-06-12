module mul_DUT;
reg [2:0] A, B;
wire [3:0] out;

mul uut (
    .A(A),
    .B(B),
    .out(out)
);

initial begin
    A = 3'b000; B = 3'b000; // Test case 1
    #10;   
    $monitor("A: %b, B: %b, out: %b", A, B, out);
    if (out !== 4'b0000) $display("Test case 1 failed: expected 000, got %b", out);
    A = 3'b001; B = 3'b001; // Test case 2
    #10;
    if (out !== 4'b0001) $display("Test case 2 failed: expected 001, got %b", out);
    A = 3'b010; B = 3'b101; // Test case 3
    #10;
    if (out !== 4'b0110) $display("Test case 3 failed: expected 000, got %b", out);
    A = 3'b111; B = 3'b011; // Test case 4
    #10;
    if (out !== 4'b1101) $display("Test case 4 failed: expected 1101, got %b", out);
    $monitor("A: %b, B: %b, out: %b", A, B, out);  
    $stop; 
end


endmodule
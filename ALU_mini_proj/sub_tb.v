module sub_DUT;
reg [2:0] A, B; 
wire [3:0] out;
sub uut (
    .A(A),
    .B(B),
    .out(out)
);

initial begin
    A = 3'b000; B = 3'b001; // Test case 1
    #10;   
    if (out != 4'b0101) $display("Test case 1 failed: expected b0101, got %b", out);
    
    A = 3'b101; B = 3'b001; // Test case 2
    #10;
    if (out !== 4'b0110) $display("Test case 2 failed: expected b0110, got %b", out);
    
    A = 3'b101; B = 3'b110; // Test case 3
    #10;
    if (out !== 4'b0001) $display("Test case 3 failed: expected 0001, got %b", out);
    
    A = 3'b001; B = 3'b010; // Test case 4
    #10;
    if (out !== 4'b0101) $display("Test case 4 failed: expected 0010, got %b", out);
    
    A = 3'b101; B = 3'b101; // Test case 5
    #10;
    if (out !== 4'b0000) $display("Test case 5 failed: expected 0000, got %b", out);
    
    $monitor("A: %b, B: %b, out: %b", A, B, out);
    
    $stop; 
end
endmodule
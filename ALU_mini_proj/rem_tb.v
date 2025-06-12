module rem_DUT;
reg [2:0] A, B;
wire [3:0] out;

rem uut (
    .A(A),
    .B(B),
    .out(out)
);

initial begin
    A = 3'b000; B = 3'b001; // Test case 1
    #10;   
    
    if (out !== 3'b000) $display("Test case 1 failed: expected 000, got %b", out);
    A = 3'b001; B = 3'b001; // Test case 2
    #10;
    if (out !== 3'b000) $display("Test case 2 failed: expected b000, got %b", out);
    A = 3'b101; B = 3'b010; // Test case 3
    #10;
    if (out !== 3'b101) $display("Test case 3 failed: expected b101, got %b", out);
    $monitor("A: %b, B: %b, out: %b", A, B, out);
    $stop; 
end


endmodule
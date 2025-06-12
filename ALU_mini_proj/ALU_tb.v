module ALU_DUT;
reg [2:0] A, B;
reg [1:0] op; 
wire [3:0] out;
wire overflow, sign_flag;
wire zero_flag;

ALU uut (
    .A(A),
    .B(B),
    .op(op),
    .out(out),
    .sign_flag(sign_flag),
    .overflow(overflow),
    .zero_flag(zero_flag)
);

initial begin
    $monitor("A: %b, B: %b, op: %b, out: %b, sign_flag: %b, overflow: %b, zero_flag: %b", 
             A, B, op, out, sign_flag, overflow, zero_flag);
    // Test case 1: Addition
    A = 3'b010; // 2
    B = 3'b001; // 1
    op = 2'b00; // Add
    #10;
    
    // Test case 2: Subtraction
    A = 3'b011; // 3
    B = 3'b001; // 1
    op = 2'b01; // Subtract
    #10;

    // Test case 3: Remainder
    A = 3'b101; // -1
    B = 3'b010; // 2
    op = 2'b10; // Remainder
    #10;

    // Test case 4: Multiplication
    A = 3'b011; // 3
    B = 3'b101; // -1
    op = 2'b11; // Multiply
    #10;
    
    $stop;
end
endmodule
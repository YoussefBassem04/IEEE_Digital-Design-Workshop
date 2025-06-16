module Operator_DUT;
localparam N = 8; 

reg [N-1:0] A, B;   
wire [2*N-1:0] out_Add, out_Mult;
Operator #(.N(N), .TYPE(0)) operator_inst (
    .A(A),
    .B(B),
    .out(out_Add)
);
Operator #(.N(N), .TYPE(1)) operator_inst_mult (
    .A(A),
    .B(B),
    .out(out_Mult)
);
initial begin

    A = 8'd12; // Example input for A
    B = 8'd8; // Example input for B
    #10; // Wait for 10 time units
    $display("Adder Output: %d", out_Add); // Display the output of the adder
    A = 8'd6; // Example input for A
    B = 8'd5; // Example input for B
    #10; // Wait for 10 time units
    $display("Multiplier Output: %d", out_Mult); // Display the output of the multiplier
    $stop; // End the simulation
end
endmodule
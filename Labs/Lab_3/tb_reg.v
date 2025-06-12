module myReg_DUT;

reg [7:0] d;      // 8-bit data input
reg clk;          // Clock input    
reg reset;        // Reset input
wire [7:0] q;       // 8-bit data output
my_register uut (
    .d(d),
    .clk(clk),
    .reset(reset),
    .q(q)
);

localparam T = 20; // Time period for the clock signal
// Generate clock signal

initial clk = 1'b0;
always #(T/2) clk = ~clk;

initial begin
    // Initialize inputs
    d = 8'b0;
    reset = 1'b1; // Start with reset high

    // Wait for a few clock cycles
    #(2*T);
    
    // Release reset
    reset = 1'b0;

    // Apply test vectors
    d = 8'b10101010; // Test data
    #(T);           // Wait for one clock cycle

    d = 8'b11001100; // Another test data
    #(T/4);         
    reset = 1'b1;
    #(T/4); 
    reset = 1'b0; // Release reset again
    d = 8'b11110000; // Another test data
    #(T);           // Wait for one clock cycle
   
    $monitor("Time: %0t, d: %b, clk: %b, reset: %b, q: %b", $time, d, clk, reset, q);
    
    #40; // Wait for some time before stopping the simulation
    $stop;
end

endmodule
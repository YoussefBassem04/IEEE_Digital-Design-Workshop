module lfsr_DUT;
reg clk, rst;
wire [3:0] lfsr_out;    

lfsr uut (
    .clk(clk),
    .rst(rst),
    .lfsr_out(lfsr_out)
);
initial clk = 0;
always #10 clk = ~clk;
initial begin
    rst = 0; // Initialize reset to 0
    #15 rst = 1; // Release reset after 15 time units
    $monitor("LFSR Output: %b", lfsr_out); // Display the LFSR output
    // Run the simulation for a while to observe LFSR output
    repeat(10) @(posedge clk);
    
    

    $stop; // Stop the simulation
end
endmodule
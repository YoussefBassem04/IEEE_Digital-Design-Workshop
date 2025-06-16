module johnson_DUT;
localparam w = 4;

reg clk;
reg rst;
wire [w-1:0] q;
johnson_counter #(w) uut (
    .clk(clk),
    .rst(rst),
    .q(q)
);

localparam CLK_PERIOD = 10;
initial begin
    clk = 0;
    forever #(CLK_PERIOD / 2) clk = ~clk; // Generate clock signal
end

initial begin
    $monitor("Time: %0t, Reset: %b, Counter: %b", $time, rst, q);
    rst = 0; // Start with reset low
    #15; // Wait for some time before asserting reset
    rst = 1; // Release reset
    #100; // Run the simulation for a while
    $stop; // End the simulation
end

endmodule
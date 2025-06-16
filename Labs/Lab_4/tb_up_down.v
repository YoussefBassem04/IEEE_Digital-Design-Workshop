module up_down_counter_DUT;

reg rst, clk, en, up_down;
wire [3:0] count;


up_down_counter uut (
    .rst(rst),
    .clk(clk),
    .en(en),
    .up_down(up_down),
    .count(count)
);

initial clk = 0;
always #10 clk = ~clk;

initial begin
    rst = 0;
    en = 1;
    up_down = 1; // Start with counting up
    #15 rst = 1; // Release reset after 15 time units

    // Test counting up
    repeat(16) @(posedge clk);

    // Change direction to counting down
    up_down = 0;

    // Test counting down
    repeat(16) @(posedge clk);

    $display("Test completed successfully.");
    $stop;
end

endmodule
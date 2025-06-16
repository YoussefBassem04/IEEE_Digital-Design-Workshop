module up_counter_DUT;
reg clk;
reg rst;
reg en;
wire [3:0] q;

up_counter dut1(rst,clk,en,q);

initial begin
    clk = 0;
    forever 
    #5 clk = ~ clk;

end




initial begin
    $monitor("At t = %d\tcount = %d\treset = %d\tEnable = %d\n", $time, q, rst, en);
    rst = 1; en = 0;
    @(negedge clk);
    rst = 0; // Release reset

    // Case 1: Counter should remain at 0 when enable is low
    en = 0;
    @(negedge clk);
    if (q !== 4'b0000) begin
        $display("Test failed: Counter should be 0 when enable is low.");
    end
    // Case 2
    en = 1;
    repeat(15) @(negedge clk);
    // Case 5:
    @(negedge clk);
    rst = 1;
    @(negedge clk);
    rst = 0;
    @(negedge clk);

    // Case 6:
    en = 1;
    repeat(3) @(negedge clk);
$stop;


end

endmodule
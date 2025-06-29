module mealy_ov_DUT;

reg clk, rst, x;
wire out;

mealy_101_overlap uut(clk, rst, x,out);

initial clk = 0;
always #5 clk = ~clk;


initial begin
    $monitor("out=%d ",out);
    rst = 0;
    x = 0;
    #10

    rst = 1;

    repeat(20) begin
        x = $random % 2;
        #10
        if(out == 1) $display("Detected 101");

    end
    #20
    $stop;
end


endmodule
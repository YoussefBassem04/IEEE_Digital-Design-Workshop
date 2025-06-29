module mealy_101_DUT;

reg clk, rst,in;
wire [1:0] y;


mealy_101 uut(
    .clk(clk),
    .rst(rst),
    .in(in),
    .y(y)
);

initial clk = 0;
always #5 clk = ~clk;


initial begin
    $monitor("y = %b", y);
    rst = 0;
    in = 1;
    # 20
    rst = 1;

    repeat (20) begin
      in = $random % 2;
      #10
      if (y == 2'b10) $display("Found Sequence 101 at %t", $time);
    end
    #20;
    $stop;
end
endmodule
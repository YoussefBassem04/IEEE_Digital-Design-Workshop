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
       rst = 0;
    #10
    rst = 1;

    en = 1;
    repeat(100)begin
      @(negedge clk);
        if (q == 4'b1111) begin
        $display("error");
        $stop;
    end
    end
    $stop;
end

initial begin
 

  

    $monitor("Q = %d",q);


end

endmodule
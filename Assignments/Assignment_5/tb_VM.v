module VM_DUT;

reg clk,rst,coin_in,cancel,dispense;
wire item_out;

VM_FSM uut(clk,rst,coin_in,cancel,dispense,item_out);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $monitor("Item out %b", item_out);
    rst = 1;
    coin_in = 0;
    cancel = 0;
    dispense = 0;

    #12
    rst = 0;

    repeat(2) begin
      coin_in = 1;
      @(posedge clk);
      coin_in = 0;
      @(posedge clk);
    end

    dispense = 1;
    @(posedge clk);
    dispense = 0;
    @(posedge clk);

    repeat(3) begin
      coin_in = 1;
      @(posedge clk);
      coin_in = 0;
      @(posedge clk);
    end

    dispense = 1;
    @(posedge clk);
    dispense = 0;
    @(posedge clk);

    #20
    repeat(2) begin
      coin_in = 1;
      @(posedge clk);
      coin_in = 0;
      @(posedge clk);
    end

    cancel = 1;
    @(posedge clk);
    cancel = 0;

    #20
    $stop;

end


endmodule
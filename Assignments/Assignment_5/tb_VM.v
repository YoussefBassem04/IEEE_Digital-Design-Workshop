module vending_fsm_tb;

// Inputs
reg clk;
reg rst;
reg coin_in;
reg cancel;
reg dispense;

// Output
wire item_out;

// DUT instantiation
vending_machine dut (
    .clk(clk),
    .rst(rst),
    .coin_in(coin_in),
    .cancel(cancel),
    .dispense(dispense),
    .item_out(item_out)
);

// Clock generation
initial clk = 0;
always #5 clk = ~clk;  // 10ns period --> 50MHz

integer count = 0;

// Test sequence
initial begin
    $display("Starting Vending FSM testbench...");
    $dumpfile("vending_fsm.vcd");
    $dumpvars(0, vending_fsm_tb);

    // Initialize signals
    rst = 1;
    coin_in = 0;
    cancel = 0;
    dispense = 0;

    #12;  // wait for reset
    rst = 0;

    // Insert 2 coins (one per cycle)
    repeat (2) begin
        coin_in = 1;
        count = count + 1;
        #10;
        coin_in = 0;
        #10;
    end

    // Try dispensing
    dispense = 1;
    #10;
    dispense = 0;
    #10;

    // Insert 3 coins (one per cycle)
    repeat (3) begin
        coin_in = 1;
        count = count + 1;

        #10;
        coin_in = 0;
        #10;
    end

    // Try dispensing
    dispense = 1;
    #10;
    dispense = 0;
    #10;

    // Wait and see item_out
    #20;

    // Insert 2 more coins
    repeat (2) begin
        coin_in = 1;

        count = count + 1;

        #10;
        coin_in = 0;
        #10;
    end

    // Cancel transaction
    cancel = 1;
    #10;
    cancel = 0;

    // Wait and observe
    #20;

    $display("Test completed.");
    $stop;
end

initial begin
  $monitor ("Count = %d\tItem out = %b",count,item_out);
end

endmodule

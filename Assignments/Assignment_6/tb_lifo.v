module lifo_DUT;

reg clk, reset_n, push, pop;
reg [7:0] din;
wire [7:0] dout;
wire full, empty;
lifo #(8, 64) uut (
    .clk(clk),
    .reset_n(reset_n),
    .push(push),
    .pop(pop),
    .din(din),
    .dout(dout),
    .full(full),
    .empty(empty)
);

initial clk = 0;
always #5 clk = ~clk; // Clock period of 10 time units

initial begin
    reset_n = 0; // Start with reset active
    push = 0;
    pop = 0;
    din = 8'h00;

    // Release reset after some time
    #10 reset_n = 1;

    // Test pushing data onto the stack
    #10 push = 1; din = 8'h01; // Push 1
    #10 push = 0;
    
    #10 push = 1; din = 8'h02; // Push 2
    #10 push = 0;

    // Test popping data from the stack
    #10 pop = 1; // Pop should return 2
    #10 pop = 0;

    #10 pop = 1; // Pop should return 1
    #10 pop = 0;

    // Check empty condition
    #20 if (empty) $display("Stack is empty");

    // Test pushing more data
    #10 push = 1; din = 8'h03; // Push 3
    #10 push = 0;

    // Check full condition
    repeat (64) begin
        #10 push = 1; din = $random; // Fill the stack
        if (full) begin
            $display("Stack is full");

        end
        #10 push = 0;
    end

    // End simulation after some time
    #100 $finish;
end

initial begin
    $monitor("Time: %0t, Reset: %b, Push: %b, Pop: %b, Din: %h, Dout: %h, Full: %b, Empty: %b",
             $time, reset_n, push, pop, din, dout, full, empty);
end

endmodule
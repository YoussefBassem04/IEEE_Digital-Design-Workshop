`timescale 1ns/1ps
module d_ff_DUT;


reg d, clk, reset;
wire q, q_bar;
d_ff #(.N(1)) uut (
    .d(d),
    .clk(clk),
    .rst(reset),
    .q(q),
    .q_bar(q_bar)
);


localparam T = 20; // Time period for the clock signal

// Generate clock signal
always begin
    clk = 1'b0;
    #(T/2);
    clk = 1'b1;
    #(T/2);
end

always begin
    // Generate a reset signal
    d = 1'b0;
    #(T/5);
    d = 1'b1;
    #(T/5);
end
initial begin
    d = 1'b0;
    reset = 1'b1;
    #(2*T);
    reset = 1'b0;
    

    $monitor("Time: %0t, d: %b, clk: %b, reset: %b, q: %b, q_bar: %b", $time, d, clk, reset, q, q_bar);
    #40;
    $stop;
end



endmodule
// D Flip-Flop module
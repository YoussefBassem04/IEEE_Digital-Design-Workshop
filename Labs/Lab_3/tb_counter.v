`timescale 1ns / 1ps
module counter_DUT;

    reg [2:0] t;
    reg clk;
    wire [2:0] q;

    decade_counter uut (
        .t(t),
        .clk(clk),
        .q(q)
    );

    localparam T = 20;
    initial clk = 0;
    
    always #(T/2) clk = ~clk;
    // period = 20 ns, frequency = 50 MHz
    // output frequency = 50 MHz / 2^3 = 6.25 MHz
    // output period = 1 / 6.25 MHz = 160 ns

    initial begin
        t = 3'b111; // enable all T flip-flops

        $monitor("Time: %0t | clk: %b | q: %b", $time, clk, q);

        #(20*T);
        $stop;
    end

endmodule

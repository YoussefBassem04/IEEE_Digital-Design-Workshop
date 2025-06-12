module decade_counter(
    input [2:0] t,
    input clk,
    output reg [2:0] q
);
assign q = 3'b000; // Initialize output to 0
    always @(negedge clk) begin
        q[0] <= ~q[0];
    end

    always @(negedge q[0]) begin
        q[1] <= ~q[1];
    end

    always @(negedge q[1]) begin
        q[2] <= ~q[2];
    end

endmodule
// Frequency divider with T flip-flops
// The T flip-flops toggle their state on the negative edge of the clock
// and the output is divided by 2^n where n is the number of T flip-flops.
// The output q is a 3-bit binary number representing the count from 0 to 7.
// The counter will count from 0 to 7 and then reset to 0 on the next clock cycle.
module SIPO_DUT;


reg S_in, clk, rst;
wire [3:0] P_out;


SIPO uut (
    .S_in(S_in),
    .clk(clk),
    .rst(rst),
    .P_out(P_out)
);

initial clk = 0;
always #10 clk = ~clk;

initial begin
    rst = 0;
    S_in = 0; // Initialize S_in to 0
    #15 rst = 1; // Release reset after 15 time units

    // Test shifting in bits
    repeat(4) begin
        @(posedge clk);
        S_in = $random % 2; // Randomly set S_in to 0 or 1
    end

    // Check the output after shifting in 4 bits
    @(posedge clk);
    $display("P_out: %b", P_out); // Display the output

    $stop; // Stop the simulation
end

endmodule
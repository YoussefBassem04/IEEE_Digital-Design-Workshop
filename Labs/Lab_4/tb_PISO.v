module PISO_DUT;

reg [3:0] P_in;
reg clk, rst, load_shift;       
wire S_out;

PISO uut (
    .P_in(P_in),
    .clk(clk),
    .rst(rst),
    .load_shift(load_shift),
    .S_out(S_out)
);
initial clk = 0;
always #10 clk = ~clk;

initial begin
    rst = 0;
    P_in = 4'b0000; // Initialize P_in to 0
    load_shift = 0; // Initialize load_shift to 0
    #15 rst = 1; // Release reset after 15 time units

    // Load the input into the shift register
    load_shift = 1;
    P_in = 4'b1110; // Load a test pattern
    repeat (2)@(posedge clk); //wait for clock edge
    
    // Start shifting out bits
    load_shift = 0;
    
    repeat(4) begin
        @(posedge clk);
        $display("S_out: %b", S_out); // Display the output
    end

    $stop; // Stop the simulation
end


endmodule
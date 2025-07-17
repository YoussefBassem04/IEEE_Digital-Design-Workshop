module fifo_DUT;


parameter DATA_W = 16, DEPTH = 64;

reg clk, reset_n, wr_en,rd_en;
reg [DATA_W - 1: 0] din;
wire  [DATA_W - 1:0] dout;
wire full,empty,almost_full,almost_empty;


fifo #(DATA_W,DEPTH) uut (
    clk, reset_n, wr_en,rd_en,din,dout,full,empty,almost_full,almost_empty
);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    reset_n = 0; wr_en = 0; rd_en = 0; din = 0;
    #10
    reset_n = 1;

    $monitor("Time = %0t, Status: wr_ptr=%d, rd_ptr=%d, full= %b, empty= %b, almost_full = %b, almost_empty = %b, data_count = %d",$time,
    uut.w_ptr, uut.r_ptr, full, empty, almost_full, almost_empty, uut.count);
    // Test writing to FIFO
    #10 din = 16'h5678;
    #10 wr_en = 1; // Write new data
    #10 wr_en = 0; // Disable write
    #10 rd_en = 1; // Read again
    #10 rd_en = 0; // Disable read
    #10 if (dout != 16'h5678) $display("Error: Data mismatch!");

    // Check full and empty flags
    #10 if (full) $display("Error: FIFO should not be full!");
    #20 if (!empty) $display("Error: FIFO should be empty after read!");

    // Fill FIFO to test almost full and almost empty conditions
    repeat (DEPTH) begin
        #10 din = $random; // Random data
        wr_en = 1; // Write data
        #10 wr_en = 0; // Disable write
    end
    // Check almost full condition
    #20 if (!full) $display("Error: FIFO should be full!");
    // Read until almost empty
    repeat (DEPTH-2) begin
        #10 rd_en = 1; // Enable read
        #10 rd_en = 0; // Disable read
    end
    // Check almost empty condition
    #10 if (!almost_empty) $display("Error: FIFO should be almost empty!");

    repeat (2) begin
        #10 rd_en = 1; // Enable read
        #10 rd_en = 0; // Disable read
    end
    #10 if (!empty) $display("Error: FIFO should be empty after all reads!");

    // Final reset
    #10 reset_n = 0; // Assert reset
    #10 reset_n = 1; // Release reset again
    #10 if (!empty) $display("Error: FIFO should be empty after reset!");
    // End simulation
    $stop;
end

endmodule
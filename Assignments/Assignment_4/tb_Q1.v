module shift_reg_DUT;

reg [63:0] load;
reg en;
reg [1:0] amount;
reg clk;
wire [63:0] q;
shift_reg uut (
    .load(load),
    .en(en),
    .clk(clk),
    .amount(amount),
    .q(q)
);

localparam T = 20;

initial begin
    clk = 0;
    forever #(T/2) clk = ~clk; // Clock generation
end


initial begin
    $monitor("Time: %0t, Load: %b, Enable: %b, Amount: %b, Output: %b", 
             $time, load, en, amount, q);
    // Test case 1: Shift left by 1
    load = 64'h0000000000000001; // Initial value
    en = 1; // Enable signal
    amount = 2'b00; // Shift left by 1
    #T;
    
    // Test case 2: Shift LEFT by 8
    load = 64'h0000000000000100; // Initial value
    en = 1; // Enable signal
    amount = 2'b01; // Shift right by 8
    #T;


    // Test case 3: Shift right by 1 with sign extension
    load = 64'h8000000000000001; // Initial value with sign bit set
    en = 1; // Enable signal
    amount = 2'b10; // Shift right by 1 with sign extension
    #T;


    // Test case 4: Shift right by 8 with sign extension
    load = 64'h8000000000000100; // Initial value with sign bit set
    en = 1; // Enable signal
    amount = 2'b11; // Shift right by 8 with sign extension
    #T;


    $stop;
end

endmodule
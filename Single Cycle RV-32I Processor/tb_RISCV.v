module riscv_DUT;

reg clk, rst_n;

RISCV uut (
    clk, rst_n
);


localparam T = 10;
initial clk = 0;
always #(T / 2) clk = ~clk;

initial begin
    rst_n = 0;
    #10
    rst_n = 1;
    #1000
    $stop;
end

initial begin
    $monitor("Time: %0t, PC: %h, Instruction: %h, ALU Result: %h", 
                 $time, uut.PC, uut.Instr, uut.ALUresult);
end



endmodule
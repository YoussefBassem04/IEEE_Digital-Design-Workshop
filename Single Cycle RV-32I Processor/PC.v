module ProgramCounter(
    input             PCsrc,
    input             clk,
    input             areset,
    input             load,
    input [31:0]      ImmExt,
    output reg [31:0] PC
);

reg [31:0] PCNext = 0;

always @(*) begin
    PCNext = PCsrc? (PC + ImmExt) : (PC + 4);
end

always @(posedge clk, negedge areset) begin
    if (!areset)
        PC <= 32'b0;
    else if (load)
        PC <= PCNext;
    else 
        PC <= PC; 
end

endmodule
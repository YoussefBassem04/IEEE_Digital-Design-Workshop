module InstructionMemory #(parameter WIDTH = 32, DEPTH = 64)(
    input [31:0]  PC,
    output reg [31:0] Instr
);

reg [WIDTH - 1:0] InstrMem [0:DEPTH - 1];

initial begin
    $readmemh("program.txt", InstrMem);
end

always @(*) begin
    Instr = InstrMem[PC[31:2]];
end



endmodule
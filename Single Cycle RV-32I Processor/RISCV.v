module RISCV(
    input clk, rst_n
);


wire [31:0] SrcA, SrcB, Instr, ReadData, ALUresult, RD2, PC, ImmExt, Result;
wire [2:0] ALUcontrol;
wire [1:0] ImmSrc;
wire Zero, ALUSrc, sign , load , PCSrc, RegWrite, MemWrite, Resultsrc;

assign SrcB = ALUSrc? ImmExt : RD2; 
assign Result = Resultsrc? ReadData : ALUresult;
assign sign = ALUresult[31];


ProgramCounter pc (
    PCSrc, clk, rst_n, 1'b1, ImmExt, PC
);

InstructionMemory inst_mem (
    PC, Instr
);

RegisterFile reg_file (
    clk ,rst_n,Instr[19:15], Instr[24:20], Instr[11:7], Result, RegWrite,
    SrcA, RD2
);

ALU alu (
    SrcA, SrcB, ALUcontrol, ALUresult, Zero
);


DataMemory data_mem (
    ALUresult, RD2, clk, MemWrite, ReadData
);

ControlUnit CU (
    Instr[6:0] , Instr[14:12], Instr[30], Zero, sign, PCSrc, Resultsrc, 
    MemWrite, ALUcontrol, ALUSrc, ImmSrc, RegWrite
);

sign_extend sign_extender (
    Instr[31:7], ImmSrc, ImmExt
);



endmodule
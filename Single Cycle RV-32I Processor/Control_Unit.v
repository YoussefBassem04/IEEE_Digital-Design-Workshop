module ControlUnit(
    input [6:0] OP,
    input [2:0] funct3,
    input funct7_5,
    input Zero,
    input Sign,
    output reg PCSrc, 
    output ResultSrc, MemWrite,
    output [2:0] ALUControl,
    output ALUSrc,
    output [1:0] ImmSrc,
    output RegWrite
);

wire Branch;
wire [1:0] ALUOp;
wire beq,bnq,blt;


MainDecoder mainDecoder (
    OP, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp
);

ALUDecoder aluDecoder (
    ALUOp,funct3, funct7_5, OP[5], ALUControl
);

assign beq = Zero & Branch;
assign bnq = ~Zero & Branch;
assign blt = Sign & Branch;

always @(*) begin
    case (funct3)
        3'b000: PCSrc = beq;
        3'b001: PCSrc = bnq;
        3'b100: PCSrc = blt;  
        default: PCSrc = 0;
    endcase
end


endmodule
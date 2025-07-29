module MainDecoder(
    input [6:0] Opcode,
    output reg RegWrite,
    output reg [1:0] ImmSrc,
    output reg ALUSrc,
    output reg MemWrite,
    output reg ResultSrc,
    output reg Branch,
    output reg [1:0] ALUOp
);

always @(*) begin
    case (Opcode)
        7'b000_0011: begin RegWrite = 1; ImmSrc = 2'b00; ALUSrc = 1; MemWrite = 0; ResultSrc = 1; Branch = 0; ALUOp = 2'b00    ;end 
        7'b010_0011: begin RegWrite = 0; ImmSrc = 2'b01; ALUSrc = 1; MemWrite = 1; ResultSrc = 1'bx; Branch = 0; ALUOp = 2'b00 ;end
        7'b011_0011: begin RegWrite = 1; ImmSrc = 2'bxx; ALUSrc = 0; MemWrite = 0; ResultSrc = 0; Branch = 0; ALUOp = 2'b10    ;end
        7'b001_0011: begin RegWrite = 1; ImmSrc = 2'b00; ALUSrc = 1; MemWrite = 0; ResultSrc = 0; Branch = 0; ALUOp = 2'b10    ;end
        7'b110_0011: begin RegWrite = 0; ImmSrc = 2'b10; ALUSrc = 0; MemWrite = 0; ResultSrc = 1'bx; Branch = 1; ALUOp = 2'b01 ;end
        default: begin RegWrite = 0; ImmSrc = 2'b00; ALUSrc = 0; MemWrite = 0; ResultSrc = 0; Branch = 0; ALUOp = 2'b00        ;end 
    endcase
end

endmodule
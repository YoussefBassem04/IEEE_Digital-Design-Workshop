module ALU(
    input [31:0] SrcA,      
    input [31:0] SrcB,      
    input [2:0]  ALUControl,
    output reg [31:0]  ALUResult,
    output       Zero
);

assign Zero = ~|ALUResult; // zero flag by nor reduction

always @(*) begin
    case (ALUControl)
        0: ALUResult = SrcA + SrcB;
        1: ALUResult = SrcA << SrcB;
        2: ALUResult = SrcA - SrcB;
        3: ALUResult = 32'b0;
        4: ALUResult = SrcA ^ SrcB;
        5: ALUResult = SrcA >>> SrcB;
        6: ALUResult = SrcA | SrcB;
        7: ALUResult = SrcA & SrcB;
        default: ALUResult = 32'b0;
    endcase
end

endmodule
module ALUDecoder(
    input [1:0] ALUOp,
    input [2:0] funct3,
    input funct7_5, OP_5,
    output reg [2:0] ALUControl 
);

always @(*) begin
    case (ALUOp)
        0: ALUControl = 3'b0;
        1: ALUControl = 3'b010;
        2: begin
            case (funct3)
                0: begin
                    case ({OP_5,funct7_5})
                        0,1,2: ALUControl = 3'b0;
                        3: ALUControl = 3'b010; 
                        default: ALUControl = 0;
                    endcase
                end 
                1: ALUControl = funct3;  
                4: ALUControl = funct3;
                5: ALUControl = funct3;
                6: ALUControl = funct3;
                7: ALUControl = funct3;
                default: ALUControl = 0;
            endcase
        end 
        default: ALUControl = 0;
    endcase
end

endmodule



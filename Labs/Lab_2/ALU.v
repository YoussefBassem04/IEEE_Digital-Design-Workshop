module ALU (input enable, input [3:0]A,B,input [1:0]opcode,output reg [3:0]out,output reg carry_flag);

always @(*) begin
    if (enable) begin
        case (opcode)
            2'b00:
            begin
                {carry_flag,out} = A + B;
            end 
            2'b01:
            begin
                {carry_flag, out} = A - B;
            end
            2'b10:
            begin
                out = A & B;
                carry_flag = 0;
            end
            2'b11:
            begin
                out = A;
                carry_flag = 0;

            end 
            default: 
            begin
                out = 4'b0000;
            end
        endcase
    end
    else
    begin
        out = 4'b0000;
        carry_flag = 0;
    end
end

endmodule
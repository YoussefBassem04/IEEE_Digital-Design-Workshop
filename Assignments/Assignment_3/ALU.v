module ALU(input [3:0]A,B,input cin, input [1:0]opcode,input pass_A,
input pass_B,output reg [3:0] out,output reg cout);

always @(*) begin
    if (pass_A) begin
        out = A;
        cout = 0;
    end
    else if (pass_B) begin
        out = B;
        cout = 0;

    end
    else begin
        case (opcode)
            2'b00:
            begin
                out = A & B;
                cout = 0;
            end 
            2'b01:
            begin
                {cout,out} = A + B + cin;
                
            end
            2'b10:
            begin
                {cout,out} = A - B;
            end
            2'b11:
            begin
                out = ^ B;
                cout = 0;
            end
            default: 
            begin
                out = 4'b0000;
                cout = 0;
            end
        endcase
    end
end

endmodule
module Lab2_ALU (input [3:0] A,B, input enable, input [1:0] opcode,
output reg [3:0] out , output reg cout);

always @ (*)
begin //always
  
if (enable)
begin //if

case (opcode)

2'b00:
begin //2'b00
{cout , out} = A + B;
end //2'b00

2'b01:
begin //2'b01
{cout , out} = A - B;
end //2'b01

2'b10:
begin //2'b10
out = A & B;
cout = 1'b0;
end //2'b10

2'b11:
begin
out = A;
cout = 1'b0;
end

endcase

end //if

else
begin //else
out = 4'b0;
cout = 1'b0;
end //else


end //always

endmodule
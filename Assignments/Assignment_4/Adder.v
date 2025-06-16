module Adder #(parameter N = 8)(input [N-1:0]A,B,output [2*N-1:0] out);


assign out = A + B;
endmodule
module XNOR(input A, B, output C);


assign C = ~(A ^ B);

endmodule
module Q2 (input A, output[1:0] B);


assign B = (A == 1)? 2'd1 : 2'd2;

endmodule
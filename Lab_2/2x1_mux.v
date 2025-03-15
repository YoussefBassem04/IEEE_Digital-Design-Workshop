module mux_2x1(input sel, input [1:0]D,output Y);


assign Y = sel? D[1]:D[0];
endmodule
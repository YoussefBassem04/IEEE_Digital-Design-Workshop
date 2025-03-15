module mux_4x1(input [1:0]S,input [3:0]D,output Y);

wire [1:0]w;



mux_2x1 m1(S[0],D[1:0],w[0]);

mux_2x1 m2(S[0],D[3:2],w[1]);

mux_2x1 m3(S[1],w,Y);

endmodule
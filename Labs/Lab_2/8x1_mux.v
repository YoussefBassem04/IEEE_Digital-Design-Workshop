module mux_8x1(input  [7:0] D,   // Data inputs
    input  [2:0] S,   // Select lines
    output  Y );

wire [1:0]w;

mux_4x1 m1(S[1:0],D[3:0],w[0]);
mux_4x1 m2(S[1:0],D[7:4],w[1]);
mux_2x1 m3(S[2],w,Y);


endmodule
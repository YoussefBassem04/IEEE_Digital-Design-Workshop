module mux_2to1(
    input  [31:0] In1, In2,
    input         Sel,
    output [31:0] Out
);

assign Out = Sel? In2: In1;

endmodule
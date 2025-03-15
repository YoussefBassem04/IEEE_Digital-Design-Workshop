module full_adder(input A,B,cin, output s,c);

assign {c,s} = A + B + cin;

endmodule
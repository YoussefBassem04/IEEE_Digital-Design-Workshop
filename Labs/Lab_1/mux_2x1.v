module mux_2x1(input A,B,sel,output out);



/* Using Gates
wire w[1:0];
assign w[0] = B && sel;
assign w[1] = A && ~sel;

assign out = w[0] || w[1];
*/

assign out = (sel == 0)? A:B;

endmodule
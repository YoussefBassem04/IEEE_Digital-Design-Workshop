module Q3(input[1:0] A,input C, output B );

assign B = (A == 2'b01) ? C :(A == 2'b10) ? ~C : 1'b0;

endmodule
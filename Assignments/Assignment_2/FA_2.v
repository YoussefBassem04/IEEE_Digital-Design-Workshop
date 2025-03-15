module adder_2bit(input [1:0]A,input [1:0]B, 
input cin, output [1:0] sum, output cout);

wire c1;

full_adder fa1(A[0], B[0], cin, sum[0], c1);
full_adder fa2(A[1], B[1], c1, sum[1], cout);
    


endmodule
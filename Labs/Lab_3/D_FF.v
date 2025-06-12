`timescale 1ns/1ps
module d_ff#(parameter N = 3)(input [N-1:0]d, input clk,input rst, output reg [N-1:0]q, output [N-1:0] q_bar);
assign q_bar = ~q;


always @(posedge clk ) begin
    if (rst) begin
        q <= 0;
    end
    else begin
        q <= d;
    end
end

endmodule
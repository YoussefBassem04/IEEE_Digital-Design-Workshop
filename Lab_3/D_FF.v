module d_ff#(parameter N = 3)(input [N-1:0]d, input clk,input rst, output reg [N-1:0]q);


always @(posedge clk ) begin
    if (rst) begin
        q <= 0;
    end
    else begin
        q <= d;
    end
end

endmodule
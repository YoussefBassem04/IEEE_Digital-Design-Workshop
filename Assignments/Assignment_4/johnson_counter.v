module johnson_counter #(parameter w = 4) (input clk, input rst, output reg [w-1:0] q);

always @(posedge clk ,negedge rst) begin
    if (!rst) begin
        q <= 4'b0000; // Reset the counter to 0
    end else begin
        q[0] <= ~ q[w-1];
        q[w-1 : 1] <= q[w-2:0];
    end
end

endmodule
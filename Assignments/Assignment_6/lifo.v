module lifo #(parameter DATA_W = 8,DEPTH = 64)(
    input clk, reset_n,push,pop,
    input [DATA_W - 1: 0] din,
    output reg [DATA_W - 1:0] dout,
    output full,empty
);

reg [$clog2(DEPTH) - 1:0] stack_ptr;
reg [DATA_W - 1:0] stack [0 : DEPTH - 1];

assign full = (stack_ptr == 63);
assign empty = (stack_ptr == 0);

always @(posedge clk,negedge reset_n) begin
    if (!reset_n) begin
        dout <= 0;
        stack_ptr <= 0;
    end
    else if (push && !full) begin
        stack[stack_ptr] <= din;
        stack_ptr <= stack_ptr + 1;
    end
    else if (pop && !empty) begin
        dout <= stack[stack_ptr];
        stack_ptr <= stack_ptr - 1;
    end
end


endmodule
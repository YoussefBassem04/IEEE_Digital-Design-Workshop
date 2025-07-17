module fifo #(parameter DATA_W = 16, DEPTH = 64)(
    input clk, reset_n, wr_en,rd_en,
    input [DATA_W - 1: 0] din,
    output reg [DATA_W - 1:0] dout,
    output full,empty,almost_full,almost_empty
);

reg [$clog2(DEPTH):0] w_ptr,r_ptr;
reg [DATA_W - 1: 0] mem [0 : DEPTH - 1];

assign empty = w_ptr == r_ptr;
assign full = (w_ptr[$clog2(DEPTH)] != r_ptr[$clog2(DEPTH)]) && 
              (w_ptr[$clog2(DEPTH) - 1:0] == r_ptr[$clog2(DEPTH) - 1:0]);

    
integer count;

always @(posedge clk) begin
    if (!reset_n) begin
        dout <= 0;
        count <= 0;
        w_ptr <= 0;
        r_ptr <= 0;
    end
    else if (wr_en && !full) begin
        mem[w_ptr[$clog2(DEPTH) - 1:0]] <= din;
        w_ptr <= w_ptr + 1;
        count <= count + 1;
    end
    else if (rd_en && !empty) begin
        dout <= mem[r_ptr[$clog2(DEPTH) - 1:0]];
        r_ptr <= r_ptr + 1;
        count <= count - 1;
    end
end

assign almost_full = (count >= 62);
assign almost_empty = (count <= 2);


endmodule
module FF(
    input clk,
    input rst_n,
    input D,
    output reg Q,
    output  Qbar
);
parameter FF_TYPE = "DFF";
assign Qbar = ~ Q;

always @(posedge clk ) begin
    if (!rst_n) begin
        Q <= 0;
    end
    else if (FF_TYPE == "DFF") begin
        Q <= D;
    end else if (FF_TYPE == "TFF") begin
        Q <= Q ^ D; 
    end
end

endmodule
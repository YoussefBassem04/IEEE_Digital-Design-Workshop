module DataMemory #(parameter WIDTH = 32, DEPTH = 64)(
    input [WIDTH - 1:0] A,WD,
    input clk,WE,
    output [WIDTH - 1:0] RD
);

reg [WIDTH - 1:0] dataMem [0:DEPTH - 1];

assign RD = dataMem[A];


always @(posedge clk) begin
    if (WE)
        dataMem[A] <= WD;
    else
        dataMem[A] <= dataMem[A];
end

endmodule
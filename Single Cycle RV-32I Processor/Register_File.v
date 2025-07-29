module RegisterFile #(parameter WIDTH = 32, DEPTH = 32)(
    input clk, rst_n,
    input [4:0] A1, A2, A3,
    input [WIDTH - 1:0] WD3,
    input WE3,
    output [WIDTH - 1:0] RD1,RD2
);

reg [WIDTH - 1:0] register [0:DEPTH - 1];

// read asynchronously
assign RD1 = register[A1];
assign RD2 = register[A2];

integer i;
always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        for (i = 0;i < DEPTH;i = i + 1) begin
            register[i] <= {WIDTH{1'b0}};
        end
    end
    else if (WE3)
        register[A3] <= WD3;
        
end

endmodule
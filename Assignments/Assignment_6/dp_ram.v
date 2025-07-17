module dual_port_ram #(parameter ADDR_W = 4, DATA_W = 8, DEPTH = 16)(
    input clk, rst, we_a,we_b,
    input [ADDR_W - 1:0] addr_a, addr_b,
    input [DATA_W - 1:0] din_a,din_b,
    output reg [DATA_W - 1:0] dout_a,dout_b,
    output  collision
);

reg [DATA_W - 1:0] ram [0:DEPTH - 1];
assign collision = (we_a & we_b) & (addr_a == addr_b);

always @(posedge clk, negedge rst) begin
    if (!rst) 
        begin dout_a <= 0;dout_b <= 0; end
    else if (we_a)
        ram[addr_a] <= din_a;
    else if (!we_a)
        dout_a <= ram[addr_a];
    else if (we_b)
        ram[addr_b] <= din_b;
    else
        dout_b <= ram[addr_b];

    
end

endmodule
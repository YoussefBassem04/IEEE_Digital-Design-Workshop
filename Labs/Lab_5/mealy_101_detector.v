module mealy_101(input wire clk, rst, in, output reg [1:0] y);

reg [1:0]ps,ns;
localparam s0 = 2'b00;
localparam s1 = 2'b01; 
localparam s2 = 2'b10;

// state reg
always @(posedge clk, negedge rst) begin
    if(!rst)
        ps <= s0;
    else
        ps <= ns;
end

// next state logic
always @(*) begin
    case (ps)
        s0: ns = (in == 1)? s1 : s0;
        s1: ns = (in == 0)? s2 : s1;
        s2: ns = (in == 1)? s1 : s0; 
        default: ns = s0;
    endcase
    y = ps;
end



endmodule
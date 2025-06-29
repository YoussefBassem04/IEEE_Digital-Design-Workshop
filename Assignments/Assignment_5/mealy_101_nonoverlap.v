module mealy_nonoverlap(input clk, rst, x, output reg y);

localparam s0 = 0, s1 = 1, s2 = 2;

reg [1:0] ps,ns;


always @(posedge clk, negedge rst) begin
    if (!rst) 
        ps <= s0;
    else
        ps <= ns;
end

always @(*) begin
    case (ps)
        s0: ns = (x == 1)? s1 : s0;
        s1: ns = (x == 0)? s2 : s1;
        s2: ns = s0; 
        default: ns = s0;
    endcase
    y = (ps == s2) & x;
end


endmodule
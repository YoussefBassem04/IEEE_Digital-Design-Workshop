module moore_101_nonoverlap(input clk,rst,x, output reg y);

localparam s0 = 0, s1 = 1, s2 = 2, s3 = 3 ;


reg [1:0] ps,ns;

always @(posedge clk, negedge rst) begin
    if (!rst) 
        ps <= s0;
    else
        ps <= ns;
end


always @(*) begin
    case (ps)
        s0: begin  ns = (x == 1)? s1 : s0; y = 0; end
        s1: begin  ns = (x == 0)? s2 : s1; y = 0; end
        s2: begin  ns = (x == 1)? s3 : s0; y = 0; end
        s3: begin  ns = (x == 1)? s1 : s0; y = 1; end
        default: ns = s0;
    endcase
    
end

endmodule
module my_register (
    input [7:0] d,      // 8-bit data input
    input clk,          // Clock input
    input reset,        // Reset input
    output reg [7:0] q       // 8-bit data output
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 8'b0; 
    end
    else begin
        q <= d; 
    end
end

endmodule

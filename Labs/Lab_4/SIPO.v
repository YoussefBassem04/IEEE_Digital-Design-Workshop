module SIPO (input  S_in,clk,rst, output reg [3:0] P_out);



always @(posedge clk) begin
    if (!rst) begin
        P_out = 4'b0000; // Reset output to 0

    end
    else begin
        P_out = {P_out[2:0], S_in}; // Shift in the new bit
    end
end



endmodule
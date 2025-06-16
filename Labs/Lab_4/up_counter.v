module up_counter (input rst, input clk, input en,
output reg [3:0] count);



always @(posedge clk, posedge rst) begin
    if (rst) begin
        count <= 4'b0000;
    end
    else if (en) begin
        count <= count + 1;
    end
    else begin
        count <= count; 
    end
    
end

endmodule
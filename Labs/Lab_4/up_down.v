module up_down_counter (input rst, clk, en, up_down, output reg [3:0] count);

always @(posedge clk) begin
    if(!rst) begin
        count <= 4'b0000; 
    end 
    else if (en && count != 4'b1111 && up_down) begin
        count <= count + 1; // Increment
    end
    else if (en && count != 4'b0000 && !up_down) begin
        count <= count - 1; // Decrement
    end
    else begin
        count <= count; // Hold value
    end
    
end

endmodule
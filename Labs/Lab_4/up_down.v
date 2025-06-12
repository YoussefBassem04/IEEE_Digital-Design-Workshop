module four_bit_counter (input rst, input clk, input en,input cond,
output reg [3:0] count);



always @(posedge clk, negedge rst) begin
    if (!rst) begin
        if (cond) begin
            count <= 4'b1111;
        end
    end
    else if (en) begin
        case (cond)
            1'b0:begin count <= count + 1;end
            1'b1:begin count <= count - 1;end
            default: count <= 4'b0000;
        endcase
    end
    
end

endmodule
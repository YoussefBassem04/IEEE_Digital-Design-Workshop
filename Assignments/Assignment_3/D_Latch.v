module d_latch(input d,en, output reg q);

always @(*) begin
    if (en) begin
        q = d;
    end
    else begin
        q = 0;
    end
end

endmodule
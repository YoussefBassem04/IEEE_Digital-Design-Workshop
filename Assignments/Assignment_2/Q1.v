module cmp_4_bit(input [3:0]A,B,input wire enable,output reg eq,output reg gt,output reg lt);


always @(*) begin
    if (enable) begin
        if (A == B) begin
            eq = 1;
            gt = 0;
            lt = 0;
        end
        else if (A > B) begin
            eq = 0;
            gt = 1;
            lt = 0;
        end
        else if (A < B) begin
            eq = 0;
            gt = 0;
            lt = 1;
        end
        else
        begin
            eq = 0;
            gt = 0;
            lt = 0; 
        end
    end
    else
    begin
        eq = 0;
        gt = 0;
        lt = 0;
    end
end


endmodule
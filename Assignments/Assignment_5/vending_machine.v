module vending_machine(
    input clk,rst,coin_in,cancel,dispense,
    output reg item_out
);

localparam [2:0] IDLE = 3'b0,READY = 3'b001,DISPENSE = 3'b011;

reg [1:0] ps,ns;

reg [2:0] count;

always @(posedge clk,posedge rst) begin
    if (rst) begin
        ps <= IDLE;
        count <= 0;
    end
    else begin
        ps <= ns;
    end
end

always @(posedge clk,posedge rst) begin
    if (ps == IDLE && coin_in)
        count <= count + 1;
    
    if (cancel || ps == DISPENSE)
        count <= 0;
end


always @(*) begin
    case (ps)
        IDLE: ns = (cancel)? IDLE : ((coin_in && count >= 4)? READY :IDLE); 
        READY:begin ns = (dispense)? DISPENSE : READY; if (cancel) ns = IDLE; end
        DISPENSE:ns = IDLE; 
        default: ns = IDLE;
    endcase
end
always @(*) begin
    if (ps == DISPENSE)
        item_out = 1'b1;
    else
        item_out = 1'b0;
end

endmodule
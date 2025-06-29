module VM_FSM(
    input wire clk,rst,coin_in,cancel,dispense, 
    output reg item_out);


localparam IDLE = 0, READY = 1, DISPENSE = 2;

reg [1:0] ps,ns;
integer counter = 0;

always @(posedge clk, posedge rst) begin
    if (rst) begin
        ps <= IDLE;
        counter = 0;
    end
    else begin
        ps <= ns;
        if (cancel || ps == DISPENSE) begin
            counter = 0;
        end
    end
end

always @(coin_in) begin
    if (ps == IDLE) begin
        counter = counter + 1;
    end
end

always @(*) begin
    case (ps)
        IDLE:       ns = (cancel)? IDLE : ((coin_in && counter < 5)? IDLE : READY);
        READY:      ns = (cancel)? IDLE : ((dispense && counter >= 5)? DISPENSE : READY);
        DISPENSE: begin
            if (cancel) begin
                ns = IDLE;
            end
            else if(dispense) begin
                ns = IDLE; 
            end
            else begin
              ns = DISPENSE;
            end
        end
        default: ns = IDLE;
    endcase
end
always @(*) begin
    if(ps == DISPENSE)
        item_out = 1;
    else
        item_out = 0;
end
endmodule
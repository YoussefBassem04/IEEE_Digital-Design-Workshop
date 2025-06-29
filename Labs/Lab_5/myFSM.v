module myFSM(input wire clk, rst, in, output reg [2:0] y);

localparam zero = 3'b000,
           one  = 3'b001,
           two  = 3'b011,
           three= 3'b111;

reg [2:0]cs,ns;

// State memory
always @(posedge clk , posedge rst) begin
    if (rst) begin
        y <= 0;
        cs <= zero;
    end
    else begin
      cs <= ns;
    end
end

// Transition and output logic
always @(*) begin
    case (cs)
        zero: begin
            if (!in) 
                ns = one;
            else
                ns = zero;
        end
        one: begin
            if (in) 
                ns = two;
            else
                ns = one;
        end
        two: begin
            if (in)
                ns = three;
            else
                ns = one;
        end
            
        three: begin
            if (in)
                ns = zero;
            else
                ns = one;
        end
        default: ns = zero;
    endcase
end

always @(*) begin
    case (cs)
        zero: y = zero;
        one: y = one;
        two: y = two;
        three: y = three; 
        default: y = zero;
    endcase
end

endmodule
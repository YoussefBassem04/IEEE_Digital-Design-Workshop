module ALU(input [2:0] A, B, input [1:0] op, output reg [3:0] out,
           output reg sign_flag, overflow, zero_flag);
    
    
    
    wire [3:0] add_out, sub_out, rem_out, mul_out;

    

    add adder(.A(A), .B(B), .out(add_out));
    sub subtractor(.A(A), .B(B), .out(sub_out));
    rem remainder(.A(A), .B(B), .out(rem_out));
    mul multiplier(.A(A), .B(B), .out(mul_out));

    always @(*) begin
        case (op)
            2'b00: out = add_out; // Addition
            2'b01: out = sub_out; // Subtraction
            2'b10: out = rem_out; // Remainder
            2'b11: out = mul_out; // Multiplication
            default: out = 4'b0000; // Default case
        endcase
        zero_flag = (out == 4'b0000); // Check if output is zero
        sign_flag = out[2]; // Sign flag from the output
        overflow = out[3]; // Overflow flag from the output
    end

endmodule
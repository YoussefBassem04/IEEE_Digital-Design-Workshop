module Operator #(parameter N = 8,parameter TYPE = 0)(
    input [N-1:0] A,
    input [N-1:0] B,
    output  [2*N-1:0] out
);

generate
    case (TYPE)
        0: begin
          Adder #(.N(N)) adder_inst (
              .A(A),
              .B(B),
              .out(out)
          );
        end
        1: begin
          Multiplier #(.N(N)) multiplier_inst (
              .A(A),
              .B(B),
              .out(out)
          );
        end
        default: begin
        Adder #(.N(N)) adder_inst (
              .A(A),
              .B(B),
              .out(out)
          );
        end
    endcase
endgenerate

endmodule
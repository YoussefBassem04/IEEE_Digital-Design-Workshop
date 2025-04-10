module ALU_DUT;
reg [3:0] A,B; reg enable; reg [1:0] opcode; wire [3:0] out ; wire cout;

Lab2_ALU alu(A,B,enable,opcode,out, cout);
task validate;
    begin
        case (opcode)
            2'b00: begin 
                if ({cout,out} !== A + B) begin
                    $display("Error A + B failed at time %0t",$time);
                end
            end
            2'b01: begin
                if ({cout,out} !== A - B) begin
                    $display("Error A - B failed at time %0t",$time);
                end
            end
            2'b10: begin
                if (out !== (A & B)) begin
                    $display("Error A & B failed at time %0t",$time);
                end
            end
            2'b11: begin
                if (out !== A) begin
                    $display("Error: Pass A failed at time %0t",$time);
                end
            end 

            
        endcase
    end 
endtask

initial begin
    A = 0; B = 0; opcode = 0; enable = 0;
    #10;
    enable = 1;
    repeat(100)begin
        A=$random;
        B=$random;
        opcode=$random;
        #10;
        validate();
        $display("A\tB\topcode\tcout\tout\n");
        $monitor("%d\t%d\t%d\t%d\t%d\n",A,B,opcode,cout,out);
    end
    enable = 0;
    #10;
        
    $stop;
end



endmodule
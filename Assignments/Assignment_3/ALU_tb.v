module ALU_DUT;
reg [3:0] A,B; reg cin ;reg pass_A; reg pass_B; reg [1:0] opcode; wire [3:0] out ; wire cout;

ALU alu(A,B,cin,opcode,pass_A,pass_B,out, cout);
task validate;
    begin
        if (pass_A) begin
            if (out !== A) begin
                $display("Error: Pass A failed at time %0t",$time);
            end
        end
        else if (pass_B) begin
            if (out !== B) begin
                $display("Error: Pass B failed at time %0t",$time);
            end
        end
        else begin
            case (opcode)
            2'b00: begin 
                if (out !== (A & B)) begin
                    $display("Error A & B failed at time %0t",$time);
                end
                
            end
            2'b01: begin
                if ({cout,out} !== A + B + cin) begin
                    $display("Error A + B failed at time %0t",$time);
                end
                
            end
            2'b10: begin
                if ({cout,out} !== A - B) begin
                    $display("Error A - B failed at time %0t",$time);
                end
            end
            2'b11: begin
                if (out !== ^B) begin
                    $display("Error: XOR reduction B failed at time %0t",$time);
                end
            end 

            
        endcase
        end
        
    end 
endtask

initial begin
    A = 0; B = 0; opcode = 0; pass_A = 0; pass_B = 0;
    #10;
    repeat(100)begin
        A=$random;
        B=$random;
        cin=$random %2;
        opcode=$random;
        pass_A =$random%2;
        pass_B =$random%2;

        #100;
        validate();
        $display("A\tB\tcin\topcode\tpass_A\tpass_B\tcout\tout\n");
        $monitor("%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\n",A,B,cin,opcode,pass_A,pass_B,cout,out);
    end
    #10;
        
    $stop;
end



endmodule
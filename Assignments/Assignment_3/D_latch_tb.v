module d_lat_DUT;
reg d;reg en; wire q;

d_latch d_lat(d,en,q);

task validate(input exp_Q);
    if (q !== exp_Q) begin
        $display("Error at time %t: en=%b, D=%b", $time, en, d);
        $display("  Expected: Q=%b", exp_Q);
        $display("  Got:      Q=%b", q);
                
    end
    
endtask

initial begin
    d =0; en = 0;
    #10
    repeat(100)begin
        en = $random % 2;
        d = $random % 2;
        #100
        if (en) begin
            validate(q);
        end
        else begin
            validate(0);
        end
        $display("D\tEn\tQ\n");
        $monitor("%d\t%d\t%d\n",d,en,q);
    end
    #10;
        
    $stop;

end
endmodule
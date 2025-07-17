module dpRam_DUT;

parameter ADDR_W = 4, DATA_W = 8, DEPTH = 16;

reg clk, rst, we_a,we_b;
reg [ADDR_W - 1:0] addr_a, addr_b;
reg [DATA_W - 1:0] din_a,din_b;
wire [DATA_W - 1:0] dout_a,dout_b;
wire collision;

dual_port_ram #(ADDR_W,DATA_W,DEPTH) uut (
    clk, rst, we_a,we_b,addr_a, addr_b,din_a,din_b,dout_a,dout_b,collision
);

initial clk = 0;
always #5 clk = ~clk;
reg [DATA_W - 1:0] mem [0:DEPTH - 1];

integer i;
initial begin
    rst = 0; we_a = 0; we_b = 0;addr_a = 0; addr_b = 0;din_a = 0;din_b = 0;
    $readmemh("memory_init.txt",mem);
    #10
    rst = 1;
    

    // write in port A,B (no collision)
    for (i = 0;i < DEPTH ;i = i + 2) begin
        #10
        we_a = 1;
        addr_a = i;
        din_a = mem[addr_a];

        we_b = 1;
        addr_b = i + 1;
        din_b = mem[addr_b];
        #10
        we_a = 0; we_b = 0;
        if (uut.ram[i] == mem[i])
            $display("Write SUCCESS (Port A): Addr=%0d, Data=%h", i, mem[i]);
        else
            $display("Write FAILED (Port A): Addr=%0d, Expected=%h, Got=%h", i, mem[i], uut.ram[i]);
        if (uut.ram[i+1] == mem[i+1])
            $display("Write SUCCESS (Port B): Addr=%0d, Data=%h", i+1, mem[i+1]);
        else
            $display("Write FAILED (Port B): Addr=%0d, Expected=%h, Got=%h", i+1, mem[i+1], uut.ram[i+1]);
    end
    // Read back values from both ports
    for (i = 0; i < DEPTH; i = i + 2) begin
        #10;
        addr_a = i;
        addr_b = i+1;
        #10;
        if (dout_a == mem[i])
            $display("Read SUCCESS (Port A): Addr=%0d, Data=%h", i, dout_a);
        else
            $display("Read FAILED (Port A): Addr=%0d, Expected=%h, Got=%h", i, mem[i], dout_a);
        if (dout_b == mem[i+1])
        $display("Read SUCCESS (Port B): Addr=%0d, Data=%h", i+1, dout_b);
        else
        $display("Read FAILED (Port B): Addr=%0d, Expected=%h, Got=%h", i+1, mem[i+1], dout_b);
    end
    #20;

    // test collision
    addr_a = 1;
    addr_b = 1;
    din_a = mem[0];
    din_b = mem[DEPTH - 1];
    we_a = 1;
    we_b = 1;
    #10
    we_a = 0;
    we_b = 0;
    #5
    $display ("dout_a = %h, dout_b = %h, collision = %b",dout_a,dout_b,collision);
    #20
    $stop;
end


initial begin
    $monitor("Time = %0t | addr_a = %d | addr_b = %d | din_a = %h | dout_a = %h | we_a = %b |  din_b = %h | dout_b = %h | we_b = %b | collision = %b", $time, addr_a,addr_b, din_a,dout_a,we_a,din_b,dout_b,we_b,collision);
end

endmodule
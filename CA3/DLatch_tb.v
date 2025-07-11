`timescale 1ns/1ns

module TB_DLatch();
    reg D, clk, rst;
    wire Q, Qb;
    DLatch uut(.D(D), .clk(clk), .rst(rst), .Q(Q), .Qb(Qb));
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    initial begin
        rst = 1;
        D = 0;
        #100;
        rst = 0;
        #100;
        D = 1; #100;
        D = 0; #100;
        D = 1; #100;
        rst = 1; #100;
        rst = 0; #100;
        $stop;
    end
endmodule

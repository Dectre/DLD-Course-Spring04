`timescale 1ns/1ns

module TB_prePost;
    reg clk, rst, J;
    wire Y;
    wire Y_cut;

    s10000001detectorQ DUT (.clk(clk), .rst(rst), .J(J), .Y(Y));
    s10000001detector CUT (.clk(clk), .rst(rst), .J(J), .Y(Y_cut));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        J = 0;
        #20;
        rst = 0;
        #20;

        J = 0; #10;
        J = 1; #10;
        J = 0; #10;
        J = 0; #10;
        J = 1; #10;
        J = 0; #10;
        J = 1; #10;

        J = 1; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 1; #10;

        J = 1; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 1; #10;
        J = 0; #10;

        J = 0; #10;
        J = 1; #10;
        J = 1; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;

        J = 1; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 1; #10;

        #50;
        $stop;
    end

endmodule

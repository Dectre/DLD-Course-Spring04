`timescale 1ns/1ns
module DFlipFlop(input D, clk, rst, output Q, Qb);
    wire clk_n, qm, qmb;
    not #(6) not_clk(clk_n, clk);
    DLatch master(.D(D), .clk(clk_n), .rst(rst), .Q(qm), .Qb(qmb));
    DLatch slave (.D(qm), .clk(clk), .rst(rst), .Q(Q), .Qb(Qb));
endmodule

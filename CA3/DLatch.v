`timescale 1ns/1ns
module DLatch(input D, clk, rst, output wire Q, Qb);
wire Db, i, j, Q1, Q2, rst_bar;
not #(6) not1(Db, D), not2 (rst_bar, rst), not3(Q, Q2);
nand #(8) n1(i, D, clk), n2(j, Db, clk), n3(Q1, i, Qb), n4(Qb, j, Q1), n5(Q2, Q1, rst_bar);
endmodule
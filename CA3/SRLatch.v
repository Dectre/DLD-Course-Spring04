`timescale 1ns/1ns
module SRLatch(input S, R, clk, output wire Q, Qb);
wire S1, R1;
nand #(8) n1(S1, S, clk), n2(R1, R, clk), n3(Q, S1, Qb), n4(Qb, R1, Q);
endmodule
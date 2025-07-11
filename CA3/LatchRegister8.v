`timescale 1ns/1ns
module LatchRegister_8 (input [7:0] D,input clk,input rst,output wire [7:0] Q);
    wire [7:0] Qb;
    DLatch d0(.D(D[0]), .clk(clk), .rst(rst), .Q(Q[0]), .Qb(Qb[0]));
    DLatch d1(.D(D[1]), .clk(clk), .rst(rst), .Q(Q[1]), .Qb(Qb[1]));
    DLatch d2(.D(D[2]), .clk(clk), .rst(rst), .Q(Q[2]), .Qb(Qb[2]));
    DLatch d3(.D(D[3]), .clk(clk), .rst(rst), .Q(Q[3]), .Qb(Qb[3]));
    DLatch d4(.D(D[4]), .clk(clk), .rst(rst), .Q(Q[4]), .Qb(Qb[4]));
    DLatch d5(.D(D[5]), .clk(clk), .rst(rst), .Q(Q[5]), .Qb(Qb[5]));
    DLatch d6(.D(D[6]), .clk(clk), .rst(rst), .Q(Q[6]), .Qb(Qb[6]));
    DLatch d7(.D(D[7]), .clk(clk), .rst(rst), .Q(Q[7]), .Qb(Qb[7]));
endmodule

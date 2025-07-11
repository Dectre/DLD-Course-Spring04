`timescale 1ns/1ns
module myOAI_norGate(input a, b, c, output w);
wire i, j, k;
myNor_switch n1(a, b, i), n2(c, c, j), n3(i,j,k), n4(k, k, w);
endmodule
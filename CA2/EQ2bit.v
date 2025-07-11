`timescale 1ns/1ns
module EQ2bit(input[1: 0] A, B , output EQ);
assign #49 EQ = (~A[1] | B[1]) & (A[1] | ~B[1]) & (~A[0] | B[0]) & (A[0] | ~B[0]);
endmodule
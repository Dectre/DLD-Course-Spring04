`timescale 1ns/1ns
module GT2bit(input[1: 0] A, B , output GT);
assign #37 GT = (A[1] & ~B[1]) | (A[0] & ~B[1] & ~B[0]) | (A[0] & A[1] & ~B[0]);
endmodule
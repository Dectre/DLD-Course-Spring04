`timescale 1ns/1ns
module Comparator2bit(input  [1:0] A, B, output GT, EQ);
    GT2bit gt(.A(A), .B(B), .GT(GT));
    EQ2bit eq(.A(A), .B(B), .EQ(EQ));
endmodule

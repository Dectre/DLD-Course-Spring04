`timescale 1ns/1ns
module Comparator4bit (input  [3:0] A, B, output GT, EQ);
   wire GT1, EQ1, GT0, EQ0;
   Comparator2bit hi (.A(A[3:2]), .B(B[3:2]), .GT(GT1), .EQ(EQ1));
   Comparator2bit lo (.A(A[1:0]), .B(B[1:0]), .GT(GT0), .EQ(EQ0));
   GEcascade ge(.GT1(GT1), .EQ1(EQ1), .GT0(GT0), .EQ0(EQ0), .GT(GT), .EQ(EQ));
endmodule
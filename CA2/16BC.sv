`timescale 1ns/1ns
module Comparator8bit(input[7:0] A, B, output GT, EQ);
   wire GT1, EQ1, GT0, EQ0;
   Comparator4bit hi (.A(A[7:4]), .B(B[7:4]), .GT(GT1), .EQ(EQ1));
   Comparator4bit lo (.A(A[3:0]), .B(B[3:0]), .GT(GT0), .EQ(EQ0));
   GEcascade ge(.GT1(GT1), .EQ1(EQ1), .GT0(GT0), .EQ0(EQ0), .GT(GT), .EQ(EQ));
endmodule

module Comparator16bit(input[15:0] A, B, output GT, EQ);
   wire GT1, EQ1, GT0, EQ0;
   Comparator8bit hi (.A(A[15:8]), .B(B[15:8]), .GT(GT1), .EQ(EQ1));
   Comparator8bit lo (.A(A[7:0]), .B(B[7:0]), .GT(GT0), .EQ(EQ0));
   GEcascade ge(.GT1(GT1), .EQ1(EQ1), .GT0(GT0), .EQ0(EQ0), .GT(GT), .EQ(EQ));
endmodule
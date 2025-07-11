`timescale 1ns/1ns
module Comparator2bit_tb();
  logic [1:0] A, B;
  logic GT, EQ;

  Comparator2bit uut(.A(A), .B(B), .GT(GT), .EQ(EQ));

  initial begin
    repeat (20) begin
      A = $random() % 4;
      B = $random() % 4;
      #103;
    end
    $stop;
  end
endmodule

`timescale 1ns/1ns
module Comparator16bit_tb;
  logic [15:0] A, B;
  logic GT, EQ;
  Comparator16bit uut(.A(A), .B(B), .GT(GT), .EQ(EQ));
  initial begin
    repeat (10) begin
      A = $random() % (2**16);
      B = $random() % (2**16);
      #439;
    end
    $stop;
  end
endmodule

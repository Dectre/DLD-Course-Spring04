`timescale 1ns/1ns
module ComparatorNbit_tb();
  parameter N = 16; 
  logic [N-1:0] A, B;
  logic GT, EQ;
  ComparatorNbit #(N) uut(.A(A), .B(B), .GT(GT), .EQ(EQ));
  initial begin
    repeat (10) begin
      A = $random() % (2**N);
      B = $random() % (2**N);
      #2000;
    end
    $stop;
  end
endmodule


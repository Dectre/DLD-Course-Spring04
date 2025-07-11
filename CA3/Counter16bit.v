module Counter16bit (input clk, input rst, input [15:0] B, input [1:0] m, input Ci, output [15:0] Q, output Co);
    wire [7:0] Qhi, Qlo;
    wire CoLo;
    Counter8bit_4m_2 low (.clk(clk), .rst(rst), .B(B[7:0]), .m(m), .Ci(Ci), .Co(CoLo), .Q(Qlo));
    Counter8bit_4m_2 high (.clk(clk), .rst(rst), .B(B[15:8]), .m(m), .Ci(CoLo), .Co(Co), .Q(Qhi));
    assign Q = {Qhi, Qlo};
endmodule

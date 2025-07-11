module Counter8bit_4m_1 (input clk, input rst, input [7:0] B, input [1:0] m, input Ci, output [7:0] Q, output Co);
    wire [7:0] A;
    wire [7:0] W;
    wire [7:0] Qb;
    assign A = Q;
    logicBlock logic (.A(A), .B(B), .m(m), .Ci(Ci), .W(W), .Co(Co));
    LatchRegister_8 reg8 (.D(W), .clk(clk), .rst(rst), .Q(Q));
endmodule

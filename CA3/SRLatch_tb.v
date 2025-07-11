`timescale 1ns/1ns
module TB_SRLatch();
reg S, R, clk;
wire Q, Qb;
SRLatch uut(.S(S), .R(R), .clk(clk), .Q(Q), .Qb(Qb));
initial begin
    clk = 0;
    forever #20 clk = ~clk;
end
initial begin
    S = 1; R = 0; #50;
    S = 0; R = 1; #50;
    S = 1; R = 0; #50;
    S = 0; R = 0; #50;
    S = 1; R = 1; #50;
    S = 0; R = 0; #50;
    S = 1; R = 0; #50;
    S = 0; R = 1; #50;
    S = 0; R = 0; #50;
    $stop;
end
endmodule 
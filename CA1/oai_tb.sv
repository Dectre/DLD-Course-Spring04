`timescale 1ns/1ns
module TB_1();
reg a1 = 1, b1 = 0, a2 = 0, b2 = 1, c2 = 1;
wire w1, w2;
myNor_switch NOR(a1, b1, w1);
myOAI_switch OAI(a2, b2, c2, w2);
initial begin
#91 a1 = 0; b1 = 1; a2 = 1; b2 = 0; c2 = 0;
#91 a1 = 0; b1 = 0; a2 = 1; b2 = 1; c2 = 0;
#91 a1 = 1; b1 = 0; a2 = 1; b2 = 1; c2 = 1;
#91 a1 = 0; b1 = 0; a2 = 0; b2 = 0; c2 = 1;
#91 a2 = 1; b2 = 0; c2 = 1;
#103 $stop;
end
endmodule

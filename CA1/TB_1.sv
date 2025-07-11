`timescale 1ns/1ns
module TB_1 ();
  reg a1=0,b1=0,c1=0,a2=1,b2=1;
  wire w1, w2;
  myOAI_switch cut1(a1,b1,c1,w1);
  myNor_switch cut2(a2,b2,w2);
  initial begin
    #47
    a1=1; b1=0; c1=0;  a2=0; b2=1;
    #47
    a1=1; b1=1; c1=0;  b2=0; a2=0;
    #47
    a1=1; b1=1; c1=1;  a2=1; b2=0;
    #47
    a1=0; b1=0; c1=1;  b2=0; a2=0;
    #47
    a1=1; b1=0; c1=1;
    #91
    $stop;
  end
endmodule

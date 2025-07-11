`timescale 1ns/1ns
module TB_2();
reg aa = 0, bb = 1, cc = 1;
wire ww;
myOAI_norGate cut(aa, bb, cc, ww);
initial begin
    #91 aa = 1; bb = 0; cc = 0;
    #91 aa = 1; bb = 1; cc = 0;
    #91 aa = 1; bb = 1; cc = 1;
    #91 aa = 0; bb = 0; cc = 1;
    #91 aa = 1; bb = 0; cc = 1;
    #103 $stop;
end
endmodule


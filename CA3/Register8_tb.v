`timescale 1ns/1ns
module TB_Reg8FF();
    reg [7:0] D;
    reg clk, rst;
    wire [7:0] Q;
    Reg8FlipFlop uut(.D(D), .clk(clk), .rst(rst), .Q(Q));
    initial begin
        clk = 0;
        forever #80 clk = ~clk;
    end
    initial begin
        rst = 1; D = 8'b00000000; #100;
        rst = 0; #100;
        D = 8'b10101010; #100;
        D = 8'b01010101; #100;
        D = 8'b11110000; #100;
        rst = 1; #100;
        rst = 0; #100;
        D = 8'b00001111; #100;
        $stop;
    end
endmodule
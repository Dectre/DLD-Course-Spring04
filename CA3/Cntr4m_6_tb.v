`timescale 1ns/1ns
module TB_Counter8bit_4m_1();
    reg clk, rst;
    reg [1:0] m;
    reg Ci;
    wire Co;
    reg [7:0] B;
    wire [7:0] Q;

    Counter8bit_4m_1 uut(.clk(clk), .rst(rst), .B(B), .m(m), .Ci(Ci), .Co(Co), .Q(Q));

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        rst = 1; B = 8'b0010111; m = 2'b11; Ci = 0; #100;
        rst = 0; #100;
        m = 2'b01; Ci = 1; #100;
        m = 2'b01; Ci = 0; #100;
        m = 2'b10; Ci = 0; #100;
        m = 2'b10; Ci = 1; #100;
        m = 2'b00; #100;
        m = 2'b11; B = 8'b10110001; #100;
        $stop;
    end
endmodule

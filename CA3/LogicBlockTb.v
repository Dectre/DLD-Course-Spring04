`timescale 1ns/1ns
module logicBlockTb();
    reg [7:0] A,B;
    reg [1:0] m;
    reg Ci;
    wire [7:0] W1,W2;
    wire Co1,Co2;

    logicBlock uut1(.A(A),.B(B),.W(W1),.Ci(Ci),.Co(Co1),.m(m));
    logicBlock_s uut2(.A(A),.B(B),.W(W2),.Ci(Ci),.Co(Co2),.m(m));

    initial begin
        Ci=0;A=0;B=0;m=0;
        repeat(10) begin
            A = $random % (2**8);
            B = $random % (2**8);
            Ci = $random % 2;
            m = $random % 4;
            #50;
        end
        $stop;
    end
endmodule

`timescale 1ns/1ns
module TB_s10000001detector;
    reg clk, rst, J;
    wire Y;
    s10000001detectorQ DUT(.clk(clk), .rst(rst), .J(J), .Y(Y));

    initial clk = 0;
    always #5 clk = ~clk;

    task send_bit;
        input reg b;
        begin
            J = b;
            #10;
        end
    endtask

    task send_sequence;
        input [7:0] seq;
        integer i;
        begin
            for (i = 7; i >= 0; i = i - 1)
                send_bit(seq[i]);
        end
    endtask

    initial begin
        rst = 1; J = 0;
        #20 rst = 0;
        #20

        repeat (5) send_bit(0);
        send_sequence(8'b10000001);
        repeat (3) send_bit(1);

        send_sequence(8'b110000001);
        repeat (2) send_bit(0);

        send_sequence(8'b10000001);
        repeat (5) send_bit(1);

        $stop;
    end
endmodule

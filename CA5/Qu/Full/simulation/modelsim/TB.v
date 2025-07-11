`timescale 1ns/1ns
module tb_SerCommunication;

    reg clk, rst, RcIn;
    wire txOut, txValid, txAbort;

    SerCommunication dut (
        .clk(clk),
        .rst(rst),
        .RcIn(RcIn),
        .txOut(txOut),
        .txValid(txValid),
        .txAbort(txAbort)
    );

    always #5 clk = ~clk;

    task send_bit;
        input reg b;
        begin
            RcIn = b;
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

    integer i;
    initial begin
        clk = 0;
        RcIn = 0;
        rst = 1;
        #12 rst = 0;
        repeat (10) send_bit(0);

        send_sequence(8'b01111110);

        for (i = 0; i < 97; i = i + 1)
            send_bit($random % 2);

        repeat (20) send_bit(0);

        send_sequence(8'b01111110);

        for (i = 0; i < 40; i = i + 1)
            send_bit($random % 2);

        send_sequence(8'b10000001);

        repeat (20) send_bit(0);
        $stop;
    end

endmodule

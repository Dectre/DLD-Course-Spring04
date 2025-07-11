`timescale 1ns/1ns
module TB_Transmitter;
    reg clk, rst, RcIn, start, abort;
    wire txOut, txValid, txAbort, startSeen;

    Transmitter DUT (
        .clk(clk),
        .rst(rst),
        .RcIn(RcIn),
        .start(start),
        .abort(abort),
        .txOut(txOut),
        .txValid(txValid),
        .txAbort(txAbort),
        .startSeen(startSeen)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst   = 1;
        RcIn  = 0;
        start = 0;
        abort = 0;
        #20 rst = 0;

        start = 1; #10 start = 0;
        repeat (97) begin
            RcIn = $random;
            #10;
        end
        #20;

        start = 1; #10 start = 0;
        repeat (30) begin
            RcIn = $random;
            #10;
        end
        abort = 1; #10 abort = 0;
        repeat (20) #10;

        $stop;
    end
endmodule

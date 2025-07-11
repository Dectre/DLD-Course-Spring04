`timescale 1ns/1ns
module SerCommunication(input wire clk, rst, RcIn, output wire txOut, txValid, txAbort);
    wire startSeen, detectorOut;
    wire start = detectorOut && ~startSeen, abort = detectorOut && startSeen;
    wire selectedRcIn = startSeen ? RcIn : ~RcIn;
    Transmitter transmitter(.clk(clk), .rst(rst), .RcIn(RcIn), 
    .start(start), .abort(abort), .startSeen(startSeen), 
    .txOut(txOut), .txAbort(txAbort), .txValid(txValid));
    s10000001detector seqDetector(.clk(clk), .rst(rst), 
    .J(selectedRcIn), .Y(detectorOut));
endmodule
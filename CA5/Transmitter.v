`timescale 1ns/1ns
module Transmitter(input wire clk, rst, RcIn, start, abort, output reg txOut, txValid, txAbort, startSeen);
    parameter[1:0] Idle = 0, Count97 = 1, Done = 2;
    reg [1:0] PS, NS;
    reg [6:0] init_val = 7'b0011111;
    wire [6:0] cnt_val;
    reg izc;
    wire ld;
    wire co;
    assign ld = izc || co;
    Counter_8 cntr(.PI(init_val), .clk(clk), .rst(rst), .ci(1'b1), .cen(startSeen), .iz(ld), .PO(cnt_val), .co(co));
    always @(PS, NS, start, abort, co, RcIn) begin
        NS = Idle;
        {izc, txOut, txValid, txAbort, startSeen} = 5'b0;
        case (PS)
            Idle: begin 
                NS = start ? Count97 : Idle; 
                izc = 1'b1; 
                txOut = 1'b1;
            end
            Count97: begin
                if (co) begin
                    NS = Done;
                end
                else if (abort) begin 
                    NS = Idle; 
                    txAbort = 1'b1; 
                end 
                else begin
                    NS = Count97;
                    txOut = RcIn;
                    txValid = 1'b1;
                end
                startSeen = 1'b1;
            end
            Done: NS = Idle;
            default: NS = Idle;
        endcase
    end

    always @(posedge clk, posedge rst) begin
        if (rst) PS <= Idle;
        else PS <= NS;
    end
endmodule

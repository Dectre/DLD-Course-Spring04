`timescale 1ns/1ns
module Reg8Always(input [7:0] D, input clk, input rst, output reg [7:0] Q);
reg [7:0] temp;
    always @(posedge clk, posedge rst) begin
        if (rst) temp = 8'b0;
        else 
            temp = D;
        Q <= #78 temp;
    end
endmodule
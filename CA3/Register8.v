module Reg8FlipFlop(input [7:0] D, input clk, input rst, output [7:0] Q);
    wire [7:0] Qb;
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            DFlipFlop dff(.D(D[i]), .clk(clk), .rst(rst), .Q(Q[i]), .Qb(Qb[i]));
        end
    endgenerate
endmodule

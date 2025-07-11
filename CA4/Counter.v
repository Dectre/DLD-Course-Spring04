`timescale 1ns/1ns
module Counter_3(input wire [2:0] PI, input wire clk, rst, ci, cen, iz, output reg [2:0] PO, output wire co);
    assign lden = iz || co;
    always @(posedge clk, posedge rst) begin
        if (rst) PO <= 3'd0;
        else if (lden) PO <= PI;
        else if (cen) PO <= PO + ci;
    end
    assign co = &PO;
endmodule
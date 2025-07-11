`timescale 1ns/1ns
module s10000001detector(input wire clk, rst, J, output wire Y);
    parameter[2:0] Idle = 0, Seen1 = 1, Count = 2, Done = 3;
    reg [2:0] PS, NS;
    reg detected1, iz_cntr;
    wire done_cnt;
    reg [2:0] init_val = 3'b010;
    wire [2:0] cnt_val; 
    Counter_3 cntr(.PI(init_val), .clk(clk), .rst(rst), .ci(~J), .cen(detected1), .iz(iz_cntr), .PO(cnt_val), .co(done_cnt));
    always @(PS, NS, J, done_cnt) begin
        NS = Idle;
        {detected1, iz_cntr} = 2'b00;
        case (PS)
            Idle: begin NS = J ? Seen1 : Idle; end
            Seen1: begin NS = J ? Seen1 : Count; iz_cntr = 1'b1; end
            Count: begin
                detected1 = 1'b1;
                if (done_cnt && J) NS = Done; 
                else if (J) NS = Seen1; 
                else NS = Count;
            end
            Done: NS = J ? Seen1 : Count;
            default: NS = Idle;
        endcase
    end
    always @(posedge clk, posedge rst) begin
        if (rst) PS <= Idle;
        else PS <= NS;
    end
    assign Y = (PS == Done) ? 1'b1 : 1'b0;
endmodule

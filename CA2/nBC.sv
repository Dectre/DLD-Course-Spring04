`timescale 1ns/1ns
module ComparatorNbit #(parameter N = 16) (input [N-1:0] A, B, output GT, EQ);
    logic [N/2-1:0] gt, eq;
    assign gt[0] = 0;
    assign eq[0] = 1;
    genvar i;
    generate
        for (i = 0; i < N/2; i++) begin
            logic gti, eqi;
            Comparator2bit c2 (.A(A[N - 2*i - 1 -: 2]), .B(B[N - 2*i - 1 -: 2]), .GT(gti), .EQ(eqi));
            GEcascade ge (.GT1(gt[i]), .EQ1(eq[i]), .GT0(gti), .EQ0(eqi), .GT(gt[i+1]), .EQ(eq[i+1]));
        end
    endgenerate
    assign GT = gt[N/2-1];
    assign EQ = eq[N/2-1];
endmodule


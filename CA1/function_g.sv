`timescale 1ns/1ns
module myNOT(input a, output b);
supply1 vdd;
supply0 gnd;
pmos #(5, 6, 7) T1(b, vdd, a);
nmos #(3, 4, 5) T2(b, gnd, a);
endmodule

module function_g(input[1:0] A, input[1:0] B, output g);
wire i, j, a0, a1, b0, b1;
myNOT N1(.a(A[0]), .b(a0));
myNOT N2(.a(B[0]), .b(b0));
myNOT N3(.a(B[1]), .b(b1));
myOAI_boolalg OAI1(.a(A[1]), .b(b1), .c(b0), .w(i));
myOAI_boolalg OA2(.a(A[1]), .b(A[1]), .c(b1), .w(j));
myOAI_boolalg OA3(.a(a0), .b(i), .c(j), .w(g)); 
endmodule
`timescale 1ns/1ns
module myNor_switch(input a, b, output w);
supply1 vdd;
supply0 gnd;
wire j;
pmos #(5, 6, 7) T1(j, vdd, a), T2(w, j, b);
nmos #(3, 4, 5) T3(w, gnd, a), T4(w, gnd, b);  
endmodule
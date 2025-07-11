`timescale 1ns/1ns
module GEcascade(input GT1, GT0, EQ1, EQ0, output logic GT, EQ);
    assign #56 GT = (EQ1 & GT0) | GT1;
    assign #28 EQ = EQ1 & EQ0;
endmodule
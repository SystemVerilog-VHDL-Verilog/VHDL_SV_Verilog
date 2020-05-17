// 4.33(a): unsigned multiplier
module multiplier_sv
(
input logic [3:0] a, b,
output logic [7:0] y
);

assign y = a *b;
endmodule

// 5.4(): unsigned multiplier
//module multiplier #(parameter N = 8)
//(input logic [N–1:0] a, b,
//output logic [2*N–1:0] y);
//assign y = a * b;
//endmodule
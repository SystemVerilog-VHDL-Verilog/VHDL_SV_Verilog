module mux2_8_v 
(
input [7:0] d0, d1,
input s,
output [7:0] y
);

mux2_v lsbmux (d0[3:0], d1[3:0], s, y[3:0]);
mux2_v msbmux (d0[7:4], d1[7:4], s, y[7:4]);

endmodule
module mux4_12_v 
(
input [11:0] d0,
input [11:0] d1,
input [11:0] d2,
input [11:0] d3, 
input [1:0] s,
output [11:0] y
);

wire [11:0] low, hi;

mux2_v #(12) lowmux(d0, d1, s[0], low);
mux2_v #(12) himux(d2, d3, s[0], hi);
mux2_v #(12) outmux(low, hi, s[1], y);

endmodule
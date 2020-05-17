module mux4_8_v 
(
input [7:0] d0,
input [7:0] d1, 
input [7:0] d2,
input [7:0] d3,
input [1:0] s,
output [7:0] y
);

wire [7:0] low, hi;

mux2_v lowmux (d0, d1, s[0], low);
mux2_v himux (d2, d3, s[0], hi);
mux2_v outmux (low, hi, s[1], y);


endmodule
module mux4_v
(
input [3:0] d0, d1, d2, d3,
input [1:0] s,
output [3:0] y
);

wire [3:0] low, high;

mux2_v lowmux (d0, d1, s[0], low);
mux2_v highmux (d2, d3, s[0], high);
mux2_v finalmux (low, high, s[1], y);

endmodule
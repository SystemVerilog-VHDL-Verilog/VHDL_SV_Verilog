module mux4_8_sv
(
input logic [7:0] d0,
input logic [7:0] d1,
input logic [7:0] d2,
input logic [7:0] d3,
input logic [1:0] s,
output logic [7:0] y
);

logic [7:0] low, hi;

mux2_sv lowmux(d0, d1, s[0], low);
mux2_sv himux(d2, d3, s[0], hi);
mux2_sv outmux(low, hi, s[1], y);

endmodule
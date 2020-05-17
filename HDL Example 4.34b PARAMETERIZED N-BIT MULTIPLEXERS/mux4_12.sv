module mux4_12_sv
(
input logic [11:0] d0,
input logic [11:0] d1,
input logic [11:0] d2,
input logic [11:0] d3,
input logic [1:0]s,
output logic [11:0] y
);

logic [11:0] low, hi;

mux2_sv #(12) lowmux(d0, d1, s[0], low);
mux2_sv #(12) himux(d2, d3, s[0], hi);
mux2_sv #(12) outmux(low, hi, s[1], y);

endmodule
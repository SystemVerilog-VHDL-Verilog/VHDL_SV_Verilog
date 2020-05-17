module mux2_sv
(
input logic [3:0] d0, d1,
input logic s,
output tri [3:0] y
);
tristate_sv t0(d0, ~s, y);
tristate_sv t1(d1, s, y);
endmodule
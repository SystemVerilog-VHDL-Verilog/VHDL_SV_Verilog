module mux2_v 
(
input [3:0] d0, d1,
input s,
output [3:0] y
);

tristate_v t0 (d0, ~s, y);
tristate_v t1 (d1, s, y);
endmodule
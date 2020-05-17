module latch_sv
(
input logic clk,
input logic [3:0] d,
output logic [3:0] q
);

always_latch // it is similar to always @(clk, d)
if (clk) q <= d;
endmodule
// 4.33(b): signed multiplier
module multiplier_sv
(
input logic signed [3:0] a,
input logic signed [3:0] b,
output logic signed [7:0] y
);
assign y = a *b;
endmodule
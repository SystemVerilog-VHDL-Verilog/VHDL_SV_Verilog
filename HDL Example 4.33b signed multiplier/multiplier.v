// 4.33(b): signed multiplier
module multiplier_v
(
input signed [3:0] a,
input signed [3:0] b,
output signed [7:0] y
);

assign y = a *b;
endmodule
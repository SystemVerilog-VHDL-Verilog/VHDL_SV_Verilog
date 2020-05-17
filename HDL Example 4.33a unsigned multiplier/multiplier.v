// 4.33(a): unsigned multiplier
module multiplier_v
(
input [3:0] a, b,
output [7:0] y
);
assign y = a *b;
endmodule

//HDL Example 5.4 MULTIPLIER
//module multiplier # (parameter N  8)
//(input [N-1:0] a, b,
//output [2*N-1:0] y);
//assign y  a * b;
//endmodule
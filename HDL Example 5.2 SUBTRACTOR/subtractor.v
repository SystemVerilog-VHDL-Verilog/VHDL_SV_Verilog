module subtractor 
#(parameter N = 8)
(
input [N–1:0] a, b,
output [N–1:0] y
);
assign y = a − b;
endmodule
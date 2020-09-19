module adder 
#(parameter N  8)
(
input [N-1:0] a, b,
input cin,
output [N-1:0] s,
output cout
);
	assign {cout, s} = a + b + cin;
endmodule
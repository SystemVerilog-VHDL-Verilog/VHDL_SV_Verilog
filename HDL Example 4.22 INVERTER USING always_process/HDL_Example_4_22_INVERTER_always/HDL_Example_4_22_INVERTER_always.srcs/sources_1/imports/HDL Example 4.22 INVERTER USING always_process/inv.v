module inv_v 
(
input [3:0] a,
output reg [3:0] y
);

	always @ (*)
		y = ~a;

endmodule
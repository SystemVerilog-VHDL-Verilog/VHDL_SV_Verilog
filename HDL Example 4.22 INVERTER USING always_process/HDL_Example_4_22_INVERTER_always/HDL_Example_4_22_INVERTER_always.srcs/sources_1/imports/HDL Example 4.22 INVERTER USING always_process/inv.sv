module inv_sv
(
input logic [3:0] a,
output logic[3:0] y
);

	always_comb
		y = ~a;

endmodule
module sync_sv
(
input logic clk,
input logic d,
output logic q
);

logic n1;

always_ff @(posedge clk)
begin
	n1 <= d; // nonblocking
	q  <= n1; // nonblocking
end
endmodule
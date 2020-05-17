// Bad implementation using blocking assignments
module syncbad_v 
(
input clk,
input d,
output reg q
);

reg n1;

always @ (posedge clk)
begin
	n1 = d; // blocking
	q = n1; // blocking
end
endmodule
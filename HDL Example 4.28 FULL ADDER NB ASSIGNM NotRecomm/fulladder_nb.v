// nonblocking assignments (not recommended)
module fulladder_nb_v 
(
	input a, b, cin,
	output reg s, cout
);

//Because p and g appear on the left hand side of an assignment in an always statement, they must be declared to be reg.
reg p, g;

always @ (*)
begin
	p <= a ^ b; // nonblocking
	g <= a & b; // nonblocking
	
	s <= p ^ cin;
	cout <= g | (p & cin);
end
endmodule
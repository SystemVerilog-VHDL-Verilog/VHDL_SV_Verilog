-- nonblocking assignments (not recommended)
library IEEE; use IEEE.STD_LOGIC_1164.all;
entity fulladder_nb_vhd is
port
(
	a, b, cin: in STD_LOGIC;
	s, cout: out STD_LOGIC
);
end;

architecture nonblocking of fulladder_nb_vhd is

signal p, g: STD_LOGIC;

begin
-- process (a, b, cin, p, g) begin VHDL 
process(all) begin -- VHDL 2008
	p <= a xor b; -- nonblocking
	g <= a and b; -- nonblocking
	s <= p xor cin;
	cout <= g or (p and cin);
end process;

end;
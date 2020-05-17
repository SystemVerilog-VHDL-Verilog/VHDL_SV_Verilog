library IEEE; use IEEE.STD_LOGIC_1164.all;
entity fulladder_vhd is

port
(
	a, b, cin: in STD_LOGIC;
	s, cout: out STD_LOGIC
);
end;

architecture synth of fulladder_vhd is
	begin
		process(all) -- supported in VHDL 1076-2008
		--process (a, b, cin)
		variable p, g: STD_LOGIC;
		begin
			p := a xor b; -- blocking
			g := a and b; -- blocking
			s <= p xor cin;
			cout <= g or (p and cin);
	end process;
end;
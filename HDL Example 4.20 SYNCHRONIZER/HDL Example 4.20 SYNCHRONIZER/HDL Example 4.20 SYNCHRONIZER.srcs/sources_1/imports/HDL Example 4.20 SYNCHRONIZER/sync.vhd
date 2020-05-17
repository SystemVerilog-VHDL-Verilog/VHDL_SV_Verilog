library IEEE; use IEEE.STD_LOGIC_1164.all;
entity sync_vhd is
	port
	(
		clk: in STD_LOGIC;
		d: in STD_LOGIC;
		q: out STD_LOGIC
	);
end;

architecture good of sync_vhd is

signal n1: STD_LOGIC;

begin
	process(clk) begin
		if rising_edge(clk) then
			n1 <= d;
			q <= n1;
		end if;
	end process;
end;
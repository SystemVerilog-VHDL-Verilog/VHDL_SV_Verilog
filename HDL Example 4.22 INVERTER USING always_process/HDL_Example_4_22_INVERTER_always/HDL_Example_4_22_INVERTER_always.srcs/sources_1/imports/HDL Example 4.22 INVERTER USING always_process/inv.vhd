library IEEE; use IEEE.STD_LOGIC_1164.all;
entity inv_vhd is
port
(
	a: in STD_LOGIC_VECTOR(3 downto 0);
	y: out STD_LOGIC_VECTOR(3 downto 0)
);
end;

architecture proc of inv_vhd is

begin
	--process(all) begin -- supported in VHDL 1076-2008
	process (a) begin
		y <= not a;
	end process;
end;
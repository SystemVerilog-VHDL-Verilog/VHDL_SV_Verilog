library IEEE; use IEEE.STD_LOGIC_1164.all;
entity flop_ar_vhd is

port
	(
		clk, reset: in STD_LOGIC;
		d: in STD_LOGIC_VECTOR(3 downto 0);
		q: out STD_LOGIC_VECTOR(3 downto 0)
	);
end;

architecture synchronous of flop_ar_vhd is

begin

process(clk, reset) begin
	if reset = '1' then
		q <= "0000";
	elsif rising_edge(clk) then
		q <= d;
	end if;
end process;
end;
-- Bad implementation of a synchronizer using blocking –– assignment
library IEEE; use IEEE.STD_LOGIC_1164.all;
entity syncbad_vhd is
port
(
clk: in STD_LOGIC;
d: in STD_LOGIC;
q: out STD_LOGIC
);
end;

architecture bad of syncbad_vhd is
begin

process(clk)
variable n1: STD_LOGIC;
begin
	if rising_edge(clk) then
		n1 := d; -- blocking
		q <= n1;
	end if;
end process;

end;
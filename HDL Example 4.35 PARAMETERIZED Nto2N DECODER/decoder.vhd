library IEEE; use IEEE.STD_LOGIC_1164.all;
use IEEE. NUMERIC_STD_UNSIGNED.all;

entity decoder_vhd is
generic(N: integer := 3);
port
(
a: in STD_LOGIC_VECTOR(N - 1 downto 0);
y: out STD_LOGIC_VECTOR(2**N - 1 downto 0)
);
end;

architecture synth of decoder_vhd is

begin
--process(all)-- VHDL 2008
process(a)
	begin
		y <= (OTHERS => '0');
		y(TO_INTEGER(a)) <= '1';
end process;
end;
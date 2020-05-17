-- 4.33(a): unsigned multiplier
library IEEE; use IEEE.STD_LOGIC_1164.all;
--use IEEE.NUMERIC_STD_UNSIGNED.all; -- VHDL2008 (but not always work)
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplier_vhd is
port
(
	a: in STD_LOGIC_VECTOR(3 downto 0);
	b: in STD_LOGIC_VECTOR(3 downto 0);
	y: out STD_LOGIC_VECTOR(7 downto 0)
);
end;

architecture synth of multiplier_vhd is
begin
y <= a * b;
end;

--library IEEE; use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--entity multiplier is
--generic (N: integer : 8);
--port (a, b: in STD_LOGIC_VECTOR(N-1 downto 0);
--y: out STD_LOGIC_VECTOR(2*N-1 downto 0));
--end;
--architecture synth of multiplier is
--begin
--y <= a * b;
--end;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity leftshift2_32 is
port
(
a: in STD_LOGIC_VECTOR(31 downto 0);
y: out STD_LOGIC_VECTOR(31 downto 0)
);
end;
architecture synth of leftshift2_32 is
begin
	y <= a(29 downto 0) & "00";
end;
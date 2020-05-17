library IEEE; use IEEE.STD_LOGIC_1164.all;
entity BIT_SWIZZLING_vhd is
port
(
	C: in STD_LOGIC_VECTOR(4 downto 0);
	D: in STD_LOGIC_VECTOR(4 downto 0);
	Y: out STD_LOGIC_VECTOR(8 downto 0)
);
end;
architecture synth of BIT_SWIZZLING_vhd is
begin
Y <= C(2 downto 1) & D(0) & D(0) & D(0) & C(0) & "101";
end;
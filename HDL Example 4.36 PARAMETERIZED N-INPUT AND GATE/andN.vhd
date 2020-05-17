library IEEE; use IEEE.STD_LOGIC_1164.all;

entity andN_vhd is
generic(width: integer := 8);
port
(
	a: in STD_LOGIC_VECTOR(width - 1 downto 0);
	y: out STD_LOGIC
);
end;

architecture synth of andN_vhd is

signal x: STD_LOGIC_VECTOR(width - 1 downto 0);

begin
	
x(0) <= a(0);
	
	gen: for i in 1 to width-1 generate
		x(i) <= a(i) and x(i-1);
	end generate;

y <= x(width - 1);

end;



--architecture synth of andN is
--	signal i: integer;
--	signal x: STD_LOGIC_VECTOR (width - 1 downto 1);
--begin
--	AllBits: for i in 1 to width-1 generate
--		LowBit: if i = 1 generate
--			A1: x(1) <= a(0) and a(1);
--		end generate;

--		OtherBits: if i /= 1 generate
--			Ai: x(i) <= a(i) and x(i-1);
--		end generate;
--	end generate;

--y <= x(width-1);

--end;
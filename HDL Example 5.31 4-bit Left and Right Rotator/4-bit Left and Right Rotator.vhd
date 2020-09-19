library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity ex5_14 is
port
(
a: in STD_LOGIC_VECTOR(3 downto 0);
right_rotated, left_rotated: out STD_LOGIC_VECTOR(3 downto 0);
shamt: in STD_LOGIC_VECTOR(1 downto 0)
);
end;
	architecture synth of ex5_14 is

begin
architecture synth of ex5_14 is
	begin
	-- right-rotated
	process(all) begin -- VHDL 2008
		case shamt is
			when "00" => right_rotated <= a;
			when "01" => right_rotated <= (a(0), a(3), a(2), a(1));
			when "10" => right_rotated <= (a(1), a(0), a(3), a(2));
			when "11" => right_rotated <= (a(2), a(1), a(0), a(3));
			when others => right_rotated <= "XXXX";
		end case;
	end process;
	
	-- left-rotated
	process(all) begin
		case shamt is
			when "00" => left_rotated <= a;
			when "01" => left_rotated <= (a(2), a(1), a(0), a(3));
			when "10" => left_rotated <= (a(1), a(0), a(3), a(2));
			when "11" => left_rotated <= (a(0), a(3), a(2), a(1));
			when others => left_rotated <= "XXXX";
		end case;
	end process;
end;
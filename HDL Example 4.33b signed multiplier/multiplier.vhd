-- 4.33(b): signed multiplier
library IEEE; use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_SIGNED.ALL;
--use ieee.std_logic_arith.all ;
--Use numeric_std or std_logic_arith, but never both
 

entity multiplier_vhd is
port
(
--	a: in SIGNED STD_LOGIC_VECTOR(3 downto 0);
--	b: in SIGNED STD_LOGIC_VECTOR(3 downto 0);
--	y: out SIGNED STD_LOGIC_VECTOR(7 downto 0)
	a: in STD_LOGIC_VECTOR(3 downto 0);
	b: in STD_LOGIC_VECTOR(3 downto 0);
	y: out STD_LOGIC_VECTOR(7 downto 0)
);
end;



architecture synth of multiplier_vhd is

signal a_signed : signed(3 downto 0);
signal b_signed : signed(3 downto 0);
signal y_signed : signed(7 downto 0);

begin
a_signed <= signed(a);
b_signed <= signed(b);
y <= a * b;
y <= std_logic_vector(y_signed);

end;
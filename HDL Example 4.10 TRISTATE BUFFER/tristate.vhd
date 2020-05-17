library IEEE; use IEEE.STD_LOGIC_1164.all;
entity tristate_vhd is
port
(
a: in STD_LOGIC_VECTOR(3 downto 0);
en: in STD_LOGIC;
y: out STD_LOGIC_VECTOR(3 downto 0)
);
end;
architecture synth of tristate_vhd is
begin
y <= a when en = '1' else "ZZZZ";
--y <= "ZZZZ" when en = '0' else a;
end;
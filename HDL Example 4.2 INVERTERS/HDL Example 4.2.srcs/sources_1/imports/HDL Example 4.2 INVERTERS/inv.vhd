library IEEE; use IEEE.STD_LOGIC_1164.all;

entity inv_vhd is
port
(
    a: in STD_LOGIC_VECTOR(3 downto 0);
    y: out STD_LOGIC_VECTOR(3 downto 0)
);
end;

architecture synth of inv_vhd is
    begin
    y <= not a;
end;
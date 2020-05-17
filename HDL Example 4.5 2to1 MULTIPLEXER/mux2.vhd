library IEEE; use IEEE.STD_LOGIC_1164.all;
entity mux2_vhd is
port
(
d0, d1: in STD_LOGIC_VECTOR(3 downto 0);
s: in STD_LOGIC;
y: out STD_LOGIC_VECTOR(3 downto 0)
);
end;
architecture synth of mux2_vhd is
begin
y <= d1 when s = '0' else d0;
end;
library IEEE; use IEEE.STD_LOGIC_1164.all;
entity mux4_12_vhd is
port
(
	d0: in STD_LOGIC_VECTOR(11 downto 0);
	d1: in STD_LOGIC_VECTOR(11 downto 0);
	d2: in STD_LOGIC_VECTOR(11 downto 0);
	d3: in STD_LOGIC_VECTOR(11 downto 0);
	s: in STD_LOGIC_VECTOR(1 downto 0);
	y: out STD_LOGIC_VECTOR(11 downto 0)
);
end;

architecture struct of mux4_12_vhd is

component mux2_vhd
generic(width: integer := 13);
port
(
d0: in STD_LOGIC_VECTOR(width-1 downto 0);
d1: in STD_LOGIC_VECTOR(width-1 downto 0);
s: in STD_LOGIC;
y: out STD_LOGIC_VECTOR(width-1 downto 0)
);
end component;

signal low, hi: STD_LOGIC_VECTOR(11 downto 0);

begin
lowmux: mux2_vhd generic map(12)
port map(d0, d1, s(0), low);

himux: mux2_vhd generic map(12)
port map(d2, d3, s(0), hi);

outmux: mux2_vhd generic map(12)
port map(low, hi, s(1), y);

end;
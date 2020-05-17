library IEEE; use IEEE.STD_LOGIC_1164.all;
entity mux2_8_vhd is
port
(
    d0, d1: in STD_LOGIC_VECTOR(7 downto 0);
    s: in STD_LOGIC;
    y: out STD_LOGIC_VECTOR(7 downto 0)
);
end;

architecture struct of mux2_8_vhd is

component mux2_vhd
port
(
    d0, d1: in STD_LOGIC_VECTOR(3 downto 0);
    s: in STD_LOGIC;
    y: out STD_LOGIC_VECTOR(3 downto 0)
);
end component;

begin

lsbmux: mux2_vhd port map
(
    d0 => d0(3 downto 0), 
    d1 => d1(3 downto 0),
    s => s, 
    y => y(3 downto 0)
);

msbmux: mux2_vhd port map
(
    d0 => d0(7 downto 4), 
    d1 => d1(7 downto 4),
    s => s, 
    y => y(7 downto 4)
);

end;
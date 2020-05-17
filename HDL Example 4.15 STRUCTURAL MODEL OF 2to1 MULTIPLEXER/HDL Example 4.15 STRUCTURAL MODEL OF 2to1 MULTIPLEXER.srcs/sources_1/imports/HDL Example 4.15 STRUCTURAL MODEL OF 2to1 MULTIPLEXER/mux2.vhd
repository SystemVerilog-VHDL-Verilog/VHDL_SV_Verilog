library IEEE; use IEEE.STD_LOGIC_1164.all;

entity mux2_vhd is
port
(
    d0, d1: in STD_LOGIC_VECTOR(3 downto 0);
    s: in STD_LOGIC;
    y: out STD_LOGIC_VECTOR(3 downto 0)
);
end;

architecture struct of mux2_vhd is

component tristate_vhd
port
(
    a: in STD_LOGIC_VECTOR(3 downto 0);
    en: in STD_LOGIC;
    y: out STD_LOGIC_VECTOR(3 downto 0)
);
end component;

signal sbar: STD_LOGIC;

begin

sbar <= not s;
t0: tristate_vhd port map(d0, sbar, y);
t1: tristate_vhd port map(d1, s, y);
end;
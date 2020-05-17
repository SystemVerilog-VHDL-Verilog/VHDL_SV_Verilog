library IEEE; use IEEE.STD_LOGIC_1164.all;
entity mux4_vhd is
port(
d0, d1,d2, d3: in STD_LOGIC_VECTOR(3 downto 0);
s: in STD_LOGIC_VECTOR(1 downto 0);
y: out STD_LOGIC_VECTOR(3 downto 0)--;
--y_1: out STD_LOGIC_VECTOR(3 downto 0)
);
end;
architecture synth1 of mux4_vhd is
begin
y <= d0 when s = "00" else d1 when s = "01" else d2 when s = "10" else d3;

-- next code make uncorrect RTL and Synthesis
--with s select y_1 <=
--    d0 when "00",
--    d1 when "01",
--    d2 when "10",
--    d3 when others;
    
end;
library IEEE; use IEEE.STD_LOGIC_1164.all;
entity BIT_SWIZZLING_top is

port
    (
        --connect to SystemVerilog
	C_sv: in STD_LOGIC_VECTOR(4 downto 0);
	D_sv: in STD_LOGIC_VECTOR(4 downto 0);
	Y_sv: out STD_LOGIC_VECTOR(8 downto 0);
        --connect to Verilog
	C_v: in STD_LOGIC_VECTOR(4 downto 0);
	D_v: in STD_LOGIC_VECTOR(4 downto 0);
	Y_v: out STD_LOGIC_VECTOR(8 downto 0);
        --connect to VHDL
	C_vhd: in STD_LOGIC_VECTOR(4 downto 0);
	D_vhd: in STD_LOGIC_VECTOR(4 downto 0);
	Y_vhd: out STD_LOGIC_VECTOR(8 downto 0)
     );
end;

architecture synth of BIT_SWIZZLING_top is


component BIT_SWIZZLING_sv
port
    (
	C: in STD_LOGIC_VECTOR(4 downto 0);
	D: in STD_LOGIC_VECTOR(4 downto 0);
	Y: out STD_LOGIC_VECTOR(8 downto 0)
    );
end component;

component BIT_SWIZZLING_v
port
    (
	C: in STD_LOGIC_VECTOR(4 downto 0);
	D: in STD_LOGIC_VECTOR(4 downto 0);
	Y: out STD_LOGIC_VECTOR(8 downto 0)
    );
end component;

component BIT_SWIZZLING_vhd
port
    (
	C: in STD_LOGIC_VECTOR(4 downto 0);
	D: in STD_LOGIC_VECTOR(4 downto 0);
	Y: out STD_LOGIC_VECTOR(8 downto 0)
    );
end component;

    begin

--connect to SystemVerilog
    SV: BIT_SWIZZLING_sv
    port map
    (
	C => C_sv, 
	D => D_sv, 
	Y => Y_sv
    );

--connect to Verilog
    V: BIT_SWIZZLING_v
    port map
     (
	C => C_v, 
	D => D_v, 
	Y => Y_v
     );

--connect to VHDL
    VHDL: BIT_SWIZZLING_vhd
    port map
     (
	C => C_vhd, 
	D => D_vhd, 
	Y => Y_vhd
     );


end;
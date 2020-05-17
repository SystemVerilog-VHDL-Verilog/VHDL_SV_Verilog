library IEEE; use IEEE.STD_LOGIC_1164.all;
entity multiplier_top is

port
    (
        --connect to SystemVerilog
	a_sv: in STD_LOGIC_VECTOR(3 downto 0);
	b_sv: in STD_LOGIC_VECTOR(3 downto 0);
	y_sv: out STD_LOGIC_VECTOR(7 downto 0);
        --connect to Verilog
	a_v: in STD_LOGIC_VECTOR(3 downto 0);
	b_v: in STD_LOGIC_VECTOR(3 downto 0);
	y_v: out STD_LOGIC_VECTOR(7 downto 0);
        --connect to VHDL
	a_vhd: in STD_LOGIC_VECTOR(3 downto 0);
	b_vhd: in STD_LOGIC_VECTOR(3 downto 0);
	y_vhd: out STD_LOGIC_VECTOR(7 downto 0)
     );
end;

architecture synth of multiplier_top is


component multiplier_sv
port
    (
	a: in STD_LOGIC_VECTOR(3 downto 0);
	b: in STD_LOGIC_VECTOR(3 downto 0);
	y: out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

component multiplier_v
port
    (
	a: in STD_LOGIC_VECTOR(3 downto 0);
	b: in STD_LOGIC_VECTOR(3 downto 0);
	y: out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

component multiplier_vhd
port
    (
	a: in STD_LOGIC_VECTOR(3 downto 0);
	b: in STD_LOGIC_VECTOR(3 downto 0);
	y: out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

begin

--connect to SystemVerilog
    SV: multiplier_sv
    port map
    (
	a => a_sv,
	b => b_sv, 
	y => y_sv
    );

--connect to Verilog
    V: multiplier_v
    port map
     (
	a => a_v,
	b => b_v,  
	y => y_v
     );

--connect to VHDL
    VHDL: multiplier_vhd
    port map
     (
	a => a_vhd,
	b => b_vhd,  
	y => y_vhd
     );


end;
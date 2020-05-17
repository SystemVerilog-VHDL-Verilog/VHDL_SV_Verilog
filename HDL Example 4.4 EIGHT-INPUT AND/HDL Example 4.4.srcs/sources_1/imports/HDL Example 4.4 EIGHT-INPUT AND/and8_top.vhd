library IEEE; use IEEE.STD_LOGIC_1164.all;
entity and8_top is

port
    (
        --connect to SystemVerilog
    a_sv:	in STD_LOGIC_VECTOR(7 downto 0);
    y_sv:	out STD_LOGIC;
    y1_sv:	out STD_LOGIC;
        --connect to Verilog
    a_v:	in STD_LOGIC_VECTOR(7 downto 0);
    y_v:	out STD_LOGIC;
        --connect to VHDL
    a_vhd:	in STD_LOGIC_VECTOR(7 downto 0);
    y_vhd:	out STD_LOGIC  
     );
end;


architecture synth of and8_top is



component and8_sv
port
    (
	a: in STD_LOGIC_VECTOR(7 downto 0);
	y: out STD_LOGIC;
	y1: out STD_LOGIC
    );
end component;

component and8_v
port
    (
	a: in STD_LOGIC_VECTOR(7 downto 0);
	y: out STD_LOGIC
    );
end component;

component and8_vhd
port
    (
	a: in STD_LOGIC_VECTOR(7 downto 0);
	y: out STD_LOGIC
    );
end component;

    begin

--connect to SystemVerilog
    SV: and8_sv
    port map
    (
    a => a_sv(7 downto 0), 
    y => y_sv,
    y1 => y1_sv
    );

--connect to Verilog
    V: and8_v
    port map
     (
     a => a_v(7 downto 0), 
     y => y_v
     );

--connect to VHDL
    VHDL: and8_vhd
    port map
     (
     a => a_vhd(7 downto 0), 
     y => y_vhd
     );


end;
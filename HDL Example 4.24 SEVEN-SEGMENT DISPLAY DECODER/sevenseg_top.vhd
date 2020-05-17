library IEEE; use IEEE.STD_LOGIC_1164.all;
entity sevenseg_top is

port
    (
        --connect to SystemVerilog
	data_sv		: in STD_LOGIC_VECTOR(3 downto 0);
	segments_sv	: out STD_LOGIC_VECTOR(6 downto 0);
        --connect to Verilog
	data_v		: in STD_LOGIC_VECTOR(3 downto 0);
	segments_v	: out STD_LOGIC_VECTOR(6 downto 0);
        --connect to VHDL
	data_vhd	: in STD_LOGIC_VECTOR(3 downto 0);
	segments_vhd	: out STD_LOGIC_VECTOR(6 downto 0)
     );
end;

architecture synth of sevenseg_top is


component sevenseg_sv
port
    (
	data		: in STD_LOGIC_VECTOR(3 downto 0);
	segments	: out STD_LOGIC_VECTOR(6 downto 0)
    );
end component;

component sevenseg_v
port
    (
	data		: in STD_LOGIC_VECTOR(3 downto 0);
	segments	: out STD_LOGIC_VECTOR(6 downto 0)
    );
end component;

component sevenseg_vhd
port
    (
	data		: in STD_LOGIC_VECTOR(3 downto 0);
	segments	: out STD_LOGIC_VECTOR(6 downto 0)
    );
end component;

begin

--connect to SystemVerilog
    SV: sevenseg_sv
    port map
    (
	data => data_sv, 
	segments => segments_sv
    );

--connect to Verilog
    V: sevenseg_v
    port map
     (
	data => data_v, 
	segments => segments_v
     );

--connect to VHDL
    VHDL: sevenseg_vhd
    port map
     (
	data => data_vhd, 
	segments => segments_vhd 
     );


end;
library IEEE; use IEEE.STD_LOGIC_1164.all;
entity tristate_top is

port
    (
        --connect to SystemVerilog
	a_sv	: in STD_LOGIC_VECTOR(3 downto 0);
	en_sv	: in STD_LOGIC;
	y_sv	: out STD_LOGIC_VECTOR(3 downto 0);
        --connect to Verilog
	a_v	: in STD_LOGIC_VECTOR(3 downto 0);
	en_v	: in STD_LOGIC;
	y_v	: out STD_LOGIC_VECTOR(3 downto 0);
        --connect to VHDL
	a_vhd	: in STD_LOGIC_VECTOR(3 downto 0);
	en_vhd	: in STD_LOGIC;
	y_vhd	: out STD_LOGIC_VECTOR(3 downto 0)
     );
end;

architecture synth of tristate_top is


component tristate_sv
port
    (
	a	: in STD_LOGIC_VECTOR(3 downto 0);
	en	: in STD_LOGIC;
	y	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component tristate_v
port
    (
	a	: in STD_LOGIC_VECTOR(3 downto 0);
	en	: in STD_LOGIC;
	y	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component tristate_vhd
port
    (
	a	: in STD_LOGIC_VECTOR(3 downto 0);
	en	: in STD_LOGIC;
	y	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

    begin

--connect to SystemVerilog
    SV: tristate_sv
    port map
    (
	a => a_sv, 
	en => en_sv, 
	y => y_sv
    );

--connect to Verilog
    V: tristate_v
    port map
     (
	a => a_v, 
	en => en_v, 
	y => y_v
     );

--connect to VHDL
    VHDL: tristate_vhd
    port map
     (
	a => a_vhd, 
	en => en_vhd, 
	y => y_vhd
     );


end;
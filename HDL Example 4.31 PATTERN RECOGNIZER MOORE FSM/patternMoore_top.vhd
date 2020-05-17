library IEEE; use IEEE.STD_LOGIC_1164.all;
entity patternMoore_top is

port
    (
	-- Common
	reset: 		in STD_LOGIC;        
	clk:		in STD_LOGIC;
	a:		in STD_LOGIC;
	--connect to SystemVerilog
	y_sv:		out STD_LOGIC;
        --connect to Verilog
	y_v:		out STD_LOGIC;
        --connect to VHDL
	y_vhd:		out STD_LOGIC
     );
end;

architecture synth of patternMoore_top is


component patternMoore_sv
port
    (
	reset	: in STD_LOGIC;
	clk	: in STD_LOGIC;
	a	: in STD_LOGIC;
	y	: out STD_LOGIC
    );
end component;

component patternMoore_v
port
    (
	reset	: in STD_LOGIC;
	clk	: in STD_LOGIC;
	a	: in STD_LOGIC;
	y	: out STD_LOGIC
    );
end component;

component patternMoore_vhd
port
    (
	reset	: in STD_LOGIC;
	clk	: in STD_LOGIC;
	a	: in STD_LOGIC;
	y	: out STD_LOGIC
    );
end component;

    begin

--connect to SystemVerilog
    SV: patternMoore_sv
    port map
    (
	reset 	=> reset,
	clk 	=> clk, 
	a 	=> a, 
	y 	=> y_sv 
    );

--connect to Verilog
    V: patternMoore_v
    port map
     (
	reset 	=> reset,
	clk 	=> clk, 
	a 	=> a, 
	y 	=> y_v 
     );

--connect to VHDL
    VHDL: patternMoore_vhd
    port map
     (
	reset 	=> reset,
	clk 	=> clk, 
	a 	=> a, 
	y 	=> y_vhd  
     );


end;
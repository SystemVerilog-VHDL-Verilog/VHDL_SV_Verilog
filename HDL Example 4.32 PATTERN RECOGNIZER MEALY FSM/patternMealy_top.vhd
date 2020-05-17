--The daughter snail smiles whenever she slides over the pattern 1101.
library IEEE; use IEEE.STD_LOGIC_1164.all;
entity patternMealy_top is

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

architecture synth of patternMealy_top is


component patternMealy_sv
port
    (
	reset	 : in STD_LOGIC;
	clk	     : in STD_LOGIC;
	a	     : in STD_LOGIC;
	y	     : out STD_LOGIC
    );
end component;

component patternMealy_v
port
    (
	reset	 : in STD_LOGIC;
	clk	     : in STD_LOGIC;
	a	     : in STD_LOGIC;
	y	     : out STD_LOGIC
    );
end component;

component patternMealy_vhd
port
    (
	reset	 : in STD_LOGIC;
	clk	     : in STD_LOGIC;
	a	     : in STD_LOGIC;
	y	     : out STD_LOGIC
    );
end component;

    begin

--connect to SystemVerilog
    SV: patternMealy_sv
    port map
    (
	reset 	=> reset,
	clk 	=> clk, 
	a 	    => a, 
	y 	    => y_sv 
    );

--connect to Verilog
    V: patternMealy_v
    port map
     (
	reset 	=> reset,
	clk 	=> clk, 
	a 	    => a, 
	y 	    => y_v 
     );

--connect to VHDL
    VHDL: patternMealy_vhd
    port map
     (
	reset 	=> reset,
	clk 	=> clk, 
	a 	    => a, 
	y 	    => y_vhd  
     );


end;
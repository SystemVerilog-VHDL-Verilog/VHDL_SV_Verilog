library IEEE; use IEEE.STD_LOGIC_1164.all;
entity syncbad_top is

port
    (
	-- Common        
	clk:		in STD_LOGIC;
	d:		in STD_LOGIC;
	--connect to SystemVerilog
	q_sv:		out STD_LOGIC;
        --connect to Verilog
	q_v:		out STD_LOGIC;
        --connect to VHDL
	q_vhd:		out STD_LOGIC
     );
end;

architecture synth of syncbad_top is


component syncbad_sv
port
    (
	clk: in STD_LOGIC;
	d: in STD_LOGIC;
	q: out STD_LOGIC
    );
end component;

component syncbad_v
port
    (
	clk: in STD_LOGIC;
	d: in STD_LOGIC;
	q: out STD_LOGIC
    );
end component;

component syncbad_vhd
port
    (
	clk: in STD_LOGIC;
	d: in STD_LOGIC;
	q: out STD_LOGIC
    );
end component;

    begin

--connect to SystemVerilog
    SV: syncbad_sv
    port map
    (
	clk => clk, 
	d => d, 
	q => q_sv 
    );

--connect to Verilog
    V: syncbad_v
    port map
     (
	clk => clk, 
	d => d, 
	q => q_v 
     );

--connect to VHDL
    VHDL: syncbad_vhd
    port map
     (
	clk => clk, 
	d => d, 
	q => q_vhd 
     );


end;
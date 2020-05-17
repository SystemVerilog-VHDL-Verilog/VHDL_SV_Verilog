library IEEE; use IEEE.STD_LOGIC_1164.all;
entity divideby3FSM_top is

port
    (
	-- Common
	reset:		in STD_LOGIC;        
	clk:		in STD_LOGIC;
	--connect to SystemVerilog
	y_sv:		out STD_LOGIC;
        --connect to Verilog
	y_v:		out STD_LOGIC;
        --connect to VHDL
	y_vhd:		out STD_LOGIC
     );
end;

architecture synth of divideby3FSM_top is


component divideby3FSM_sv
port
    (
	reset	: in  STD_LOGIC;
	clk	: in  STD_LOGIC;
	y	: out STD_LOGIC
    );
end component;

component divideby3FSM_v
port
    (
	reset	: in  STD_LOGIC;
	clk	: in  STD_LOGIC;
	y	: out STD_LOGIC
    );
end component;

component divideby3FSM_vhd
port
    (
	reset	: in  STD_LOGIC;
	clk	: in  STD_LOGIC;
	y	: out STD_LOGIC
    );
end component;

    begin

--connect to SystemVerilog
    SV: divideby3FSM_sv
    port map
    (
	clk => clk, 
	reset => reset, 
	y => y_sv 
    );

--connect to Verilog
    V: divideby3FSM_v
    port map
     (
	clk => clk, 
	reset => reset, 
	y => y_v 
     );

--connect to VHDL
    VHDL: divideby3FSM_vhd
    port map
     (
	clk => clk, 
	reset => reset,
	y => y_vhd 
     );


end;
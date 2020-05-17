library IEEE; use IEEE.STD_LOGIC_1164.all;
entity sync_top is

port
    (
        --common signals 
	clk	: in STD_LOGIC;
	d_in	: in STD_LOGIC;
	--connect to SystemVerilog
	q_sv	: out STD_LOGIC;
        --connect to Verilog
	q_v	: out STD_LOGIC;
        --connect to VHDL
	q_vhd	: out STD_LOGIC
     );
end;

architecture synth of sync_top is


component sync_sv
port
    (
	clk	: in STD_LOGIC;
	d	: in STD_LOGIC;
	q	: out STD_LOGIC
    );
end component;

--------------------------------------------------------

component sync_v
port
    (
	clk	: in STD_LOGIC;
	d	: in STD_LOGIC;
	q	: out STD_LOGIC
    );
end component;

---------------------------------------------------------


component sync_vhd
port
    (
	clk	: in STD_LOGIC;
	d	: in STD_LOGIC;
	q	: out STD_LOGIC
    );
end component;

---------------------------------------------------------

    begin

---------------------------------------------------------
--connect to SystemVerilog
    SV_SYNC: sync_sv
    port map
    (
	clk 	=> clk, 
	d 	=> d_in, 
	q 	=> q_sv
    );

---------------------------------------------------------
--connect to Verilog
    V_SYNC: sync_v
    port map
    (
	clk 	=> clk, 
	d 	=> d_in, 
	q 	=> q_v
    );

---------------------------------------------------------

--connect to VHDL
    VHDL_SYNC: sync_vhd
    port map
    (
	clk 	=> clk, 
	d 	=> d_in, 
	q 	=> q_vhd
    );

---------------------------------------------------------


end;
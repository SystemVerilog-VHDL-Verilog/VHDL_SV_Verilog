library IEEE; use IEEE.STD_LOGIC_1164.all;
entity Latch_top is

port
    (
        --common signals 
	clk	: in STD_LOGIC;
	d_in	: in STD_LOGIC_VECTOR(3 downto 0);
	--connect to SystemVerilog
	q_sv	: out STD_LOGIC_VECTOR(3 downto 0);
        --connect to Verilog
	q_v	: out STD_LOGIC_VECTOR(3 downto 0);
        --connect to VHDL
	q_vhd	: out STD_LOGIC_VECTOR(3 downto 0)
     );
end;

architecture synth of Latch_top is


component latch_sv
port
    (
	clk	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

--------------------------------------------------------

component latch_v
port
    (
	clk	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

---------------------------------------------------------


component latch_vhd
port
    (
	clk	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

---------------------------------------------------------

    begin

---------------------------------------------------------
--connect to SystemVerilog
    SV_LATCH: latch_sv
    port map
    (
	clk 	=> clk, 
	d 	=> d_in(3 downto 0), 
	q 	=> q_sv(3 downto 0)
    );

---------------------------------------------------------
--connect to Verilog
    V_LATCH: latch_v
    port map
    (
	clk 	=> clk, 
	d 	=> d_in(3 downto 0), 
	q 	=> q_v(3 downto 0)
    );

---------------------------------------------------------

--connect to VHDL
    VHDL_LATCH: latch_vhd
    port map
    (
	clk 	=> clk, 
	d 	=> d_in(3 downto 0), 
	q 	=> q_vhd(3 downto 0)
    );

---------------------------------------------------------


end;
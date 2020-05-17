library IEEE; use IEEE.STD_LOGIC_1164.all;
entity flopenr_top is

port
    (
        --common signals 
	clk	    : in STD_LOGIC;
	reset	: in STD_LOGIC;
	enable	: in STD_LOGIC;
	data_in	: in STD_LOGIC_VECTOR(3 downto 0);

	--connect to SystemVerilog
	q_sv	: out STD_LOGIC_VECTOR(3 downto 0);
        --connect to Verilog
	q_v	    : out STD_LOGIC_VECTOR(3 downto 0);
        --connect to VHDL
	q_vhd	: out STD_LOGIC_VECTOR(3 downto 0)
     );
end;

architecture synth of flopenr_top is


component flopenr_sv
port
    (
	clk	: in STD_LOGIC;
	reset	: in STD_LOGIC;
	en	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

--------------------------------------------------------

component flopenr_v
port
    (
	clk	: in STD_LOGIC;
	reset	: in STD_LOGIC;
	en	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

---------------------------------------------------------


component flopenr_vhd
port
    (
	clk	: in STD_LOGIC;
	reset	: in STD_LOGIC;
	en	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

---------------------------------------------------------

    begin

---------------------------------------------------------
--connect to SystemVerilog
    SV_FLIP_EN: flopenr_sv
    port map
    (
	clk 	=> clk, 
	reset 	=> reset,
	en	=> enable,
	d 	=> data_in(3 downto 0), 
	q 	=> q_sv(3 downto 0)
    );

---------------------------------------------------------
--connect to Verilog
    V_FLIP_EN: flopenr_v
    port map
    (
	clk 	=> clk, 
	reset 	=> reset,
	en	=> enable,
	d 	=> data_in(3 downto 0), 
	q 	=> q_v(3 downto 0)
    );

---------------------------------------------------------

--connect to VHDL
    VHDL_FLIP_EN: flopenr_vhd
    port map
    (
	clk 	=> clk, 
	reset 	=> reset,
	en	=> enable,
	d 	=> data_in(3 downto 0), 
	q 	=> q_vhd(3 downto 0)
    );

---------------------------------------------------------


end;
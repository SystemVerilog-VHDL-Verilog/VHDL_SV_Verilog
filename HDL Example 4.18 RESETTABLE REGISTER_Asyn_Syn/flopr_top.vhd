library IEEE; use IEEE.STD_LOGIC_1164.all;
entity flopr_top is

port
    (
        --common signals 
	clk	: in STD_LOGIC;
	reset	: in STD_LOGIC;
	data_in	: in STD_LOGIC_VECTOR(3 downto 0);

	--connect to SystemVerilog
	q_a_sv	: out STD_LOGIC_VECTOR(3 downto 0);
	q_s_sv	: out STD_LOGIC_VECTOR(3 downto 0);
        --connect to Verilog
	q_a_v	: out STD_LOGIC_VECTOR(3 downto 0);
	q_s_v	: out STD_LOGIC_VECTOR(3 downto 0);
        --connect to VHDL
	q_a_vhd	 : out STD_LOGIC_VECTOR(3 downto 0);
	q_s_vhd	 : out STD_LOGIC_VECTOR(3 downto 0)
     );
end;

architecture synth of flopr_top is


component flop_ar_sv
port
    (
	clk	: in STD_LOGIC;
	reset	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component flopr_sr_sv
port
    (
	clk	: in STD_LOGIC;
	reset	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;
---------------------------------------------------------

component flop_ar_v
port
    (
	clk	: in STD_LOGIC;
	reset	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component flopr_sr_v
port
    (
	clk	: in STD_LOGIC;
	reset	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;
---------------------------------------------------------


component flop_ar_vhd
port
    (
	clk	: in STD_LOGIC;
	reset	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component flopr_sr_vhd
port
    (
	clk	: in STD_LOGIC;
	reset	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

---------------------------------------------------------

    begin

---------------------------------------------------------
--connect to SystemVerilog
    SV_asynchronous_reset: flop_ar_sv
    port map
    (
	clk => clk, 
	reset => reset,
	d => data_in(3 downto 0), 
	q => q_a_sv(3 downto 0)
    );

    SV_synchronous_reset: flopr_sr_sv
    port map
    (
	clk => clk, 
	reset => reset,
	d => data_in(3 downto 0), 
	q => q_s_sv(3 downto 0)
    );
---------------------------------------------------------
--connect to Verilog
    V_asynchronous_reset: flop_ar_v
    port map
    (
	clk => clk, 
	reset => reset,
	d => data_in(3 downto 0), 
	q => q_a_v(3 downto 0)
    );

    V_synchronous_reset: flopr_sr_v
    port map
    (
	clk => clk, 
	reset => reset,
	d => data_in(3 downto 0), 
	q => q_s_v(3 downto 0)
    );
---------------------------------------------------------

--connect to VHDL
    VHDL_asynchronous_reset: flop_ar_vhd
    port map
    (
	clk => clk, 
	reset => reset,
	d => data_in(3 downto 0), 
	q => q_a_vhd(3 downto 0)
    );

    VHDL_synchronous_reset: flopr_sr_vhd
    port map
    (
	clk => clk, 
	reset => reset,
	d => data_in(3 downto 0), 
	q => q_s_vhd(3 downto 0)
    );
---------------------------------------------------------


end;
library IEEE; use IEEE.STD_LOGIC_1164.all;
entity flop_top is

port
    (
        --connect to SystemVerilog
	clk_sv	: in STD_LOGIC;
	d_sv	: in STD_LOGIC_VECTOR(3 downto 0);
	q_sv	: out STD_LOGIC_VECTOR(3 downto 0);
        --connect to Verilog
	clk_v	: in STD_LOGIC;
	d_v	: in STD_LOGIC_VECTOR(3 downto 0);
	q_v	: out STD_LOGIC_VECTOR(3 downto 0);
        --connect to VHDL
	clk_vhd	: in STD_LOGIC;
	d_vhd	: in STD_LOGIC_VECTOR(3 downto 0);
	q_vhd	: out STD_LOGIC_VECTOR(3 downto 0)
     );
end;

architecture synth of flop_top is


component flop_sv
port
    (
	clk	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component flop_v
port
    (
	clk	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component flop_vhd
port
    (
	clk	: in STD_LOGIC;
	d	: in STD_LOGIC_VECTOR(3 downto 0);
	q	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

    begin

--connect to SystemVerilog
    SV: flop_sv
    port map
    (
	clk => clk_sv, 
	d => d_sv(3 downto 0), 
	q => q_sv(3 downto 0)
    );

--connect to Verilog
    V: flop_v
    port map
    (
	clk => clk_v, 
	d => d_v(3 downto 0), 
	q => q_v(3 downto 0)
    );

--connect to VHDL
    VHDL: flop_vhd
    port map
    (
	clk => clk_vhd, 
	d => d_vhd(3 downto 0), 
	q => q_vhd(3 downto 0)
    );


end;
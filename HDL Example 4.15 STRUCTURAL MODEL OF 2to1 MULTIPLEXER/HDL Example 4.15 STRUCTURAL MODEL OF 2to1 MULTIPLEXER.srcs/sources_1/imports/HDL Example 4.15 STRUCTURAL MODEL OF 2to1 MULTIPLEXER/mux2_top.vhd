library IEEE; use IEEE.STD_LOGIC_1164.all;
entity mux2_top is
-- don't make logic based on 3-state
port
    (
        --connect to SystemVerilog
	d0_sv, d1_sv        			: in STD_LOGIC_VECTOR (3 downto 0);
	s_sv				              : in STD_LOGIC;
	y_sv				              : out STD_LOGIC_VECTOR (3 downto 0);
        --connect to Verilog
	d0_v, d1_v		      : in STD_LOGIC_VECTOR (3 downto 0);
	s_v				                  : in STD_LOGIC;
	y_v				                  : out STD_LOGIC_VECTOR (3 downto 0);
        --connect to VHDL
	d0_vhd, d1_vhd	  		: in STD_LOGIC_VECTOR (3 downto 0);
	s_vhd				              : in STD_LOGIC;
	y_vhd				              : out STD_LOGIC_VECTOR (3 downto 0)
     );
end;

architecture synth of mux2_top is


component mux2_sv
port
    (
	d0, d1	: in STD_LOGIC_VECTOR (3 downto 0);
	s		: in STD_LOGIC;
	y		: out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

component mux2_v
port
    (
	d0, d1	: in STD_LOGIC_VECTOR (3 downto 0);
	s		: in STD_LOGIC;
	y		: out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

component mux2_vhd
port
    (
	d0, d1	: in STD_LOGIC_VECTOR (3 downto 0);
	s		: in STD_LOGIC;
	y		: out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

    begin

--connect to SystemVerilog
    SV: mux2_sv
    port map
    (
	d0 => d0_sv(3 downto 0), 
	d1 => d1_sv(3 downto 0), 
	s => s_sv,
	y => y_sv(3 downto 0)
    );

--connect to Verilog
    V: mux2_v
    port map
     (
	d0 => d0_v(3 downto 0), 
	d1 => d1_v(3 downto 0), 
	s => s_v,
	y => y_v(3 downto 0)
     );

--connect to VHDL
    VHDL: mux2_vhd
    port map
     (
	d0 => d0_vhd(3 downto 0), 
	d1 => d1_vhd(3 downto 0), 
	s => s_vhd,
	y => y_vhd(3 downto 0)
     );


end;
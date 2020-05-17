library IEEE; use IEEE.STD_LOGIC_1164.all;
entity mux4_top is

port
    (
        --connect to SystemVerilog
	d0_sv, d1_sv, d2_sv, d3_sv        : in STD_LOGIC_VECTOR (3 downto 0);
	s_sv				              : in STD_LOGIC_VECTOR (1 downto 0);
	y_sv				              : out STD_LOGIC_VECTOR (3 downto 0);
        --connect to Verilog
	d0_v, d1_v, d2_v, d3_v		      : in STD_LOGIC_VECTOR (3 downto 0);
	s_v				                  : in STD_LOGIC_VECTOR (1 downto 0);
	y_v				                  : out STD_LOGIC_VECTOR (3 downto 0);
        --connect to VHDL
	d0_vhd, d1_vhd, d2_vhd, d3_vhd	  : in STD_LOGIC_VECTOR (3 downto 0);
	s_vhd				              : in STD_LOGIC_VECTOR (1 downto 0);
	y_vhd				              : out STD_LOGIC_VECTOR (3 downto 0)
     );
end;

architecture synth of mux4_top is


component mux4_sv
port
    (
	d0, d1, d2, d3	: in STD_LOGIC_VECTOR (3 downto 0);
	s		: in STD_LOGIC_VECTOR (1 downto 0);
	y		: out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

component mux4_v
port
    (
	d0, d1, d2, d3	: in STD_LOGIC_VECTOR (3 downto 0);
	s		: in STD_LOGIC_VECTOR (1 downto 0);
	y		: out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

component mux4_vhd
port
    (
	d0, d1, d2, d3	: in STD_LOGIC_VECTOR (3 downto 0);
	s		: in STD_LOGIC_VECTOR (1 downto 0);
	y		: out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

    begin

--connect to SystemVerilog
    SV: mux4_sv
    port map
    (
	d0 => d0_sv(3 downto 0), 
	d1 => d1_sv(3 downto 0), 
	d2 => d2_sv(3 downto 0), 
	d3 => d3_sv(3 downto 0), 
	s => s_sv,
	y => y_sv(3 downto 0)
    );

--connect to Verilog
    V: mux4_v
    port map
     (
	d0 => d0_v(3 downto 0), 
	d1 => d1_v(3 downto 0), 
	d2 => d2_v(3 downto 0), 
	d3 => d3_v(3 downto 0), 
	s => s_v,
	y => y_v(3 downto 0)
     );

--connect to VHDL
    VHDL: mux4_vhd
    port map
     (
	d0 => d0_vhd(3 downto 0), 
	d1 => d1_vhd(3 downto 0), 
	d2 => d2_vhd(3 downto 0), 
	d3 => d3_vhd(3 downto 0), 
	s => s_vhd,
	y => y_vhd(3 downto 0)
     );


end;
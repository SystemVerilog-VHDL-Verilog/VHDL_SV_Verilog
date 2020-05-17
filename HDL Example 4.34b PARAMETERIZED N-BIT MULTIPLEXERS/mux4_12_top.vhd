library IEEE; use IEEE.STD_LOGIC_1164.all;
entity mux4_12_top is

port
    (
        --connect to SystemVerilog
	d0_sv:	in STD_LOGIC_VECTOR(11 downto 0);
	d1_sv: 	in STD_LOGIC_VECTOR(11 downto 0);
	d2_sv:	in STD_LOGIC_VECTOR(11 downto 0);
	d3_sv: 	in STD_LOGIC_VECTOR(11 downto 0);
	s_sv: 	in STD_LOGIC_VECTOR(1 downto 0);
	y_sv: 	out STD_LOGIC_VECTOR(11 downto 0);
        --connect to Verilog
	d0_v:	in STD_LOGIC_VECTOR(11 downto 0);
	d1_v: 	in STD_LOGIC_VECTOR(11 downto 0);
	d2_v:	in STD_LOGIC_VECTOR(11 downto 0);
	d3_v: 	in STD_LOGIC_VECTOR(11 downto 0);
	s_v: 	in STD_LOGIC_VECTOR(1 downto 0);
	y_v: 	out STD_LOGIC_VECTOR(11 downto 0);
        --connect to VHDL
	d0_vhd:	in STD_LOGIC_VECTOR(11 downto 0);
	d1_vhd: in STD_LOGIC_VECTOR(11 downto 0);
	d2_vhd:	in STD_LOGIC_VECTOR(11 downto 0);
	d3_vhd: in STD_LOGIC_VECTOR(11 downto 0);
	s_vhd: 	in STD_LOGIC_VECTOR(1 downto 0);
	y_vhd: 	out STD_LOGIC_VECTOR(11 downto 0)
     );
end;

architecture synth of mux4_12_top is


component mux4_12_sv
port
    (
	d0, d1, d2, d3: in STD_LOGIC_VECTOR(11 downto 0);
	s: in STD_LOGIC_VECTOR(1 downto 0);
	y: out STD_LOGIC_VECTOR(11 downto 0)
    );
end component;

component mux4_12_v
port
    (
	   d0, d1,  d2, d3: in STD_LOGIC_VECTOR(11 downto 0);
	   s: in STD_LOGIC_VECTOR(1 downto 0);
	   y: out STD_LOGIC_VECTOR(11 downto 0)
    );
end component;

component mux4_12_vhd
port
    (
	   d0, d1, d2, d3: in STD_LOGIC_VECTOR(11 downto 0);
	   s: in STD_LOGIC_VECTOR(1 downto 0);
	   y: out STD_LOGIC_VECTOR(11 downto 0)
    );
end component;

    begin

--connect to SystemVerilog
    SV: mux4_12_sv
    port map
    (
       d0 => d0_sv(11 downto 0), 
	   d1 => d1_sv(11 downto 0), 
	   d2 => d2_sv(11 downto 0), 
	   d3 => d3_sv(11 downto 0),
	   s => s_sv(1 downto 0),
	   y => y_sv(11 downto 0)
    );

--connect to Verilog
    V: mux4_12_v
    port map
     (
       d0 => d0_v(11 downto 0), 
	   d1 => d1_v(11 downto 0), 
	   d2 => d2_v(11 downto 0), 
	   d3 => d3_v(11 downto 0),
	   s => s_v(1 downto 0),
	   y => y_v(11 downto 0)
     );

--connect to VHDL
    VHDL: mux4_12_vhd
    port map
     (
        d0 => d0_vhd(11 downto 0), 
        d1 => d1_vhd(11 downto 0), 
        d2 => d2_vhd(11 downto 0), 
        d3 => d3_vhd(11 downto 0), 
        s => s_vhd(1 downto 0),
        y => y_vhd(11 downto 0)
     );


end;
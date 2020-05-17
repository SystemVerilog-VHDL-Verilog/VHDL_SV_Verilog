library IEEE; use IEEE.STD_LOGIC_1164.all;
entity gates_top is

port
    (
        --connect to SystemVerilog
    a_sv:	in STD_LOGIC_VECTOR(3 downto 0);
	b_sv:	in STD_LOGIC_VECTOR(3 downto 0);
    y1_sv:	out STD_LOGIC_VECTOR(3 downto 0);
	y2_sv:	out STD_LOGIC_VECTOR(3 downto 0);
	y3_sv:	out STD_LOGIC_VECTOR(3 downto 0);
	y4_sv:	out STD_LOGIC_VECTOR(3 downto 0);
	y5_sv:	out STD_LOGIC_VECTOR(3 downto 0);
        --connect to Verilog
    a_v:	in STD_LOGIC_VECTOR(3 downto 0);
	b_v:	in STD_LOGIC_VECTOR(3 downto 0);
    y1_v:	out STD_LOGIC_VECTOR(3 downto 0);
    y2_v:	out STD_LOGIC_VECTOR(3 downto 0);
    y3_v:	out STD_LOGIC_VECTOR(3 downto 0);
    y4_v:	out STD_LOGIC_VECTOR(3 downto 0);
    y5_v:	out STD_LOGIC_VECTOR(3 downto 0);
        --connect to VHDL
    a_vhd:	in STD_LOGIC_VECTOR(3 downto 0);
	b_vhd:	in STD_LOGIC_VECTOR(3 downto 0);
    y1_vhd:	out STD_LOGIC_VECTOR(3 downto 0);     
    y2_vhd:	out STD_LOGIC_VECTOR(3 downto 0);
    y3_vhd:	out STD_LOGIC_VECTOR(3 downto 0);
    y4_vhd:	out STD_LOGIC_VECTOR(3 downto 0);
    y5_vhd:	out STD_LOGIC_VECTOR(3 downto 0)   
     );
end;


architecture synth of gates_top is



component gates_sv
port
    (
	a, b: in STD_LOGIC_VECTOR(3 downto 0);
	y1, y2, y3, y4, y5: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component gates_v
port
    (
	a, b: in STD_LOGIC_VECTOR(3 downto 0);
	y1, y2, y3, y4, y5: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component gates_vhd
port
    (
	a, b: in STD_LOGIC_VECTOR(3 downto 0);
	y1, y2, y3, y4, y5: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

    begin

--connect to SystemVerilog
    SV: gates_sv
    port map
    (
    a => a_sv(3 downto 0), 
	b => b_sv(3 downto 0), 
	y1 => y1_sv(3 downto 0),
	y2 => y2_sv(3 downto 0),
	y3 => y3_sv(3 downto 0),
	y4 => y4_sv(3 downto 0),
    y5 => y5_sv(3 downto 0)
    );

--connect to Verilog
    V: gates_v
    port map
     (
     a => a_v(3 downto 0), 
	 b => b_v(3 downto 0), 
     y1 => y1_v(3 downto 0),
	 y2 => y2_v(3 downto 0),
	 y3 => y3_v(3 downto 0),
	 y4 => y4_v(3 downto 0),
     y5 => y5_v(3 downto 0)
     );

--connect to VHDL
    VHDL: gates_vhd
    port map
     (
     a => a_vhd(3 downto 0), 
	 b => b_vhd(3 downto 0),
	 y1 => y1_vhd(3 downto 0),
	 y2 => y2_vhd(3 downto 0),
	 y3 => y3_vhd(3 downto 0),
	 y4 => y4_vhd(3 downto 0),
	 y5 => y5_vhd(3 downto 0)
     );


end;
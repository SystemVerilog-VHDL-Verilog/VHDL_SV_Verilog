library IEEE; use IEEE.STD_LOGIC_1164.all;
entity andN_top is

port
    (
	-- Common signals
    	a:	in STD_LOGIC_VECTOR(7 downto 0);
        --connect to SystemVerilog
        y_sv:	out STD_LOGIC;
        --connect to Verilog
	    y_v:	out STD_LOGIC;
        --connect to VHDL
	    y_vhd:	out STD_LOGIC  
     );
end;


architecture synth of andN_top is



component andN_sv
port
    (
	a: in STD_LOGIC_VECTOR(7 downto 0);
	y: out STD_LOGIC
    );
end component;

component andN_v
port
    (
	a: in STD_LOGIC_VECTOR(7 downto 0);
	y: out STD_LOGIC
    );
end component;

component andN_vhd
port
    (
	a: in STD_LOGIC_VECTOR(7 downto 0);
	y: out STD_LOGIC
    );
end component;

    begin

--connect to SystemVerilog
    SV: andN_sv
    port map
    (
    a => a(7 downto 0), 
    y => y_sv
    );

--connect to Verilog
    V: andN_v
    port map
     (
     a => a(7 downto 0), 
     y => y_v
     );

--connect to VHDL
    VHDL: andN_vhd
    port map
     (
     a => a(7 downto 0), 
     y => y_vhd
     );


end;
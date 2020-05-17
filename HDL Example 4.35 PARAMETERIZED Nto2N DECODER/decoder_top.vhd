library IEEE; use IEEE.STD_LOGIC_1164.all;
entity decoder_top is

port
    (
        --connect to SystemVerilog
    a_sv:	in STD_LOGIC_VECTOR(2 downto 0);
    y_sv:	out STD_LOGIC_VECTOR(7 downto 0);
        --connect to Verilog
    a_v:	in STD_LOGIC_VECTOR(2 downto 0);
    y_v:	out STD_LOGIC_VECTOR(7 downto 0);
        --connect to VHDL
    a_vhd:	in STD_LOGIC_VECTOR(2 downto 0);
    y_vhd:	out STD_LOGIC_VECTOR(7 downto 0)  
     );
end;


architecture synth of decoder_top is



component decoder_sv
port
    (
	a: in STD_LOGIC_VECTOR(2 downto 0);
	y: out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

component decoder_v
port
    (
	a: in STD_LOGIC_VECTOR(2 downto 0);
	y: out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

component decoder_vhd
port
    (
	a: in STD_LOGIC_VECTOR(2 downto 0);
	y: out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

    begin

--connect to SystemVerilog
    SV: decoder_sv
    port map
    (
    a => a_sv(2 downto 0), 
    y => y_sv(7 downto 0)
    );

--connect to Verilog
    V: decoder_v
    port map
     (
     a => a_v(2 downto 0), 
     y => y_v(7 downto 0)
     );

--connect to VHDL
    VHDL: decoder_vhd
    port map
     (
     a => a_vhd(2 downto 0), 
     y => y_vhd(7 downto 0)
     );


end;
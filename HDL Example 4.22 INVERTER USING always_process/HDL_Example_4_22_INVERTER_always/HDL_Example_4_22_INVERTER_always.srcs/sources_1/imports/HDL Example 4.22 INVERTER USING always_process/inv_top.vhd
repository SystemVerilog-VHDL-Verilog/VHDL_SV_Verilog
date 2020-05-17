library IEEE; use IEEE.STD_LOGIC_1164.all;
entity inv_top is

port
    (
        --connect to SystemVerilog
        a_sv:	in STD_LOGIC_VECTOR(3 downto 0);
        y_sv:	out STD_LOGIC_VECTOR(3 downto 0);
        --connect to Verilog
        a_v:	in STD_LOGIC_VECTOR(3 downto 0);
        y_v:	out STD_LOGIC_VECTOR(3 downto 0);
        --connect to VHDL
        a_vhd:	in STD_LOGIC_VECTOR(3 downto 0);
        y_vhd:	out STD_LOGIC_VECTOR(3 downto 0)        
     );
end;


architecture synth of inv_top is


component inv_sv
port
    (
        a: in STD_LOGIC_VECTOR(3 downto 0);
        y: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component inv_v
port
    (
       a: in STD_LOGIC_VECTOR(3 downto 0);
	   y: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component inv_vhd
port
    (
       a: in STD_LOGIC_VECTOR(3 downto 0);
	   y: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

    begin

--connect to SystemVerilog
    SV: inv_sv
    port map
    (
        a => a_sv(3 downto 0), 
        y => y_sv(3 downto 0)
    );

--connect to Verilog
    V: inv_v
    port map
     (
        a => a_v(3 downto 0), 
        y => y_v(3 downto 0)
     );

--connect to VHDL
    VHDL: inv_vhd
    port map
     (
        a => a_vhd(3 downto 0), 
        y => y_vhd(3 downto 0)
     );


end;
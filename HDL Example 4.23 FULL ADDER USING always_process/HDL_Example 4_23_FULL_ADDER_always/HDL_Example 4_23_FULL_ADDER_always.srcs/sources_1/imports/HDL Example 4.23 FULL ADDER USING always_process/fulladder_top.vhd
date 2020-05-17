library IEEE; use IEEE.STD_LOGIC_1164.all;
entity fulladder_top is

port
    (
        --connect to SystemVerilog
	a_sv:		in STD_LOGIC;
	b_sv: 		in STD_LOGIC;
	cin_sv:		in STD_LOGIC;
	s_sv: 		out STD_LOGIC;
	cout_sv:	out STD_LOGIC;
        --connect to Verilog
	a_v:		in STD_LOGIC;
	b_v: 		in STD_LOGIC;
	cin_v:		in STD_LOGIC;
	s_v: 		out STD_LOGIC;
	cout_v:		out STD_LOGIC;
        --connect to VHDL
	a_vhd:		in STD_LOGIC;
	b_vhd: 		in STD_LOGIC;
	cin_vhd:	in STD_LOGIC;
	s_vhd: 		out STD_LOGIC;
	cout_vhd:	out STD_LOGIC
     );
end;

architecture synth of fulladder_top is


component fulladder_sv
port
    (
	a, b, cin: in STD_LOGIC;
	s, cout: out STD_LOGIC
    );
end component;

component fulladder_v
port
    (
	a, b, cin: in STD_LOGIC;
	s, cout: out STD_LOGIC
    );
end component;

component fulladder_vhd
port
    (
	a, b, cin: in STD_LOGIC;
	s, cout: out STD_LOGIC
    );
end component;

    begin

--connect to SystemVerilog
    SV: fulladder_sv
    port map
    (
	a => a_sv, 
	b => b_sv, 
	cin => cin_sv, 
	s => s_sv,
	cout => cout_sv
    );

--connect to Verilog
    V: fulladder_v
    port map
    (
	a => a_v, 
	b => b_v, 
	cin => cin_v, 
	s => s_v,
	cout => cout_v
    );

--connect to VHDL
    VHDL: fulladder_vhd
    port map
    (
	a => a_vhd, 
	b => b_vhd, 
	cin => cin_vhd, 
	s => s_vhd,
	cout => cout_vhd
    );


end;
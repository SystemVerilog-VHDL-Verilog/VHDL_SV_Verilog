library IEEE; use IEEE.STD_LOGIC_1164.all;
entity priority_casez_top is

port
    (
        --connect to SystemVerilog
	a_sv: in STD_LOGIC_VECTOR(3 downto 0);
	y_sv: out STD_LOGIC_VECTOR(3 downto 0);
        --connect to Verilog
	a_v: in STD_LOGIC_VECTOR(3 downto 0);
	y_v: out STD_LOGIC_VECTOR(3 downto 0)--;
        --connect to VHDL
--	a_vhd: in STD_LOGIC_VECTOR(3 downto 0);
--	y_vhd: out STD_LOGIC_VECTOR(3 downto 0)
     );
end;

architecture synth of priority_casez_top is


component priority_casez_sv
port
    (
	a: in STD_LOGIC_VECTOR(3 downto 0);
	y: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component priority_casez_v
port
    (
	a: in STD_LOGIC_VECTOR(3 downto 0);
	y: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

--component priority_casez_vhd
--port
--    (
--	a: in STD_LOGIC_VECTOR(3 downto 0);
--	y: out STD_LOGIC_VECTOR(3 downto 0)
--    );
--end component;

begin

--connect to SystemVerilog
    SV: priority_casez_sv
    port map
    (
	a => a_sv, 
	y => y_sv
    );

--connect to Verilog
    V: priority_casez_v
    port map
     (
	a => a_v, 
	y => y_v
     );

----connect to VHDL
--    VHDL: priority_casez_vhd
--    port map
--     (
--	a => a_vhd, 
--	y => y_vhd
--     );


end;
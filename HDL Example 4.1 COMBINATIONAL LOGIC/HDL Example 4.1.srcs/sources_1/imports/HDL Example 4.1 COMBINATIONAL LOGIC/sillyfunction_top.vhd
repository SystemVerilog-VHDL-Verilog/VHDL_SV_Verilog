library IEEE; use IEEE.STD_LOGIC_1164.all;
entity sillyfunction_top is

port
    (
        --connect to SystemVerilog
        a_sv, b_sv, c_sv: in STD_LOGIC;
        y_sv: out STD_LOGIC;
        --connect to Verilog
        a_v, b_v, c_v: in STD_LOGIC;
        y_v: out STD_LOGIC;
        --connect to VHDL
        a_vhd, b_vhd, c_vhd: in STD_LOGIC;
        y_vhd: out STD_LOGIC        
     );
end;


architecture synth of sillyfunction_top is

component sillyfunction_sv
port
    (
        a, b, c: in STD_LOGIC;
        y: out STD_LOGIC
    );
end component;

component sillyfunction_v
port
    (
        a, b, c: in STD_LOGIC;
        y: out STD_LOGIC
    );
end component;

component sillyfunction_vhd
port
    (
        a, b, c: in STD_LOGIC;
        y: out STD_LOGIC
    );
end component;

    begin

--connect to SystemVerilog
    SV: sillyfunction_sv
    port map
    (
        a => a_sv, 
        b => b_sv, 
        c => c_sv,
        y => y_sv
        );

--connect to Verilog
    V: sillyfunction_v
    port map
    (
        a => a_v, 
        b => b_v, 
        c => c_v,
        y => y_v
        );

--connect to VHDL
    VHDL: sillyfunction_vhd
    port map
    (
        a => a_vhd, 
        b => b_vhd, 
        c => c_vhd,
        y => y_vhd
        );


end;
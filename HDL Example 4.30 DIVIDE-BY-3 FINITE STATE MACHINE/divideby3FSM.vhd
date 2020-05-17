library IEEE; use IEEE.STD_LOGIC_1164.all;
entity divideby3FSM_vhd is
port
(
	reset  : in STD_LOGIC;
	clk    : in STD_LOGIC;
	y      : out STD_LOGIC
);
end;

architecture synth of divideby3FSM_vhd is
type statetype is (S0, S1, S2);
signal state, nextstate: statetype;

begin
-- state register
process(clk, reset) 
begin
	--if reset then -- VHDL 2008 [XSIM 43-4187] HDL Example 4.30 DIVIDE-BY-3 FINITE STATE MACHINE/divideby3FSM.vhd" Line 19 : The "Vhdl 2008 Condition Operator" is not supported yet for simulation.
    if reset = '1' then -- VHDL 
		state <= S0;
	elsif rising_edge(clk) then
		state <= nextstate;
	end if;
end process;

-- next state logic
nextstate <= S1 when state = S0 else
	     S2 when state = S1 else
	     S0;

-- output logic
y <= '1' when state = S0 else '0';

end;
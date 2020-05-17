-- The daughter snail smiles whenever she slides over the pattern 1101 or the pattern 1110.
library IEEE; use IEEE.STD_LOGIC_1164.all;
entity patternMoore_vhd is
port 
(
	reset	: in STD_LOGIC;
	clk	: in STD_LOGIC;
	a	: in STD_LOGIC;
	y	: out STD_LOGIC
);
end;

architecture synth of patternMoore_vhd is
type statetype is (S0, S1, S2, S3, S4);
signal state, nextstate: statetype;

begin
-- state register
process (clk, reset) begin
	if reset = '1' then 
		state <= S0;
	elsif clk'event and clk = '1' then
		state <= nextstate;
	end if;
end process;

-- next state logic
process (state, a) begin
-- process(all) begin
case state is
when S0 => 
	if a = '1' then
		nextstate <= S1;
	else 
		nextstate <= S0;
	end if;
when S1 => 
	if a = '1' then
		nextstate <= S2;
	else 
		nextstate <= S0;
	end if;
when S2 => 
	if a = '1' then
		nextstate <= S2;
	else 
		nextstate <= S3;
	end if;
when S3 => 
	if a = '1' then
		nextstate <= S4;
	else 
		nextstate <= S0;
	end if;
when S4 => 
	if a = '1' then
		nextstate <= S2;
	else 
		nextstate <= S0;
	end if;
when others => 
	nextstate <= S0;
end case;
end process;

-- output logic
y <= '1' when state = S4 else '0';
end;
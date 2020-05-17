--The daughter snail smiles whenever she slides over the pattern 1101.
library IEEE; use IEEE.STD_LOGIC_1164.all;
entity patternMealy_vhd is
port
(
	reset	: in STD_LOGIC;
	clk	: in STD_LOGIC;
	a	: in STD_LOGIC;
	y	: out STD_LOGIC
);
end;

architecture synth of patternMealy_vhd is
type statetype is (S0, S1, S2, S3);
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
process(state, a) begin
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
				nextstate <= S1;
			else 
				nextstate <= S0;
			end if;
		when others => 
				nextstate <= S0;
	end case;
end process;

-- output logic
y <= '1' when (a = '1' and state = S3) else '0';
end;
library IEEE; use IEEE.STD_LOGIC_1164.all;
entity priority_vhd is

port
(
	a: in STD_LOGIC_VECTOR(3 downto 0);
	y: out STD_LOGIC_VECTOR(3 downto 0)
);
end;

architecture synth of priority_vhd is

begin
--process(all) begin -- VHDL 2008, but --The Condition Operator is not supported yet for simulation (Vivado 2019.1.1)
--process (a) begin
--	    if 	  a(3) then y <= "1000";
--		elsif a(2) then y <= "0100";
--		elsif a(1) then y <= "0010";
--		elsif a(0) then y <= "0001";
--		else 		y <= "0000";
--	end if;

process (a) begin
	    if 	  a(3) = '1' then y <= "1000";
		elsif a(2) = '1' then y <= "0100";
		elsif a(1) = '1' then y <= "0010";
		elsif a(0) = '1' then y <= "0001";
		else 		          y <= "0000";
	end if;
end process;
end;
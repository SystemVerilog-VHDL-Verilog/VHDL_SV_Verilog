library IEEE; use IEEE.STD_LOGIC_1164.all;
entity priority_casez_vhd is
port
(
	a: in STD_LOGIC_VECTOR(3 downto 0);
	y: out STD_LOGIC_VECTOR(3 downto 0)
);
end;

architecture dontcare of priority_casez_vhd is

begin
process(all) begin
	--casez a is -- Wrong syntacs
	--case a is -- wrong design
	case? a is -- VHDL 2008 Passed the synthesis, implementation, but not supported in Xilinx simulation tools
--ERROR: [XSIM 43-4187] File "C:/Zynq_Book/VHDL_SV_Verilog/HDL Example 4.27 PRIORITY CIRCUIT USING casez/HDL Example 4_27 PRIORITY CIRCUIT USING casez.srcs/sources_1/imports/HDL Example 4.27 PRIORITY CIRCUIT USING casez/priority_casez.vhd" Line 16 : The "Vhdl 2008 Matching Case Statement" is not supported yet for simulation.

		when "1---" => 
		  y <= "1000";
		when "01--" => 
		  y <= "0100";
		when "001-" => 
		  y <= "0010";
		when "0001" => 
		  y <= "0001";
		when others => 
		  y <= "0000";
	--end casez;
	--end case;
	end case?;
end process;
end;
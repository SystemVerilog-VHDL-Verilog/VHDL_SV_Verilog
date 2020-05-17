module TB_HDL_Example_4_30();

//signals for TB
logic reset;
logic clk;

logic y_sv;
logic y_v;
logic y_vhd;



// instantiate device under test
divideby3FSM_top dut
(
	reset,	
	clk,
	y_sv,
	y_v,
	y_vhd
);

// generate clock
always
	begin
		clk = 1; #5; clk = 0; #5;
	end
// at start of test, load vectors

// apply inputs one at a time
initial begin

reset = 1; #10;
reset = 0; #10;





end
endmodule
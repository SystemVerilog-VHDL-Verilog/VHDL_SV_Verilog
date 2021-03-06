module TB_HDL_Example_4_20();
//signals for DUT

// common signals 
logic clk;
logic d_in;


// instantiate device under test
sync_top dut
(
	clk,
	d_in,
	q_sv,
	q_v,
	q_vhd
);


// generate clock
always
	begin
		clk = 1; #10; clk = 0; #10;
	end

always
	begin
		d_in = 1; #9; d_in = 0; #9;
	end	
	
// the simulation made for SystemVerilog only

endmodule


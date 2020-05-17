module TB_HDL_Example_4_32b();

logic y_sv;
logic y_v;
logic y_vhd;

//signals for TB
logic reset;
logic clk;
logic a;



// instantiate device under test
patternMealy_top dut
(
	reset,	
	clk,
	a, 
	y_sv,
	y_v,
	y_vhd
);

//// generate clock
always
	begin
		clk = 0; #5; clk = 1; #5;
	end

// apply inputs one at a time
initial begin

a = 0; reset = 1;  #5;
a = 0; reset = 1;  #10;
a = 0; reset = 0;  #10;
a = 0;  #10;
a = 0;  #10;
a = 0;  #10;
a = 0;  #10;
a = 0;  #10;
a = 0;  #10;
a = 1;  #10;
a = 0;  #10;
a = 0;  #10;
a = 1;  #10;
a = 0;  #10;
a = 0;  #10;
a = 0;  #10;
a = 1;  #10;
a = 1;  #10;
a = 0;  #10;
a = 1;  #10;
a = 0;  #10;
a = 0;  #10;
a = 0;  #10;
a = 1;  #10;
a = 0;  #10;
a = 1;  #10;
a = 0;  #10;
a = 1;  #10;
a = 1;  #10;
a = 0;  #10;
a = 0;  #10;
a = 1;  #10;
a = 1;  #10;
a = 1;  #10;
a = 1;  #10;
a = 0;  #10;
a = 0;  #10;
a = 0;  #10;
a = 1;  #10;
a = 0;  #10;
a = 0;  #10;
a = 1;  #10;
a = 1;  #10;
a = 0;  #10;
a = 1;  #10;
a = 0;  #10;
a = 1;  #10;
a = 0;  #10;
a = 1;  #10;
a = 1;  #10;
a = 1;  #10;
a = 1;  #10;
a = 0;  #10;
a = 0;  #10;
a = 1;  #10;
a = 1;  #10;
a = 0;  #10;
a = 1;  #10;
a = 1;  #10;
a = 1;  #10;
a = 1;  #10;
a = 0;  #10;
a = 1;  #10;
a = 1;  #10;
a = 1;  #10;
a = 1;  #10;



end

endmodule
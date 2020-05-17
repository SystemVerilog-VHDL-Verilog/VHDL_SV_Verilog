module TB_HDL_Example_4_21_Latches_Do_not_do_that();
//signals for DUT
// common signals 
logic clk;
logic [3:0] d_in;

logic [3:0] q_sv;
logic [3:0] q_v;
logic [3:0] q_vhd;

//signals for TB
//logic [3:0] y_yexpected;
logic [31:0] vectornum; //errors;
logic [3:0] testvectors[16:0];
logic [3:0] test_net;

logic clk_TB;


// instantiate device under test
Latch_top dut
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
		clk_TB = 1; #3; clk_TB = 0; #3;
	end

	
// at start of test, load vectors
initial
	begin
		$readmemh("InputData.bin", testvectors);//hex
		//$readmemb("InputData.bin", testvectors);//bin
		vectornum = 0;// errors = 0;
		test_net = testvectors[vectornum];
	end


always @(negedge clk_TB)
    begin
	{d_in} = testvectors[vectornum];
	vectornum = vectornum + 1;
	test_net = testvectors[vectornum];
    end


endmodule


module TB_HDL_Example_4_27();
//signals for DUT
logic [3:0] a_sv;
logic [3:0] y_sv;
logic [3:0] a_v;
logic [3:0] y_v;
//ERROR: [XSIM 43-4187] File "C:/Zynq_Book/VHDL_SV_Verilog/HDL Example 4.27 PRIORITY CIRCUIT USING casez/HDL Example 4_27 PRIORITY CIRCUIT USING casez.srcs/sources_1/imports/HDL Example 4.27 PRIORITY CIRCUIT USING casez/priority_casez.vhd" Line 16 : The "Vhdl 2008 Matching Case Statement" is not supported yet for simulation.
//logic [3:0] a_vhd;
//logic [3:0] y_vhd;

//signals for TB
logic clk;//, reset;
logic [3:0]  output_yexpected;
logic [31:0] vectornum, errors;

logic [3:0] input_test_vectors[17:0];
logic [3:0] output_test_vectors[17:0];

//logic [3:0] testvectors[15:0];
//logic [3:0] test_net;


// instantiate device under test
priority_casez_top dut
(
	a_sv, y_sv,
	a_v, y_v
	//a_vhd, y_vhd
);


// generate clock
always
	begin
		clk = 1; #5; clk = 0; #5;
	end
// at start of test, load vectors

initial
	begin
		//$readmemh("input_stimulus.bin", input_test_vectors);//hex
		$readmemb("input_stimulus.bin", input_test_vectors);//hex	
		$readmemb("expected_outputs.bin", output_test_vectors);//bin
		vectornum = 0; 
		errors = 0;
	end

// apply test vectors on rising edge of clk
always @(posedge clk)
	begin
		//#1; 
		{a_sv} 				= input_test_vectors[vectornum];
		{a_v} 				= input_test_vectors[vectornum];
		//{a_vhd} 			= input_test_vectors[vectornum];
		{output_yexpected} 	= output_test_vectors[vectornum];
	end

// check results on falling edge of clk
always @(negedge clk)
	begin
		if (y_sv !== output_yexpected) 
			begin // check result
				$display("Error: inputs = %h", {y_sv});
				$display(" outputs = %b (%b y_sv)", y_sv, output_yexpected);
				errors = errors + 1; 
			end  
	 
			vectornum = vectornum + 1;
			//test_net = testvectors[vectornum];

		if (input_test_vectors[vectornum] === 3'bZZZ) 
			begin
				$display("%d tests completed with %d errors", vectornum, errors);
				//$finish;
			end

	end
endmodule


module TB_HDL_Example_4_32a();

logic y_sv;
logic y_v;
logic y_vhd;

//signals for TB
logic reset;
logic clk;
logic a;
logic output_yexpected;
logic [31:0] vectornum, errors;

logic input_test_vectors[71:0];
logic output_test_vectors[71:0];


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

// generate clock
always
	begin
		clk = 0; #5; clk = 1; #5;
	end

// at start of test, load vectors
initial
	begin
		//$readmemh("input_stimulus.bin", input_test_vectors);//hex
		$readmemb("input_stimulus.bin", input_test_vectors);//bin	
		$readmemb("expected_outputs.bin", output_test_vectors);//bin
		vectornum = 0; 
		errors = 0;
		reset = 1; #10;
		reset = 0; 
	end

// apply test vectors on rising edge of clk
always @(posedge clk)
	begin
		{a} 			= input_test_vectors[vectornum];
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

	end

endmodule
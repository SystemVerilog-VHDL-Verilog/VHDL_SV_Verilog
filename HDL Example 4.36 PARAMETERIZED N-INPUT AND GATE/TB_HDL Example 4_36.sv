module TB_HDL_Example_4_36();

logic [7:0] a_input_data;

logic y_sv;
logic y_v;
logic y_vhd;

//signals for TB
logic clk;
logic output_yexpected;
logic [31:0] vectornum, errors;

logic [7:0] input_test_vectors[256:0];
logic output_test_vectors[10:0];


// instantiate device under test
//andN_top dut
//(
//	a_input_data, 
//	y_sv,
//	y_v,
//	y_vhd
//);

// alternate connection entry
andN_top dut
(
	.a(a_input_data),
	.y_sv(y_sv),
	.y_v(y_v),
	.y_vhd(y_vhd)
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
		$readmemh("input_stimulus.bin", input_test_vectors);//hex	
		//$readmemb("expected_outputs.bin", output_test_vectors);//bin
		vectornum = 0; 
		errors = 0;
		 #10;
	end

// apply test vectors on rising edge of clk
always @(posedge clk)
	begin
		{a_input_data} 			= input_test_vectors[vectornum];
		//{output_yexpected} 	= output_test_vectors[vectornum];
	end

// check results on falling edge of clk
always @(negedge clk)
	begin
		if (y_sv !== y_v) 
			begin // check result
				$display("Error: inputs = %h", {y_sv});
				$display(" outputs = %b (%b y_sv)", y_sv, y_v);
				errors = errors + 1; 
			end  


		if (y_sv !== y_vhd) 
			begin // check result
				$display("Error: inputs = %h", {y_sv});
				$display(" outputs = %b (%b y_sv)", y_sv, y_vhd);
				errors = errors + 1; 
			end  


		if (y_v !== y_vhd) 
			begin // check result
				$display("Error: inputs = %h", {y_sv});
				$display(" outputs = %b (%b y_sv)", y_sv, y_vhd);
				errors = errors + 1; 
			end  

	 
			vectornum = vectornum + 1;
			//test_net = testvectors[vectornum];

	end

endmodule
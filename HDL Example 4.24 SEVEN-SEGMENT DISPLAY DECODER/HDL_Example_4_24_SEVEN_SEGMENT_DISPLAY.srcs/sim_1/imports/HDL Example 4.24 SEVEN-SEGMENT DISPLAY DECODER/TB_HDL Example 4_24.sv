module TB_HDL_Example_4_24();
//signals for DUT
logic [3:0] data_sv;
logic [6:0] segments_sv;
logic [3:0] data_v;
logic [6:0] segments_v;
logic [3:0] data_vhd;
logic [6:0] segments_vhd;

//signals for TB
logic clk;//, reset;
logic [6:0]  output_yexpected;
logic [31:0] vectornum, errors;

logic [3:0] input_test_vectors[15:0];
logic [6:0] output_test_vectors[15:0];

//logic [3:0] testvectors[15:0];
//logic [3:0] test_net;


// instantiate device under test
sevenseg_top dut
(
	data_sv, segments_sv,
	data_v, segments_v,
	data_vhd, segments_vhd
);


// generate clock
always
	begin
		clk = 1; #5; clk = 0; #5;
	end
// at start of test, load vectors

initial
	begin
		$readmemh("input_stimulus.bin", input_test_vectors);//hex		
		$readmemb("expected_outputs.bin", output_test_vectors);//bin
		vectornum = 0; 
		errors = 0;
	end

// apply test vectors on rising edge of clk
always @(posedge clk)
	begin
		//#1; 
		{data_sv} 		= input_test_vectors[vectornum];
		{data_v} 		= input_test_vectors[vectornum];
		{data_vhd} 		= input_test_vectors[vectornum];
		{output_yexpected} 	= output_test_vectors[vectornum];
	end

// check results on falling edge of clk
always @(negedge clk)
	begin
		if (segments_sv !== output_yexpected) 
			begin // check result
				$display("Error: inputs = %h", {segments_sv});
				$display(" outputs = %b (%b segments_sv)", segments_sv, output_yexpected);
				errors = errors + 1; 
			end  
	 
			vectornum = vectornum + 1;
			//test_net = testvectors[vectornum];

		if (input_test_vectors[vectornum] === 4'bzzzz) 
			begin
				$display("%d tests completed with %d errors", vectornum, errors);
				//$finish;
			end

	end
endmodule


module TB_HDL_Example_4_33b();
//signals for DUT
logic [3:0] a_sv;
logic [3:0] b_sv;
logic [7:0] y_sv;

logic [3:0] a_v;
logic [3:0] b_v;
logic [7:0] y_v;

logic [3:0] a_vhd;
logic [3:0] b_vhd;
logic [7:0] y_vhd;

//signals for TB
logic clk;//, reset;
logic [7:0]  output_yexpected;
logic [3:0] vectornum_index_a;
logic [3:0] vectornum_index_b;
logic [7:0] vectornum_index_y;
logic [31:0] vectornum, errors;

logic [3:0] input_test_vectors[15:0];
logic [7:0] output_test_vectors[255:0];

//logic [3:0] testvectors[15:0];
//logic [3:0] test_net;


// instantiate device under test
multiplier_top dut
(
	a_sv, b_sv, y_sv,
	a_v, b_v, y_v,
	a_vhd, b_vhd, y_vhd
);


// generate clock
always
	begin
		clk = 1; #5; clk = 0; #5;
	end
// at start of test, load vectors

initial
	begin
		//$readmemb("input_stimulus.bin", input_test_vectors);//bin
		$readmemh("input_stimulus.bin", input_test_vectors);//hex	
		$readmemh("expected_outputs.bin", output_test_vectors);//hex

		vectornum_index_a = 0; 
		vectornum_index_b = 0; 
		vectornum_index_y = 0; 
		errors = 0;
	end

// apply test vectors on rising edge of clk
always @(posedge clk)
	begin
		//#1; 
		{a_sv} 			= input_test_vectors[vectornum_index_a];
		{b_sv} 			= input_test_vectors[vectornum_index_b];
		
		{a_v} 			= input_test_vectors[vectornum_index_a];
		{b_v} 			= input_test_vectors[vectornum_index_b];
		
		{a_vhd} 		= input_test_vectors[vectornum_index_a];
		{b_vhd} 		= input_test_vectors[vectornum_index_b];
		
		{output_yexpected} 	= output_test_vectors[vectornum_index_y];
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

//		//if (vectornum_index_a <= 4'b1111)//less than or equal to
//		if (vectornum_index_a < 4'b1111)//less than or equal to  
//			begin
//				vectornum_index_a = vectornum_index_a + 1;
//			end
//		else
//		    begin
//				vectornum_index_a = 4'b0000;
//			end

        vectornum_index_a = vectornum_index_y[3:0];
        vectornum_index_b = vectornum_index_y[7:4];
		vectornum_index_y = vectornum_index_y + 1;

		if (vectornum_index_y === 8'b11111111) 
			begin
				$display("%d tests completed with %d errors", vectornum, errors);
				//$finish;
			end

	end
	
//	always @(negedge clk)
//	begin
//			if (vectornum_index_a ==  4'b1111) //parenthesis needed
//			begin
//				if (vectornum_index_b < 4'b1111)
//					begin				
//						vectornum_index_b = vectornum_index_b + 1;
//					end
//			end
//	end
	
endmodule


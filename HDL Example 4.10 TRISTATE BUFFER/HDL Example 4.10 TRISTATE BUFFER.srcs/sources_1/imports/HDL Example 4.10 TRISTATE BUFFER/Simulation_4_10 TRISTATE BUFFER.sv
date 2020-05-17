module TB_HDL_Example_4_7();
//signals for DUT
logic [3:0] a_sv;
logic en_sv;
logic [3:0] y_sv;

logic [3:0] a_v;
logic en_v;
logic [3:0] y_v;

logic [3:0] a_vhd; 
logic en_vhd;
logic [3:0] y_vhd;


//signals for TB
logic clk;//, reset;
logic [3:0] y_yexpected;
logic [31:0] vectornum, errors;
logic [8:0] testvectors[15:0];
logic [8:0] test_net;


// instantiate device under test
tristate_top dut
(
	a_sv, en_sv, y_sv,
	a_v, en_v, y_v,
	a_vhd, en_vhd, y_vhd
);


// generate clock
always
	begin
		clk = 1; #5; clk = 0; #5;
	end
// at start of test, load vectors
// and pulse reset
initial
	begin
		//$readmemh("InputData.bin", testvectors);//hex
		$readmemb("InputData.bin", testvectors);//bin
		vectornum = 0; errors = 0;
		test_net = testvectors[vectornum];
		//reset = 1; #27; reset = 0;
	end

// apply test vectors on rising edge of clk
always @(posedge clk)
	begin
		//#1; 
		{a_sv, en_sv, y_yexpected} = testvectors[vectornum];
		{a_v, en_v, y_yexpected} = testvectors[vectornum];
		{a_vhd, en_vhd, y_yexpected} = testvectors[vectornum];
	end

// check results on falling edge of clk
//always @(negedge clk)
//    begin
//	//if (~reset) begin // skip during reset
//     if (y_sv !== y_yexpected)
//        begin // check result
//			$display("Error: inputs = %b", {a_sv, en_sv, y_sv});
//			$display(" outputs = %b (%b expected)", y_sv, y_yexpected);
//			errors = errors + 1; 
//		end  
	 
//	 vectornum = vectornum + 1;
//	 test_net = testvectors[vectornum];
		
//		//if (testvectors[vectornum] === 4'bx) begin
//		if (testvectors[vectornum] === 9'b11110zzzz) begin
//			$display("%d tests completed with %d errors", vectornum, errors);
//			//$finish;
//		end

//	end
endmodule


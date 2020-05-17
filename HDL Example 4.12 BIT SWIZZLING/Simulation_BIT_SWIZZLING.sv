module TB_HDL_Example_4_12();
//signals for DUT
logic [4:0] C_sv;
logic [4:0] D_sv;
logic [8:0] Y_sv;

logic [4:0] C_v;
logic [4:0] D_v;
logic [8:0] Y_v;

logic [4:0] C_vhd;
logic [4:0] D_vhd;
logic [8:0] Y_vhd;


//signals for TB
logic clk;//, reset;
logic [8:0] y_yexpected;
logic [31:0] vectornum, errors;
logic [17:0] testvectors[20:0];
logic [15:0] test_net;


// instantiate device under test
BIT_SWIZZLING_top dut
(
	C_sv, D_sv, Y_sv,
	C_v, D_v, Y_v,
	C_vhd, D_vhd, Y_vhd
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
		{C_sv,  D_sv,  y_yexpected} = testvectors[vectornum];
		{C_v,   D_v,   y_yexpected} = testvectors[vectornum];
		{C_vhd, D_vhd, y_yexpected} = testvectors[vectornum];
	end

// check results on falling edge of clk
always @(negedge clk)
    begin
	//if (~reset) begin // skip during reset
     if (Y_sv !== y_yexpected)
        begin // check result
			$display("Error: inputs = %b", {C_sv, D_sv, Y_sv});
			$display(" outputs = %b (%b expected)", Y_sv, y_yexpected);
			errors = errors + 1; 
		end  
	 
	 vectornum = vectornum + 1;
	 test_net = testvectors[vectornum];
		
//		//if (testvectors[vectornum] === 4'bx) begin
//		if (testvectors[vectornum] === 9'b11110zzzz) begin
//			$display("%d tests completed with %d errors", vectornum, errors);
//			//$finish;
//		end

	end
endmodule


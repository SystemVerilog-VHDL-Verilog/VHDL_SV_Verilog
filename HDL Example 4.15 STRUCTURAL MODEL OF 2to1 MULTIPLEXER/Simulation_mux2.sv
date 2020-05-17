module TB_HDL_Example_4_15();
//signals for DUT
logic [3:0] d0_sv;
logic [3:0] d1_sv;
logic  s_sv;
logic [3:0] y_sv;

logic [3:0] d0_v;
logic [3:0] d1_v;
logic  s_v;
logic [3:0] y_v;

logic [3:0] d0_vhd;
logic [3:0] d1_vhd;
logic s_vhd;
logic [3:0] y_vhd;


//signals for TB
logic clk;//, reset;
logic [3:0] y_yexpected;
logic [31:0] vectornum, errors;
logic [14:0] testvectors[10:0];
logic [14:0] test_net;


// instantiate device under test
mux2_top dut
(
	d0_sv, d1_sv,
	s_sv,
	y_sv,
	
	d0_v, d1_v,
	s_v,
	y_v,
	
	d0_vhd, d1_vhd,
	s_vhd,
	y_vhd
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
		{d0_sv, d1_sv, s_sv, y_yexpected} = testvectors[vectornum];
		{d0_v, d1_v, s_v, y_yexpected} = testvectors[vectornum];
		{d0_vhd, d1_vhd, s_vhd, y_yexpected} = testvectors[vectornum];
	end

// check results on falling edge of clk
always @(negedge clk)
    begin
	//if (~reset) begin // skip during reset
     if (y_sv !== y_yexpected)
        begin // check result
			$display("Error: inputs = %b", {d0_sv, d1_sv, s_sv});
			$display(" outputs = %b (%b expected)", y_sv, y_yexpected);
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

// the simulation made for SystemVerilog only

endmodule


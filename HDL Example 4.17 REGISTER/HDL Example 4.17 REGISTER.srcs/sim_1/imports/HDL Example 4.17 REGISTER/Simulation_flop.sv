module TB_HDL_Example_4_17();
//signals for DUT
logic clk_sv;
logic [3:0] d_sv;
logic [3:0] q_sv;

logic clk_v;
logic [3:0] d_v;
logic [3:0] q_v;

logic clk_vhd;
logic [3:0] d_vhd;
logic [3:0] q_vhd;


//signals for TB
logic clk;//, reset;
logic [3:0] y_yexpected;
logic [31:0] vectornum, errors;
logic [7:0] testvectors[16:0];
logic [7:0] test_net;


// instantiate device under test
flop_top dut
(
	clk_sv,
	d_sv,
	q_sv,
	
	clk_v,
	d_v,
	q_v,
	
	clk_vhd,
	d_vhd,
	q_vhd
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
		$readmemh("InputData.bin", testvectors);//hex
		//$readmemb("InputData.bin", testvectors);//bin
		vectornum = 0; errors = 0;
		test_net = testvectors[vectornum];
		//reset = 1; #27; reset = 0;
	end

assign  clk_sv = clk;
assign  clk_v = clk;
assign  clk_vhd = clk;

// apply test vectors on rising edge of clk
always @(posedge clk)
	begin
		//#1; 
		{d_sv, y_yexpected} = testvectors[vectornum];
		{d_v, y_yexpected} = testvectors[vectornum];
		{d_vhd, y_yexpected} = testvectors[vectornum];
	end


// check results on falling edge of clk
always @(negedge clk)
    begin
	//if (~reset) begin // skip during reset
     if (q_sv !== y_yexpected)
        begin // check result
			$display("Error: inputs = %b", {d_sv});
			$display(" outputs = %b (%b expected)", q_sv, y_yexpected);
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


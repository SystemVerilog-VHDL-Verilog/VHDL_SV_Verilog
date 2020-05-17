module TB_HDL_Example_4_19();
//signals for DUT
// common signals 
logic clk;
logic reset;
logic enable;
logic [3:0] data_in;

logic [3:0] q_sv;
logic [3:0] q_v;
logic [3:0] q_vhd;

//signals for TB
logic [3:0] y_yexpected;
logic [31:0] vectornum, errors;
logic [3:0] testvectors[16:0];
logic [3:0] test_net;


// instantiate device under test
flopenr_top dut
(
	clk,
	reset,
	enable,
	data_in,
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
		enable = 1; #100; enable = 0; #50;
	end	
	
// at start of test, load vectors
// and pulse reset
initial
	begin
		$readmemh("InputData.bin", testvectors);//hex
		//$readmemb("InputData.bin", testvectors);//bin
		vectornum = 0; errors = 0;
		test_net = testvectors[vectornum];
		reset = 1; #2; 
		reset = 0; #50;
		reset = 1; #7; 
		reset = 0; #22;
	end


// apply test vectors on rising edge of clk
always @(posedge clk)
	begin
		//#1; 
		{data_in} = testvectors[vectornum];
		{y_yexpected} = testvectors[vectornum];
		//{d_vhd, y_yexpected} = testvectors[vectornum];
	end


// check results on falling edge of clk
always @(negedge clk)
    begin
	//if (~reset) begin // skip during reset
     if (q_sv !== y_yexpected)
        begin // check result
			$display("Error: inputs = %b", {data_in});
			$display(" outputs = %b (%b expected)", data_in, y_yexpected);
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


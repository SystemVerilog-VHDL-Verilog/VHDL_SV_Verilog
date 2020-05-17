module TB_HDL_Example_4_17();
//signals for DUT
// common signals 
logic clk;
logic reset;
logic [3:0] data_in;

logic [3:0] q_a_sv;
logic [3:0] q_s_sv;

logic [3:0] q_a_v;
logic [3:0] q_s_v;

logic [3:0] q_a_vhd;
logic [3:0] q_s_vhd;


//signals for TB
logic [3:0] y_yexpected;
logic [31:0] vectornum, errors;
logic [3:0] testvectors[16:0];
logic [3:0] test_net;


// instantiate device under test
flopr_top dut
(
	clk,
	reset,
	data_in,

	q_a_sv,
	q_s_sv,
	
	q_a_v,
	q_s_v,

	q_a_vhd,
	q_s_vhd
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
		reset = 1; #2; 
		reset = 0; #22;
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
     if (q_a_sv !== y_yexpected)
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


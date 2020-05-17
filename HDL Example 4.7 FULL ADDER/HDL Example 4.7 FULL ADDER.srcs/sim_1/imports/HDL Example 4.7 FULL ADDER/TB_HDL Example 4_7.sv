module TB_HDL_Example_4_7();
//signals for DUT
logic a_sv, b_sv, cin_sv;
logic s_sv, cout_sv;
logic a_v, b_v, cin_v;
logic s_v, cout_v;
logic a_vhd, b_vhd, cin_vhd;
logic s_vhd, cout_vhd;

//signals for TB
logic clk;//, reset;
logic s_yexpected, cout_yexpected;
logic [31:0] vectornum, errors;
logic [4:0] testvectors[15:0];
logic [4:0] test_net;


// instantiate device under test
fulladder_top dut
(
	a_sv, b_sv, cin_sv, s_sv, cout_sv,
	a_v, b_v, cin_v, s_v, cout_v,
	a_vhd, b_vhd, cin_vhd, s_vhd, cout_vhd
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
		//$readmemh("example.tv", testvectors);//hex
		//$readmemb("C:\Zynq_Book\VHDL_SV_Verilog\HDL Example 4.7 FULL ADDER\HDL Example 4.7 FULL ADDER.srcs\sim_1\imports\HDL Example 4.7 FULL ADDER\example.tv", testvectors);//bin
		$readmemb("example.bin", testvectors);//bin
		vectornum = 0; errors = 0;
		test_net = testvectors[vectornum];
		//reset = 1; #27; reset = 0;
	end

// apply test vectors on rising edge of clk
always @(posedge clk)
	begin
		//#1; 
		{a_sv, b_sv, cin_sv, s_yexpected, cout_yexpected} = testvectors[vectornum];
		{a_v, b_v, cin_v, s_yexpected, cout_yexpected} = testvectors[vectornum];
		{a_vhd, b_vhd, cin_vhd, s_yexpected, cout_yexpected} = testvectors[vectornum];
	end

// check results on falling edge of clk
always @(negedge clk)
    begin
	//if (~reset) begin // skip during reset
     if ((s_sv !== s_yexpected) | (cout_sv !== cout_yexpected))
        begin // check result
			$display("Error: inputs = %b", {a_sv, b_sv, cin_sv});
			$display(" outputs = %b (%b expected)", s_sv, s_yexpected);
			errors = errors + 1; 
		end  
	 
	 vectornum = vectornum + 1;
	 test_net = testvectors[vectornum];
		
//		if (cout_sv !== cout_yexpected) 
//		begin // check result
//			$display("Error: inputs = %b", {a_sv, b_sv, cin_sv});
//			$display(" outputs = %b (%b expected)", cout_sv, cout_yexpected);
//			errors = errors + 1;
//		end

		//if (testvectors[vectornum] === 4'bx) begin
		if (testvectors[vectornum] === 5'b11100) begin
			$display("%d tests completed with %d errors", vectornum, errors);
			//$finish;
		end

	end
endmodule


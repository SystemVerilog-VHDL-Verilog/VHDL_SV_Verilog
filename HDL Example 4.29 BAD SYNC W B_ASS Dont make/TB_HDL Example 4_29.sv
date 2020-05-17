module TB_HDL_Example_4_29();

//signals for TB
logic d;
logic clk;

logic q_sv;
logic q_v;
logic q_vhd;



// instantiate device under test
syncbad_top dut
(
	clk,
	d, 
	q_sv,
	q_v,
	q_vhd
);

// apply inputs one at a time
initial begin

clk = 0; d = 0; #10;
clk = 0; d = 1; #10;
clk = 0; d = 0; #10;
clk = 0; d = 1; #10;

clk = 1; d = 0; #10;
clk = 0; d = 0; #10;
clk = 1; d = 0; #10;
clk = 0; d = 0; #10;

clk = 1; d = 1; #10;
clk = 1; d = 0; #10;
clk = 1; d = 1; #10;
clk = 1; d = 0; #10;
clk = 1; d = 1; #10;
clk = 1; d = 1; #10;
clk = 1; d = 0; #10;
clk = 1; d = 1; #10;
clk = 1; d = 1; #10;

clk = 1; d = 1; #10;
clk = 1; d = 0; #10;
clk = 0; d = 1; #10;
clk = 0; d = 0; #10;
clk = 0; d = 1; #10;
clk = 1; d = 1; #10;
clk = 1; d = 0; #10;
clk = 1; d = 1; #10;
clk = 0; d = 1; #10;
clk = 0; d = 0; #10;
clk = 0; d = 0; #10;

clk = 1; d = 0; #10;
clk = 0; d = 1; #10;
clk = 1; d = 0; #10;
clk = 0; d = 1; #10;
clk = 1; d = 0; #10;
clk = 0; d = 1; #10;
clk = 1; d = 1; #10;
clk = 0; d = 1; #10;
clk = 1; d = 0; #10;
clk = 0; d = 0; #10;
clk = 1; d = 0; #10;
clk = 0; d = 1; #10;
clk = 1; d = 1; #10;
clk = 0; d = 0; #10;
clk = 1; d = 0; #10;
clk = 0; d = 0; #10;


end
endmodule
//The daughter snail smiles whenever she slides over the pattern 1101.
module patternMealy_v 
(
input clk,
input reset,
input a,
output y
);

reg [1:0] state, nextstate;
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

// state register
always @ (posedge clk, posedge reset)
	if (reset) 
		state <= S0;
	else 
		state <= nextstate;

// next state logic
always @ (*)
	case (state)
		S0: 
			if (a) 
				nextstate = S1;
			else 
				nextstate = S0;
		S1: 	if (a) 
				nextstate = S2;
			else 
				nextstate = S0;
		S2: 
			if (a) 
				nextstate = S2;
			else 
				nextstate = S3;
		S3: 
			if (a) 
				nextstate = S1;
			else 
				nextstate = S0;
		default: 
				nextstate = S0;
	endcase

// output logic
assign y = (a & state == S3);

endmodule
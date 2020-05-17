//The daughter snail smiles whenever she slides over the pattern 1101.
module patternMoore_v 
(
input clk,
input reset,
input a,
output y
);

reg [2:0] state, nextstate;
parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;

// state register
always @ (posedge clk, posedge reset)
	if (reset) 
		state <= S0;
	else 
		state <= nextstate;

// next state logic
always @ (*)
	case (state)
		S0: if (a) 
			nextstate = S1;
		    else 
			nextstate = S0;
		S1: if (a) 
			nextstate = S2;
		    else 
			nextstate = S0;
		S2: if (a) 
			nextstate = S2;
		    else 
			nextstate = S3;
		S3: if (a) 
			nextstate = S4;
		    else 
			nextstate = S0;
		S4: if (a) 
			nextstate = S2;
		    else 
			nextstate = S0;
		default: 
			nextstate = S0;
	endcase

// output logic
assign y = (state == S4);

endmodule
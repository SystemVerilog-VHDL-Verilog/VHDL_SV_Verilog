module TB_HDL_Example_4_3();
logic [3:0] a_sv, b_sv, y1_sv, y2_sv, y3_sv, y4_sv, y5_sv;
logic [3:0] a_v, b_v, y1_v, y2_v, y3_v, y4_v, y5_v;
logic [3:0] a_vhd, b_vhd, y1_vhd, y2_vhd, y3_vhd, y4_vhd, y5_vhd;

// instantiate device under test
gates_top dut
(
a_sv, b_sv, y1_sv, y2_sv, y3_sv, y4_sv, y5_sv, 
a_v, b_v, y1_v, y2_v, y3_v, y4_v, y5_v, 
a_vhd, b_vhd, y1_vhd, y2_vhd, y3_vhd, y4_vhd, y5_vhd 
);

// apply inputs one at a time
initial begin


//a_sv = 4’b0000; a_v = 4’b0000; a_vhd = 4’b0000; #10; //bin
//a_sv = 4’d0; a_v = 4’d0; a_vhd = 4’d0; #10; // dec


a_sv = 4'h0; a_v = 4'h0; a_vhd = 4'h0; ;  // hex
b_sv = 4'h0; b_v = 4'h0; b_vhd = 4'h0; #10; // hex
a_sv = 4'h1; a_v = 4'h1; a_vhd = 4'h1; #10; // hex
b_sv = 4'h1; b_v = 4'h1; b_vhd = 4'h1; #10; // hex
a_sv = 4'h2; a_v = 4'h2; a_vhd = 4'h2; #10; // hex
b_sv = 4'h2; b_v = 4'h2; b_vhd = 4'h2; #10; // hex
a_sv = 4'h3; a_v = 4'h3; a_vhd = 4'h3; #10; // hex
b_sv = 4'h3; b_v = 4'h3; b_vhd = 4'h3; #10; // hex
a_sv = 4'h4; a_v = 4'h4; a_vhd = 4'h4; #10;  // hex
b_sv = 4'h4; b_v = 4'h4; b_vhd = 4'h4; #10; // hex
a_sv = 4'h5; a_v = 4'h5; a_vhd = 4'h5; #10;  // hex
b_sv = 4'h5; b_v = 4'h5; b_vhd = 4'h5; #10; // hex
a_sv = 4'h6; a_v = 4'h6; a_vhd = 4'h6; #10;  // hex
b_sv = 4'h6; b_v = 4'h6; b_vhd = 4'h6; #10; // hex
a_sv = 4'h7; a_v = 4'h7; a_vhd = 4'h7; #10;  // hex
b_sv = 4'h7; b_v = 4'h7; b_vhd = 4'h7; #10; // hex
a_sv = 4'h8; a_v = 4'h8; a_vhd = 4'h8; #10;  // hex
b_sv = 4'h8; b_v = 4'h8; b_vhd = 4'h8; #10; // hex
a_sv = 4'h9; a_v = 4'h9; a_vhd = 4'h9; #10;  // hex
b_sv = 4'h9; b_v = 4'h9; b_vhd = 4'h9; #10; // hex
a_sv = 4'hA; a_v = 4'hA; a_vhd = 4'hA; #10;  // hex
b_sv = 4'hA; b_v = 4'hA; b_vhd = 4'hA; #10; // hex
a_sv = 4'hB; a_v = 4'hB; a_vhd = 4'hB; #10;  // hex
b_sv = 4'hB; b_v = 4'hB; b_vhd = 4'hB; #10; // hex
a_sv = 4'hC; a_v = 4'hC; a_vhd = 4'hC; #10;  // hex
b_sv = 4'hC; b_v = 4'hC; b_vhd = 4'hC; #10; // hex
a_sv = 4'hD; a_v = 4'hD; a_vhd = 4'hD; #10;  // hex
b_sv = 4'hD; b_v = 4'hD; b_vhd = 4'hD; #10; // hex
a_sv = 4'hE; a_v = 4'hE; a_vhd = 4'hE; #10;  // hex
b_sv = 4'hE; b_v = 4'hE; b_vhd = 4'hE; #10; // hex
a_sv = 4'hF; a_v = 4'hF; a_vhd = 4'hF; #10;  // hex
b_sv = 4'hF; b_v = 4'hF; b_vhd = 4'hF; #10; // hex

end
endmodule
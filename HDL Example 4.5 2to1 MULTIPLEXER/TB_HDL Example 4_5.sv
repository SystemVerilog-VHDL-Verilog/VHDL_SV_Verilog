module TB_HDL_Example_4_5();
logic [3:0] d0_sv, d1_sv, y_sv;
logic s_sv;
logic [3:0] d0_v, d1_v, y_v;
logic s_v;
logic [3:0] d0_vhd, d1_vhd, y_vhd;
logic s_vhd;

// instantiate device under test
mux2_top dut
(
d0_sv, d1_sv, s_sv, y_sv, 
d0_v, d1_v, s_v, y_v,
d0_vhd, d1_vhd, s_vhd, y_vhd
);

// apply inputs one at a time
initial begin


//a_sv = 4’b0000; a_v = 4’b0000; a_vhd = 4’b0000; #10; //bin
//a_sv = 4’d0; a_v = 4’d0; a_vhd = 4’d0; #10; // dec


d0_sv = 4'h0; d1_sv = 4'hF; 
s_sv = 1'b0; 
assert (y_sv === 4'h0) else $error("000 failed.");
d0_v = 4'h0; d1_v = 4'hF; 
s_v = 1'b0; 
assert (y_v === 4'h0) else $error("000 failed.");
d0_vhd = 4'h0; d1_vhd = 4'hF; 
s_vhd = 1'b0; 
assert (y_vhd === 4'hF) else $error("000 failed.");
#10;

s_sv = 1'b1; 
s_v = 1'b1; 
s_vhd = 1'b1; 

end
endmodule
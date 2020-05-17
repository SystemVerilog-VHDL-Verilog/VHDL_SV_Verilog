module TB_HDL_Example_4_6();
logic [3:0] d0_sv, d1_sv, d2_sv, d3_sv, y_sv;
logic [1:0] s_sv;
logic [3:0] d0_v, d1_v, d2_v, d3_v, y_v;
logic [1:0] s_v;
logic [3:0] d0_vhd, d1_vhd,d2_vhd, d3_vhd, y_vhd;
logic [1:0] s_vhd;

// instantiate device under test
mux4_top dut
(
d0_sv, d1_sv, d2_sv, d3_sv, s_sv, y_sv, 
d0_v, d1_v, d2_v, d3_v, s_v, y_v,
d0_vhd, d1_vhd, d2_vhd, d3_vhd, s_vhd, y_vhd
);

// apply inputs one at a time
initial begin


//a_sv = 4’b0000; a_v = 4’b0000; a_vhd = 4’b0000; #10; //bin
//a_sv = 4’d0; a_v = 4’d0; a_vhd = 4’d0; #10; // dec


d0_sv = 4'h0; d1_sv = 4'h5; d2_sv = 4'hA; d3_sv = 4'hF; 
s_sv = 2'b00; 
d0_v = 4'h0; d1_v = 4'h5; d2_v = 4'hA; d3_v = 4'hF;
s_v = 2'b00;  
d0_vhd = 4'h0; d1_vhd = 4'h5; d2_vhd = 4'hA; d3_vhd = 4'hF; 
s_vhd = 2'b00;  
#10;
assert (y_sv === 4'h0) else $error("0000 failed.");

s_sv = 2'b01; 
s_v = 2'b01; 
s_vhd = 2'b01; 
#10;
assert (y_sv === 4'h5) else $error("5 failed.");

s_sv = 2'b10; 
s_v = 2'b10; 
s_vhd = 2'b10; 
#10;
assert (y_sv === 4'hA) else $error("A failed.");

s_sv = 2'b11; 
s_v = 2'b11; 
s_vhd = 2'b11; 
assert (y_sv === 4'hF) else $error("F failed.");

end
endmodule
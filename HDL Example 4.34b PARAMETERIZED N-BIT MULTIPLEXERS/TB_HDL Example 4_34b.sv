module TB_HDL_Example_4_34b();
logic [11:0] d0_sv, d1_sv, d2_sv, d3_sv, y_sv;
logic [1:0] s_sv;
logic [11:0] d0_v, d1_v, d2_v, d3_v, y_v;
logic [1:0] s_v;
logic [11:0] d0_vhd, d1_vhd,d2_vhd, d3_vhd, y_vhd;
logic [1:0] s_vhd;

// instantiate device under test
mux4_12_top dut
(
d0_sv, d1_sv, d2_sv, d3_sv, s_sv, y_sv, 
d0_v, d1_v, d2_v, d3_v, s_v, y_v,
d0_vhd, d1_vhd, d2_vhd, d3_vhd, s_vhd, y_vhd
);

// apply inputs one at a time
initial begin


//a_sv = 4’b0000; a_v = 4’b0000; a_vhd = 4’b0000; #10; //bin
//a_sv = 4’d0; a_v = 4’d0; a_vhd = 4’d0; #10; // dec


d0_sv = 12'h000; d1_sv = 12'h555; d2_sv = 12'hAAA; d3_sv = 12'hFFF; 
s_sv = 2'b00; 
assert (y_sv === 12'h000) else $error("00 failed.");
d0_v = 12'h000; d1_v = 12'h555; d2_v = 12'hAAA; d3_v = 12'hFFF;
s_v = 2'b00;  
assert (y_v === 12'h000) else $error("00 failed.");
d0_vhd = 12'h00; d1_vhd = 12'h555; d2_vhd = 12'hAAA; d3_vhd = 12'hFFF; 
s_vhd = 2'b00;  
assert (y_vhd === 12'hFF) else $error("00 failed.");


#10;
s_sv = 2'b01; 
s_v = 2'b01; 
s_vhd = 2'b01; 
assert (y_sv === 12'h555) else $error("01 failed.");

#10;
s_sv = 2'b10; 
s_v = 2'b10; 
s_vhd = 2'b10; 
assert (y_sv === 12'hAAA) else $error("10 failed.");

#10;
s_sv = 2'b11; 
s_v = 2'b11; 
s_vhd = 2'b11; 
assert (y_sv === 12'hFFF) else $error("11 failed.");
end
endmodule
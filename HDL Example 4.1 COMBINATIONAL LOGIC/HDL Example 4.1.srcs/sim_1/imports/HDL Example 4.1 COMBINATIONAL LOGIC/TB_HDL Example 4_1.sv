module TB_HDL_Example_4_1();
logic a_sv, b_sv, c_sv, y_sv, a_v, b_v, c_v, y_v, a_vhd, b_vhd, c_vhd, y_vhd;
// instantiate device under test
sillyfunction_top dut(a_sv, b_sv, c_sv, y_sv, a_v, b_v, c_v, y_v, a_vhd, b_vhd, c_vhd, y_vhd);
// apply inputs one at a time
initial begin

a_sv = 0; a_v = 0; a_vhd = 0;
b_sv = 0; b_v = 0; b_vhd = 0; 
c_sv = 0; c_v = 0; c_vhd = 0; #10;

c_sv = 1; c_v = 1; c_vhd = 1; #10;

b_sv = 1; b_v = 1; b_vhd = 1;
c_sv = 0; c_v = 0; c_vhd = 0; #10;

c_sv = 1; c_v = 1; c_vhd = 1; #10;

a_sv = 1; a_v = 1; a_vhd = 1;
b_sv = 0; b_v = 0; b_vhd = 0; 
c_sv = 0; c_v = 0; c_vhd = 0; #10;

c_sv = 1; c_v = 1; c_vhd = 1; #10;

b_sv = 1; b_v = 1; b_vhd = 1; 
c_sv = 0; c_v = 0; c_vhd = 0; #10;

c_sv = 1; c_v = 1; c_vhd = 1; #10;
end
endmodule
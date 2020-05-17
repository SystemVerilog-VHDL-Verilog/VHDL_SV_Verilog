module TB_HDL_Example_4_22();
logic [3:0] a_sv, y_sv, a_v, y_v, a_vhd, y_vhd;
// instantiate device under test
inv_top dut(a_sv, y_sv, a_v, y_v, a_vhd, y_vhd);
// apply inputs one at a time
initial begin

//a_sv = 4'b0000; a_v = 4'b0000; a_vhd = 4'b0000; #10; //bin
a_sv = 4'd0; a_v = 4'd0; a_vhd = 4'd0; #10; // dec
//a_sv = 4’h0; a_v = 4’h0; a_vhd = 4’h0; #10; // hex

a_sv = 4'd0; a_v = 3'd0; a_vhd = 3'd0; #10; //dec
a_sv = 4'd1; a_v = 3'd1; a_vhd = 3'd1; #10; //dec
a_sv = 4'd2; a_v = 3'd2; a_vhd = 3'd2; #10; //dec
a_sv = 4'd3; a_v = 3'd3; a_vhd = 3'd3; #10; //dec
a_sv = 4'd4; a_v = 3'd4; a_vhd = 3'd4; #10; //dec
a_sv = 4'd5; a_v = 3'd5; a_vhd = 3'd5; #10; //dec
a_sv = 4'd6; a_v = 3'd6; a_vhd = 3'd6; #10; //dec
a_sv = 4'd7; a_v = 3'd7; a_vhd = 3'd7; #10; //dec

a_sv = 4'd8; a_v = 4'd8; a_vhd = 4'd8; #10; //dec
a_sv = 4'd9; a_v = 4'd9; a_vhd = 4'd9; #10; //dec
a_sv = 4'd10; a_v = 4'd10; a_vhd = 4'd10; #10; //dec
a_sv = 4'd11; a_v = 4'd11; a_vhd = 4'd11; #10; //dec
a_sv = 4'd12; a_v = 4'd12; a_vhd = 4'd12; #10; //dec
a_sv = 4'd13; a_v = 4'd13; a_vhd = 4'd13; #10; //dec
a_sv = 4'd14; a_v = 4'd14; a_vhd = 4'd14; #10; //dec
a_sv = 4'd15; a_v = 4'd15; a_vhd = 4'd15; #10; //dec


end
endmodule
module ex5_14
(
input [3:0] a;
output [3:0] right_rotated;
output [3:0] left_rotated;
input  [1:0] shamt;
);
// right rotated
always @ (*) // output logic (combinational)
	case(shamt)
		2'b00: right_rotated = a;
		2'b01: right_rotated = {a[0], a[3], a[2], a[1]};
		2'b10: right_rotated = {a[1], a[0], a[3], a[2]};
		2'b11: right_rotated = {a[2], a[1], a[0], a[3]};
		default: right_rotated = 4'bxxxx;
	endcase
// left rotated
always @ (*) // output logic (combinational)
	case(shamt)
		2'b00: left_rotated = a;
		2'b01: left_rotated = {a[2], a[1], a[0], a[3]};
		2'b10: left_rotated = {a[1], a[0], a[3], a[2]};
		2'b11: left_rotated = {a[0], a[3], a[2], a[1]};
		default: left_rotated = 4'bxxxx;
	endcase
endmodule
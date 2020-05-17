module and8_sv
(
input logic [7:0] a,
output logic y, y1
);

assign y = &a;
// &a is much easier to write than
 assign y1 = a[7] & a[6] & a[5] & a[4] & a[3] & a[2] & a[1] & a[0];
endmodule
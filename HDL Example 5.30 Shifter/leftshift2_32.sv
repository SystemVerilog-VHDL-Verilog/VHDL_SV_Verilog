module leftshift2_32
(
input logic [31:0] a,
output logic [31:0] y
);
assign y = {a[29:0], 2'b0};
endmodule
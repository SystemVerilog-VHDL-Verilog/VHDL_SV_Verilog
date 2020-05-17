module mux2_sv
#(parameter width = 8)
(
input logic [width-1 : 0] d0,
input logic [width-1 : 0] d1,
input logic s,
output logic [width-1 : 0] y
);

assign y = s ? d1 : d0;

endmodule
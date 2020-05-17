//HDL Example 4.12 BIT SWIZZLING

module BIT_SWIZZLING_sv 
(
    input logic [4:0] C,
    input logic [4:0] D,
    output logic [8:0] Y
);

assign Y = {C[2:1], {3{D[0]}}, C[0], 3'b101}; //y = c2c1d0d0d0c0101 3'b101 - constant

endmodule
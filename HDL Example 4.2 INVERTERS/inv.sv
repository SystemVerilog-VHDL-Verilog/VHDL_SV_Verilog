module inv_sv
(
    input logic [3:0] a,
    output logic [3:0] y
);

    assign y = ~a;

endmodule
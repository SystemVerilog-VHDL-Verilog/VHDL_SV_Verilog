module inv_v
(
    input [3:0] a,
    output [3:0] y
);

    assign y = ~a;

endmodule
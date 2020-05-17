module sillyfunction_v 
(
    input a, b, c,
    output y
);
    assign y = ~a & ~b & ~c |
    a & ~b & ~c |
    a & ~b & c;
endmodule

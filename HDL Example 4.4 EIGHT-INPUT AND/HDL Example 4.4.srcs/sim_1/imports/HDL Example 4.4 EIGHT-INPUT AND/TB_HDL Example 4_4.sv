module TB_HDL_Example_4_3();
logic [7:0] a_sv;
logic  y_sv;
logic [7:0] a_v;
logic  y_v;
logic [7:0] a_vhd;
logic  y_vhd;

integer i ;
logic [7:0] a_common;

// instantiate device under test
and8_top dut
(
a_sv, y_sv, y1_sv,
a_v, y_v, 
a_vhd, y_vhd 
);

// apply inputs one at a time
initial begin


//a_sv = 4’b0000; a_v = 4’b0000; a_vhd = 4’b0000; #10; //bin
//a_sv = 4’d0; a_v = 4’d0; a_vhd = 4’d0; #10; // dec

//a_sv = 8'd0;
//a_v = 8'd0;
//a_vhd = 8'd0;

a_common <= 8'd0; 
//a_sv = a_common;
//a_v = a_common;
//a_vhd = a_common;

for (i = 0; i < 256 ;i = i + 1)
begin 
a_common <= i; 
a_sv = i;
a_v = i;
a_vhd = i;
#5;
end

end
endmodule
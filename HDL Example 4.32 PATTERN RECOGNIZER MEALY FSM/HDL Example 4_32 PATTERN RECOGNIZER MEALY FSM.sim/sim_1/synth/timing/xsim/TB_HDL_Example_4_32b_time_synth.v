// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.1 (win64) Build 2580384 Sat Jun 29 08:12:21 MDT 2019
// Date        : Sat May  2 10:27:23 2020
// Host        : DESKTOP-6J0J3T6 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {C:/Zynq_Book/VHDL_SV_Verilog/HDL Example
//               4.32 PATTERN RECOGNIZER MEALY FSM/HDL Example 4_32 PATTERN RECOGNIZER MEALY
//               FSM.sim/sim_1/synth/timing/xsim/TB_HDL_Example_4_32b_time_synth.v}
// Design      : patternMealy_top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a15tcpg236-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module patternMealy_sv
   (y_sv_OBUF,
    a_IBUF,
    CLK,
    AR);
  output y_sv_OBUF;
  input a_IBUF;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire a_IBUF;
  wire [1:0]nextstate;
  wire [1:0]state;
  wire y_sv_OBUF;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h94)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(a_IBUF),
        .O(nextstate[0]));
  LUT3 #(
    .INIT(8'h38)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(a_IBUF),
        .I1(state[0]),
        .I2(state[1]),
        .O(nextstate[1]));
  (* FSM_ENCODED_STATES = "S3:11,S2:10,S0:00,S1:01" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(nextstate[0]),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "S3:11,S2:10,S0:00,S1:01" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(nextstate[1]),
        .Q(state[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h80)) 
    y_sv_OBUF_inst_i_1
       (.I0(a_IBUF),
        .I1(state[1]),
        .I2(state[0]),
        .O(y_sv_OBUF));
endmodule

(* NotValidForBitStream *)
module patternMealy_top
   (reset,
    clk,
    a,
    y_sv,
    y_v,
    y_vhd);
  input reset;
  input clk;
  input a;
  output y_sv;
  output y_v;
  output y_vhd;

  wire a;
  wire a_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire reset;
  wire reset_IBUF;
  wire y_sv;
  wire y_sv_OBUF;
  wire y_v;
  wire y_v_OBUF;
  wire y_vhd;
  wire y_vhd_OBUF;

initial begin
 $sdf_annotate("TB_HDL_Example_4_32b_time_synth.sdf",,,,"tool_control");
end
  patternMealy_sv SV
       (.AR(reset_IBUF),
        .CLK(clk_IBUF_BUFG),
        .a_IBUF(a_IBUF),
        .y_sv_OBUF(y_sv_OBUF));
  patternMealy_v V
       (.AR(reset_IBUF),
        .CLK(clk_IBUF_BUFG),
        .a_IBUF(a_IBUF),
        .y_v_OBUF(y_v_OBUF));
  patternMealy_vhd VHDL
       (.AR(reset_IBUF),
        .CLK(clk_IBUF_BUFG),
        .a_IBUF(a_IBUF),
        .y_vhd_OBUF(y_vhd_OBUF));
  IBUF a_IBUF_inst
       (.I(a),
        .O(a_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  OBUF y_sv_OBUF_inst
       (.I(y_sv_OBUF),
        .O(y_sv));
  OBUF y_v_OBUF_inst
       (.I(y_v_OBUF),
        .O(y_v));
  OBUF y_vhd_OBUF_inst
       (.I(y_vhd_OBUF),
        .O(y_vhd));
endmodule

module patternMealy_v
   (y_v_OBUF,
    a_IBUF,
    CLK,
    AR);
  output y_v_OBUF;
  input a_IBUF;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire a_IBUF;
  wire [1:0]nextstate;
  wire [1:0]state;
  wire y_v_OBUF;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h94)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(a_IBUF),
        .O(nextstate[0]));
  LUT3 #(
    .INIT(8'h38)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(a_IBUF),
        .I1(state[0]),
        .I2(state[1]),
        .O(nextstate[1]));
  (* FSM_ENCODED_STATES = "S3:11,S2:10,S0:00,S1:01" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(nextstate[0]),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "S3:11,S2:10,S0:00,S1:01" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(nextstate[1]),
        .Q(state[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h80)) 
    y_v_OBUF_inst_i_1
       (.I0(a_IBUF),
        .I1(state[1]),
        .I2(state[0]),
        .O(y_v_OBUF));
endmodule

module patternMealy_vhd
   (y_vhd_OBUF,
    a_IBUF,
    CLK,
    AR);
  output y_vhd_OBUF;
  input a_IBUF;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire a_IBUF;
  wire [1:0]nextstate;
  wire [1:0]state;
  wire y_vhd_OBUF;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h94)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(a_IBUF),
        .O(nextstate[0]));
  LUT3 #(
    .INIT(8'h38)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(a_IBUF),
        .I1(state[0]),
        .I2(state[1]),
        .O(nextstate[1]));
  (* FSM_ENCODED_STATES = "s3:11,s2:10,s0:00,s1:01" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(nextstate[0]),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "s3:11,s2:10,s0:00,s1:01" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(nextstate[1]),
        .Q(state[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h80)) 
    y_vhd_OBUF_inst_i_1
       (.I0(a_IBUF),
        .I1(state[1]),
        .I2(state[0]),
        .O(y_vhd_OBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

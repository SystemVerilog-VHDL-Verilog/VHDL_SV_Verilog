@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Fri Apr 03 10:29:51 +0300 2020
REM SW Build 2580384 on Sat Jun 29 08:12:21 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim TB_HDL_Example_4_21_Latches_Do_not_do_that_behav -key {Behavioral:sim_1:Functional:TB_HDL_Example_4_21_Latches_Do_not_do_that} -tclbatch TB_HDL_Example_4_21_Latches_Do_not_do_that.tcl -view C:/Zynq_Book/VHDL_SV_Verilog/HDL Example 4.21 Latches Do not do that/HDL Example 4.21 Latches Do not do that/TB_HDL_Example_4_21_Latches_Do_not_do_that_behav.wcfg -log simulate.log"
call xsim  TB_HDL_Example_4_21_Latches_Do_not_do_that_behav -key {Behavioral:sim_1:Functional:TB_HDL_Example_4_21_Latches_Do_not_do_that} -tclbatch TB_HDL_Example_4_21_Latches_Do_not_do_that.tcl -view C:/Zynq_Book/VHDL_SV_Verilog/HDL Example 4.21 Latches Do not do that/HDL Example 4.21 Latches Do not do that/TB_HDL_Example_4_21_Latches_Do_not_do_that_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sun Jan 26 17:58:09 +0200 2020
REM SW Build 2580384 on Sat Jun 29 08:12:21 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim TB_HDL_Example_4_10_behav -key {Behavioral:sim_1:Functional:TB_HDL_Example_4_10} -tclbatch TB_HDL_Example_4_10.tcl -log simulate.log"
call xsim  TB_HDL_Example_4_10_behav -key {Behavioral:sim_1:Functional:TB_HDL_Example_4_10} -tclbatch TB_HDL_Example_4_10.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

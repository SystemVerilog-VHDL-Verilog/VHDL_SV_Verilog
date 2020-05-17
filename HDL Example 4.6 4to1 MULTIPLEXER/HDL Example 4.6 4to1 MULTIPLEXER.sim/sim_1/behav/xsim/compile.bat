@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1.1 (64-bit)
REM
REM Filename    : compile.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for compiling the simulation design source files
REM
REM Generated by Vivado on Tue Jan 14 18:13:48 +0200 2020
REM SW Build 2580384 on Sat Jun 29 08:12:21 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: compile.bat
REM
REM ****************************************************************************
echo "xvlog --incr --relax -prj TB_HDL_Example_4_6_vlog.prj"
call xvlog  --incr --relax -prj TB_HDL_Example_4_6_vlog.prj -log xvlog.log
call type xvlog.log > compile.log
echo "xvhdl --incr --relax -prj TB_HDL_Example_4_6_vhdl.prj"
call xvhdl  --incr --relax -prj TB_HDL_Example_4_6_vhdl.prj -log xvhdl.log
call type xvhdl.log >> compile.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0

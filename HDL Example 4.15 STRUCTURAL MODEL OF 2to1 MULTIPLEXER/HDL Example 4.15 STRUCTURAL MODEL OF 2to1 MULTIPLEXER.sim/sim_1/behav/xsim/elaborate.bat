@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1.1 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Sun Feb 02 17:43:35 +0200 2020
REM SW Build 2580384 on Sat Jun 29 08:12:21 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto fea7e811d98147859b14945159b267e3 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot TB_HDL_Example_4_15_behav xil_defaultlib.TB_HDL_Example_4_15 xil_defaultlib.glbl -log elaborate.log"
call xelab  -wto fea7e811d98147859b14945159b267e3 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot TB_HDL_Example_4_15_behav xil_defaultlib.TB_HDL_Example_4_15 xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

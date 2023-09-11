@echo off
REM ****************************************************************************
REM Vivado (TM) v2017.4 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Mon Sep 11 19:09:56 +0800 2023
REM SW Build 2086221 on Fri Dec 15 20:55:39 MST 2017
REM
REM Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
call xsim Risc_cpu_tb_behav -key {Behavioral:sim_1:Functional:Risc_cpu_tb} -tclbatch Risc_cpu_tb.tcl -view C:/Users/gjk19/Desktop/Digital Circuit/Vivado Project/RISC CPU/Risc_cpu_tb_behav.wcfg -view C:/Users/gjk19/Desktop/Digital Circuit/Vivado Project/RISC CPU/ALU_16bit_tb_behav.wcfg -view C:/Users/gjk19/Desktop/Digital Circuit/Vivado Project/RISC CPU/Runtime_register_tb_behav.wcfg -view C:/Users/gjk19/Desktop/Digital Circuit/Vivado Project/RISC CPU/Counter_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

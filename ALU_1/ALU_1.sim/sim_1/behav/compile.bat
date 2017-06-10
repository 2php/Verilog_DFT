@echo off
rem  Vivado(TM)
rem  compile.bat: a Vivado-generated XSim simulation Script
rem  Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.

set PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%;A:/Vivado/SDK/2014.2/bin;A:/Vivado/Vivado/2014.2/ids_lite/ISE/bin/nt64;A:/Vivado/Vivado/2014.2/ids_lite/ISE/lib/nt64;A:/Vivado/Vivado/2014.2/bin;%PATH%
set XILINX_PLANAHEAD=A:/Vivado/Vivado/2014.2

xelab -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot top_test_behav --prj "A:/Semester 7/DigitalIC/ALU_1/ALU_1.sim/sim_1/behav/top_test.prj"   xil_defaultlib.top_test   xil_defaultlib.glbl
if errorlevel 1 (
   cmd /c exit /b %errorlevel%
)

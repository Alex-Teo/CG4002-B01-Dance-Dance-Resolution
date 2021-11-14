############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
open_project MLP_FINAL
set_top mlp_dance3
add_files math_functions.h
add_files main.cpp
add_files definition.h
add_files -tb MLP_FINAL/testbench.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xczu3eg-sbva484-1-i}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog -vivado_clock 10
source "./MLP_FINAL/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output D:/o/nus_files/2122-Year4-sem-1/CG4002/YETONG-Ultra96/Ultra96-main/FPGA/HLS/MLP_FINAL/ip/mlp_dance3.zip

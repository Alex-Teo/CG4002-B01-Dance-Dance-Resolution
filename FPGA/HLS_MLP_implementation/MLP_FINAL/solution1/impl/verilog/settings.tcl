# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
# Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
# ==============================================================
#
# Settings for Vivado implementation flow
#
set top_module mlp_dance3
set language verilog
set family zynquplus
set device xczu3eg
set package -sbva484
set speed -1-i
set clock ap_clk
set fsm_ext "off"

# For customizing the implementation flow
set add_io_buffers false ;# true|false

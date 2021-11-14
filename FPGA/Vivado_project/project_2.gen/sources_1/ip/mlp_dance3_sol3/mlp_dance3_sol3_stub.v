// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Tue Oct 12 04:16:15 2021
// Host        : DESKTOP-F07M07L running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/o/nus_files/2122-Year4-sem-1/CG4002/YETONG-Ultra96/Ultra96-main/FPGA/HLS/MLP_FINAL/MLP_FINAL/solution3/impl/ip/mlp_dance3_sol3/mlp_dance3_sol3_stub.v
// Design      : mlp_dance3_sol3
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sbva484-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "mlp_dance3,Vivado 2021.1" *)
module mlp_dance3_sol3(ap_clk, ap_rst_n, S_AXIS_V_TVALID, 
  S_AXIS_V_TREADY, S_AXIS_V_TDATA, M_AXIS_V_TVALID, M_AXIS_V_TREADY, M_AXIS_V_TDATA)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,S_AXIS_V_TVALID,S_AXIS_V_TREADY,S_AXIS_V_TDATA[63:0],M_AXIS_V_TVALID,M_AXIS_V_TREADY,M_AXIS_V_TDATA[63:0]" */;
  input ap_clk;
  input ap_rst_n;
  input S_AXIS_V_TVALID;
  output S_AXIS_V_TREADY;
  input [63:0]S_AXIS_V_TDATA;
  output M_AXIS_V_TVALID;
  input M_AXIS_V_TREADY;
  output [63:0]M_AXIS_V_TDATA;
endmodule

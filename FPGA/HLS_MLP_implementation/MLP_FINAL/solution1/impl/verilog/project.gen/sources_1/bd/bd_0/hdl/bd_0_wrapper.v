//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Thu Sep 30 02:33:56 2021
//Host        : DESKTOP-F07M07L running 64-bit major release  (build 9200)
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
   (M_AXIS_V_tdata,
    M_AXIS_V_tready,
    M_AXIS_V_tvalid,
    S_AXIS_V_tdata,
    S_AXIS_V_tready,
    S_AXIS_V_tvalid,
    ap_clk,
    ap_rst_n);
  output [63:0]M_AXIS_V_tdata;
  input M_AXIS_V_tready;
  output M_AXIS_V_tvalid;
  input [63:0]S_AXIS_V_tdata;
  output S_AXIS_V_tready;
  input S_AXIS_V_tvalid;
  input ap_clk;
  input ap_rst_n;

  wire [63:0]M_AXIS_V_tdata;
  wire M_AXIS_V_tready;
  wire M_AXIS_V_tvalid;
  wire [63:0]S_AXIS_V_tdata;
  wire S_AXIS_V_tready;
  wire S_AXIS_V_tvalid;
  wire ap_clk;
  wire ap_rst_n;

  bd_0 bd_0_i
       (.M_AXIS_V_tdata(M_AXIS_V_tdata),
        .M_AXIS_V_tready(M_AXIS_V_tready),
        .M_AXIS_V_tvalid(M_AXIS_V_tvalid),
        .S_AXIS_V_tdata(S_AXIS_V_tdata),
        .S_AXIS_V_tready(S_AXIS_V_tready),
        .S_AXIS_V_tvalid(S_AXIS_V_tvalid),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n));
endmodule

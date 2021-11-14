//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Thu Sep 30 02:33:56 2021
//Host        : DESKTOP-F07M07L running 64-bit major release  (build 9200)
//Command     : generate_target bd_0.bd
//Design      : bd_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "bd_0.hwdef" *) 
module bd_0
   (M_AXIS_V_tdata,
    M_AXIS_V_tready,
    M_AXIS_V_tvalid,
    S_AXIS_V_tdata,
    S_AXIS_V_tready,
    S_AXIS_V_tvalid,
    ap_clk,
    ap_rst_n);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_V " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_V, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_V_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_V " *) input M_AXIS_V_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_V " *) output M_AXIS_V_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_V " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_V, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [63:0]S_AXIS_V_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_V " *) output S_AXIS_V_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_V " *) input S_AXIS_V_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_BUSIF M_AXIS_V:S_AXIS_V, ASSOCIATED_RESET ap_rst_n, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ap_rst_n;

  wire [63:0]S_AXIS_V_0_1_TDATA;
  wire S_AXIS_V_0_1_TREADY;
  wire S_AXIS_V_0_1_TVALID;
  wire ap_clk_0_1;
  wire ap_rst_n_0_1;
  wire [63:0]hls_inst_M_AXIS_V_TDATA;
  wire hls_inst_M_AXIS_V_TREADY;
  wire hls_inst_M_AXIS_V_TVALID;

  assign M_AXIS_V_tdata[63:0] = hls_inst_M_AXIS_V_TDATA;
  assign M_AXIS_V_tvalid = hls_inst_M_AXIS_V_TVALID;
  assign S_AXIS_V_0_1_TDATA = S_AXIS_V_tdata[63:0];
  assign S_AXIS_V_0_1_TVALID = S_AXIS_V_tvalid;
  assign S_AXIS_V_tready = S_AXIS_V_0_1_TREADY;
  assign ap_clk_0_1 = ap_clk;
  assign ap_rst_n_0_1 = ap_rst_n;
  assign hls_inst_M_AXIS_V_TREADY = M_AXIS_V_tready;
  bd_0_hls_inst_0 hls_inst
       (.M_AXIS_V_TDATA(hls_inst_M_AXIS_V_TDATA),
        .M_AXIS_V_TREADY(hls_inst_M_AXIS_V_TREADY),
        .M_AXIS_V_TVALID(hls_inst_M_AXIS_V_TVALID),
        .S_AXIS_V_TDATA(S_AXIS_V_0_1_TDATA),
        .S_AXIS_V_TREADY(S_AXIS_V_0_1_TREADY),
        .S_AXIS_V_TVALID(S_AXIS_V_0_1_TVALID),
        .ap_clk(ap_clk_0_1),
        .ap_rst_n(ap_rst_n_0_1));
endmodule

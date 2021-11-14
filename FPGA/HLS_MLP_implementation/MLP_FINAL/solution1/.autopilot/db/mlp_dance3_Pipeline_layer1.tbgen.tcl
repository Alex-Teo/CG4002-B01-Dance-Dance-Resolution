set moduleName mlp_dance3_Pipeline_layer1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {mlp_dance3_Pipeline_layer1}
set C_modelType { void 0 }
set C_modelArgList {
	{ buffer_1_2_027 float 32 regular  }
	{ buffer_1_1_026 float 32 regular  }
	{ buffer_1_0_025 float 32 regular  }
	{ weights_1_0_0_01 float 32 regular  }
	{ weights_1_0_1_02 float 32 regular  }
	{ weights_1_0_2_03 float 32 regular  }
	{ weights_1_1_0_04 float 32 regular  }
	{ weights_1_1_1_05 float 32 regular  }
	{ weights_1_1_2_06 float 32 regular  }
	{ weights_1_2_0_07 float 32 regular  }
	{ weights_1_2_1_08 float 32 regular  }
	{ weights_1_2_2_09 float 32 regular  }
	{ weights_1_3_0_010 float 32 regular  }
	{ weights_1_3_1_011 float 32 regular  }
	{ weights_1_3_2_012 float 32 regular  }
	{ weights_1_4_0_013 float 32 regular  }
	{ weights_1_4_1_014 float 32 regular  }
	{ weights_1_4_2_015 float 32 regular  }
	{ weights_1_5_0_016 float 32 regular  }
	{ weights_1_5_1_017 float 32 regular  }
	{ weights_1_5_2_018 float 32 regular  }
	{ weights_1_6_0_019 float 32 regular  }
	{ weights_1_6_1_020 float 32 regular  }
	{ weights_1_6_2_021 float 32 regular  }
	{ weights_1_7_0_022 float 32 regular  }
	{ weights_1_7_1_023 float 32 regular  }
	{ weights_1_7_2_024 float 32 regular  }
	{ buffer_0_0_1_reload float 32 regular  }
	{ buffer_0_1_1_reload float 32 regular  }
	{ buffer_0_2_1_reload float 32 regular  }
	{ buffer_0_3_1_reload float 32 regular  }
	{ buffer_0_4_1_reload float 32 regular  }
	{ buffer_0_5_1_reload float 32 regular  }
	{ buffer_0_6_1_reload float 32 regular  }
	{ buffer_0_7_1_reload float 32 regular  }
	{ buffer_1_2_1_out float 32 regular {pointer 1}  }
	{ buffer_1_1_1_out float 32 regular {pointer 1}  }
	{ buffer_1_0_1_out float 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "buffer_1_2_027", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_1_1_026", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_1_0_025", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_0_0_01", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_0_1_02", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_0_2_03", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_1_0_04", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_1_1_05", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_1_2_06", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_2_0_07", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_2_1_08", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_2_2_09", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_3_0_010", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_3_1_011", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_3_2_012", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_4_0_013", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_4_1_014", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_4_2_015", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_5_0_016", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_5_1_017", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_5_2_018", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_6_0_019", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_6_1_020", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_6_2_021", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_7_0_022", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_7_1_023", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_7_2_024", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_0_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_1_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_2_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_3_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_4_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_5_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_6_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_7_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_1_2_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "buffer_1_1_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "buffer_1_0_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 97
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ buffer_1_2_027 sc_in sc_lv 32 signal 0 } 
	{ buffer_1_1_026 sc_in sc_lv 32 signal 1 } 
	{ buffer_1_0_025 sc_in sc_lv 32 signal 2 } 
	{ weights_1_0_0_01 sc_in sc_lv 32 signal 3 } 
	{ weights_1_0_1_02 sc_in sc_lv 32 signal 4 } 
	{ weights_1_0_2_03 sc_in sc_lv 32 signal 5 } 
	{ weights_1_1_0_04 sc_in sc_lv 32 signal 6 } 
	{ weights_1_1_1_05 sc_in sc_lv 32 signal 7 } 
	{ weights_1_1_2_06 sc_in sc_lv 32 signal 8 } 
	{ weights_1_2_0_07 sc_in sc_lv 32 signal 9 } 
	{ weights_1_2_1_08 sc_in sc_lv 32 signal 10 } 
	{ weights_1_2_2_09 sc_in sc_lv 32 signal 11 } 
	{ weights_1_3_0_010 sc_in sc_lv 32 signal 12 } 
	{ weights_1_3_1_011 sc_in sc_lv 32 signal 13 } 
	{ weights_1_3_2_012 sc_in sc_lv 32 signal 14 } 
	{ weights_1_4_0_013 sc_in sc_lv 32 signal 15 } 
	{ weights_1_4_1_014 sc_in sc_lv 32 signal 16 } 
	{ weights_1_4_2_015 sc_in sc_lv 32 signal 17 } 
	{ weights_1_5_0_016 sc_in sc_lv 32 signal 18 } 
	{ weights_1_5_1_017 sc_in sc_lv 32 signal 19 } 
	{ weights_1_5_2_018 sc_in sc_lv 32 signal 20 } 
	{ weights_1_6_0_019 sc_in sc_lv 32 signal 21 } 
	{ weights_1_6_1_020 sc_in sc_lv 32 signal 22 } 
	{ weights_1_6_2_021 sc_in sc_lv 32 signal 23 } 
	{ weights_1_7_0_022 sc_in sc_lv 32 signal 24 } 
	{ weights_1_7_1_023 sc_in sc_lv 32 signal 25 } 
	{ weights_1_7_2_024 sc_in sc_lv 32 signal 26 } 
	{ buffer_0_0_1_reload sc_in sc_lv 32 signal 27 } 
	{ buffer_0_1_1_reload sc_in sc_lv 32 signal 28 } 
	{ buffer_0_2_1_reload sc_in sc_lv 32 signal 29 } 
	{ buffer_0_3_1_reload sc_in sc_lv 32 signal 30 } 
	{ buffer_0_4_1_reload sc_in sc_lv 32 signal 31 } 
	{ buffer_0_5_1_reload sc_in sc_lv 32 signal 32 } 
	{ buffer_0_6_1_reload sc_in sc_lv 32 signal 33 } 
	{ buffer_0_7_1_reload sc_in sc_lv 32 signal 34 } 
	{ buffer_1_2_1_out sc_out sc_lv 32 signal 35 } 
	{ buffer_1_2_1_out_ap_vld sc_out sc_logic 1 outvld 35 } 
	{ buffer_1_1_1_out sc_out sc_lv 32 signal 36 } 
	{ buffer_1_1_1_out_ap_vld sc_out sc_logic 1 outvld 36 } 
	{ buffer_1_0_1_out sc_out sc_lv 32 signal 37 } 
	{ buffer_1_0_1_out_ap_vld sc_out sc_logic 1 outvld 37 } 
	{ grp_fu_1742_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1742_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1742_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1742_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1742_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1746_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1746_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1746_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1746_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1746_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1750_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1750_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1750_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1750_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1750_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1754_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1754_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1754_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1754_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1754_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1758_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1758_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1758_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1758_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1758_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1762_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1762_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1762_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1762_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1762_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1766_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1766_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1766_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1766_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1766_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1770_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1770_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1770_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1770_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1770_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1774_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1774_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1774_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1774_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1774_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_554_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_554_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_554_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_554_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_554_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "buffer_1_2_027", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_1_2_027", "role": "default" }} , 
 	{ "name": "buffer_1_1_026", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_1_1_026", "role": "default" }} , 
 	{ "name": "buffer_1_0_025", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_1_0_025", "role": "default" }} , 
 	{ "name": "weights_1_0_0_01", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_0_0_01", "role": "default" }} , 
 	{ "name": "weights_1_0_1_02", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_0_1_02", "role": "default" }} , 
 	{ "name": "weights_1_0_2_03", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_0_2_03", "role": "default" }} , 
 	{ "name": "weights_1_1_0_04", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_1_0_04", "role": "default" }} , 
 	{ "name": "weights_1_1_1_05", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_1_1_05", "role": "default" }} , 
 	{ "name": "weights_1_1_2_06", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_1_2_06", "role": "default" }} , 
 	{ "name": "weights_1_2_0_07", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_2_0_07", "role": "default" }} , 
 	{ "name": "weights_1_2_1_08", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_2_1_08", "role": "default" }} , 
 	{ "name": "weights_1_2_2_09", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_2_2_09", "role": "default" }} , 
 	{ "name": "weights_1_3_0_010", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_3_0_010", "role": "default" }} , 
 	{ "name": "weights_1_3_1_011", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_3_1_011", "role": "default" }} , 
 	{ "name": "weights_1_3_2_012", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_3_2_012", "role": "default" }} , 
 	{ "name": "weights_1_4_0_013", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_4_0_013", "role": "default" }} , 
 	{ "name": "weights_1_4_1_014", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_4_1_014", "role": "default" }} , 
 	{ "name": "weights_1_4_2_015", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_4_2_015", "role": "default" }} , 
 	{ "name": "weights_1_5_0_016", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_5_0_016", "role": "default" }} , 
 	{ "name": "weights_1_5_1_017", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_5_1_017", "role": "default" }} , 
 	{ "name": "weights_1_5_2_018", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_5_2_018", "role": "default" }} , 
 	{ "name": "weights_1_6_0_019", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_6_0_019", "role": "default" }} , 
 	{ "name": "weights_1_6_1_020", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_6_1_020", "role": "default" }} , 
 	{ "name": "weights_1_6_2_021", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_6_2_021", "role": "default" }} , 
 	{ "name": "weights_1_7_0_022", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_7_0_022", "role": "default" }} , 
 	{ "name": "weights_1_7_1_023", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_7_1_023", "role": "default" }} , 
 	{ "name": "weights_1_7_2_024", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_7_2_024", "role": "default" }} , 
 	{ "name": "buffer_0_0_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_0_1_reload", "role": "default" }} , 
 	{ "name": "buffer_0_1_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_1_1_reload", "role": "default" }} , 
 	{ "name": "buffer_0_2_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_2_1_reload", "role": "default" }} , 
 	{ "name": "buffer_0_3_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_3_1_reload", "role": "default" }} , 
 	{ "name": "buffer_0_4_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_4_1_reload", "role": "default" }} , 
 	{ "name": "buffer_0_5_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_5_1_reload", "role": "default" }} , 
 	{ "name": "buffer_0_6_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_6_1_reload", "role": "default" }} , 
 	{ "name": "buffer_0_7_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_7_1_reload", "role": "default" }} , 
 	{ "name": "buffer_1_2_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_1_2_1_out", "role": "default" }} , 
 	{ "name": "buffer_1_2_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "buffer_1_2_1_out", "role": "ap_vld" }} , 
 	{ "name": "buffer_1_1_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_1_1_1_out", "role": "default" }} , 
 	{ "name": "buffer_1_1_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "buffer_1_1_1_out", "role": "ap_vld" }} , 
 	{ "name": "buffer_1_0_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_1_0_1_out", "role": "default" }} , 
 	{ "name": "buffer_1_0_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "buffer_1_0_1_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_1742_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1742_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1742_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1742_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1742_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1742_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1742_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1742_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1742_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1742_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1746_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1746_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1746_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1746_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1746_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1746_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1746_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1746_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1746_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1746_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1750_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1750_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1750_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1750_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1750_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1750_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1750_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1750_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1750_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1750_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1754_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1754_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1754_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1754_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1754_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1754_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1754_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1754_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1754_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1754_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1758_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1758_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1758_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1758_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1758_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1758_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1758_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1758_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1758_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1758_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1762_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1762_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1762_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1762_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1762_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1762_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1762_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1762_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1762_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1762_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1766_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1766_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1766_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1766_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1766_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1766_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1766_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1766_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1766_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1766_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1770_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1770_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1770_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1770_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1770_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1770_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1770_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1770_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1770_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1770_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1774_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1774_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1774_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1774_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1774_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1774_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1774_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1774_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1774_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1774_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_554_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_554_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_554_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_554_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_554_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_554_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_554_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_554_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_554_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_554_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"],
		"CDFG" : "mlp_dance3_Pipeline_layer1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "54", "EstimateLatencyMax" : "54",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "buffer_1_2_027", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_1_1_026", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_1_0_025", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_0_0_01", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_0_1_02", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_0_2_03", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_1_0_04", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_1_1_05", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_1_2_06", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_2_0_07", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_2_1_08", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_2_2_09", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_3_0_010", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_3_1_011", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_3_2_012", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_4_0_013", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_4_1_014", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_4_2_015", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_5_0_016", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_5_1_017", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_5_2_018", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_6_0_019", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_6_1_020", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_6_2_021", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_7_0_022", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_7_1_023", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_7_2_024", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_0_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_1_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_2_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_3_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_4_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_5_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_6_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_7_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_1_2_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "buffer_1_1_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "buffer_1_0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "layer1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter50", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter50", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bias_1_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U43", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U44", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U45", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U46", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U47", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U48", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U49", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U50", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_32_32_1_1_U52", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_32_32_1_1_U53", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_32_32_1_1_U54", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_32_32_1_1_U55", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_32_32_1_1_U56", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_32_32_1_1_U57", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_32_32_1_1_U58", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_32_32_1_1_U59", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mlp_dance3_Pipeline_layer1 {
		buffer_1_2_027 {Type I LastRead 0 FirstWrite -1}
		buffer_1_1_026 {Type I LastRead 0 FirstWrite -1}
		buffer_1_0_025 {Type I LastRead 0 FirstWrite -1}
		weights_1_0_0_01 {Type I LastRead 0 FirstWrite -1}
		weights_1_0_1_02 {Type I LastRead 0 FirstWrite -1}
		weights_1_0_2_03 {Type I LastRead 0 FirstWrite -1}
		weights_1_1_0_04 {Type I LastRead 0 FirstWrite -1}
		weights_1_1_1_05 {Type I LastRead 0 FirstWrite -1}
		weights_1_1_2_06 {Type I LastRead 0 FirstWrite -1}
		weights_1_2_0_07 {Type I LastRead 0 FirstWrite -1}
		weights_1_2_1_08 {Type I LastRead 0 FirstWrite -1}
		weights_1_2_2_09 {Type I LastRead 0 FirstWrite -1}
		weights_1_3_0_010 {Type I LastRead 0 FirstWrite -1}
		weights_1_3_1_011 {Type I LastRead 0 FirstWrite -1}
		weights_1_3_2_012 {Type I LastRead 0 FirstWrite -1}
		weights_1_4_0_013 {Type I LastRead 0 FirstWrite -1}
		weights_1_4_1_014 {Type I LastRead 0 FirstWrite -1}
		weights_1_4_2_015 {Type I LastRead 0 FirstWrite -1}
		weights_1_5_0_016 {Type I LastRead 0 FirstWrite -1}
		weights_1_5_1_017 {Type I LastRead 0 FirstWrite -1}
		weights_1_5_2_018 {Type I LastRead 0 FirstWrite -1}
		weights_1_6_0_019 {Type I LastRead 0 FirstWrite -1}
		weights_1_6_1_020 {Type I LastRead 0 FirstWrite -1}
		weights_1_6_2_021 {Type I LastRead 0 FirstWrite -1}
		weights_1_7_0_022 {Type I LastRead 0 FirstWrite -1}
		weights_1_7_1_023 {Type I LastRead 0 FirstWrite -1}
		weights_1_7_2_024 {Type I LastRead 0 FirstWrite -1}
		buffer_0_0_1_reload {Type I LastRead 0 FirstWrite -1}
		buffer_0_1_1_reload {Type I LastRead 0 FirstWrite -1}
		buffer_0_2_1_reload {Type I LastRead 0 FirstWrite -1}
		buffer_0_3_1_reload {Type I LastRead 0 FirstWrite -1}
		buffer_0_4_1_reload {Type I LastRead 0 FirstWrite -1}
		buffer_0_5_1_reload {Type I LastRead 0 FirstWrite -1}
		buffer_0_6_1_reload {Type I LastRead 0 FirstWrite -1}
		buffer_0_7_1_reload {Type I LastRead 0 FirstWrite -1}
		buffer_1_2_1_out {Type O LastRead -1 FirstWrite 49}
		buffer_1_1_1_out {Type O LastRead -1 FirstWrite 49}
		buffer_1_0_1_out {Type O LastRead -1 FirstWrite 49}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "54", "Max" : "54"}
	, {"Name" : "Interval", "Min" : "54", "Max" : "54"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	buffer_1_2_027 { ap_none {  { buffer_1_2_027 in_data 0 32 } } }
	buffer_1_1_026 { ap_none {  { buffer_1_1_026 in_data 0 32 } } }
	buffer_1_0_025 { ap_none {  { buffer_1_0_025 in_data 0 32 } } }
	weights_1_0_0_01 { ap_none {  { weights_1_0_0_01 in_data 0 32 } } }
	weights_1_0_1_02 { ap_none {  { weights_1_0_1_02 in_data 0 32 } } }
	weights_1_0_2_03 { ap_none {  { weights_1_0_2_03 in_data 0 32 } } }
	weights_1_1_0_04 { ap_none {  { weights_1_1_0_04 in_data 0 32 } } }
	weights_1_1_1_05 { ap_none {  { weights_1_1_1_05 in_data 0 32 } } }
	weights_1_1_2_06 { ap_none {  { weights_1_1_2_06 in_data 0 32 } } }
	weights_1_2_0_07 { ap_none {  { weights_1_2_0_07 in_data 0 32 } } }
	weights_1_2_1_08 { ap_none {  { weights_1_2_1_08 in_data 0 32 } } }
	weights_1_2_2_09 { ap_none {  { weights_1_2_2_09 in_data 0 32 } } }
	weights_1_3_0_010 { ap_none {  { weights_1_3_0_010 in_data 0 32 } } }
	weights_1_3_1_011 { ap_none {  { weights_1_3_1_011 in_data 0 32 } } }
	weights_1_3_2_012 { ap_none {  { weights_1_3_2_012 in_data 0 32 } } }
	weights_1_4_0_013 { ap_none {  { weights_1_4_0_013 in_data 0 32 } } }
	weights_1_4_1_014 { ap_none {  { weights_1_4_1_014 in_data 0 32 } } }
	weights_1_4_2_015 { ap_none {  { weights_1_4_2_015 in_data 0 32 } } }
	weights_1_5_0_016 { ap_none {  { weights_1_5_0_016 in_data 0 32 } } }
	weights_1_5_1_017 { ap_none {  { weights_1_5_1_017 in_data 0 32 } } }
	weights_1_5_2_018 { ap_none {  { weights_1_5_2_018 in_data 0 32 } } }
	weights_1_6_0_019 { ap_none {  { weights_1_6_0_019 in_data 0 32 } } }
	weights_1_6_1_020 { ap_none {  { weights_1_6_1_020 in_data 0 32 } } }
	weights_1_6_2_021 { ap_none {  { weights_1_6_2_021 in_data 0 32 } } }
	weights_1_7_0_022 { ap_none {  { weights_1_7_0_022 in_data 0 32 } } }
	weights_1_7_1_023 { ap_none {  { weights_1_7_1_023 in_data 0 32 } } }
	weights_1_7_2_024 { ap_none {  { weights_1_7_2_024 in_data 0 32 } } }
	buffer_0_0_1_reload { ap_none {  { buffer_0_0_1_reload in_data 0 32 } } }
	buffer_0_1_1_reload { ap_none {  { buffer_0_1_1_reload in_data 0 32 } } }
	buffer_0_2_1_reload { ap_none {  { buffer_0_2_1_reload in_data 0 32 } } }
	buffer_0_3_1_reload { ap_none {  { buffer_0_3_1_reload in_data 0 32 } } }
	buffer_0_4_1_reload { ap_none {  { buffer_0_4_1_reload in_data 0 32 } } }
	buffer_0_5_1_reload { ap_none {  { buffer_0_5_1_reload in_data 0 32 } } }
	buffer_0_6_1_reload { ap_none {  { buffer_0_6_1_reload in_data 0 32 } } }
	buffer_0_7_1_reload { ap_none {  { buffer_0_7_1_reload in_data 0 32 } } }
	buffer_1_2_1_out { ap_vld {  { buffer_1_2_1_out out_data 1 32 }  { buffer_1_2_1_out_ap_vld out_vld 1 1 } } }
	buffer_1_1_1_out { ap_vld {  { buffer_1_1_1_out out_data 1 32 }  { buffer_1_1_1_out_ap_vld out_vld 1 1 } } }
	buffer_1_0_1_out { ap_vld {  { buffer_1_0_1_out out_data 1 32 }  { buffer_1_0_1_out_ap_vld out_vld 1 1 } } }
}

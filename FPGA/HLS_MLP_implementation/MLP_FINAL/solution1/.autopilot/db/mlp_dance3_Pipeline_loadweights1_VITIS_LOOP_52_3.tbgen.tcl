set moduleName mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3
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
set C_modelName {mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ weights_1_7_2_024 float 32 regular  }
	{ weights_1_7_1_023 float 32 regular  }
	{ weights_1_7_0_022 float 32 regular  }
	{ weights_1_6_2_021 float 32 regular  }
	{ weights_1_6_1_020 float 32 regular  }
	{ weights_1_6_0_019 float 32 regular  }
	{ weights_1_5_2_018 float 32 regular  }
	{ weights_1_5_1_017 float 32 regular  }
	{ weights_1_5_0_016 float 32 regular  }
	{ weights_1_4_2_015 float 32 regular  }
	{ weights_1_4_1_014 float 32 regular  }
	{ weights_1_4_0_013 float 32 regular  }
	{ weights_1_3_2_012 float 32 regular  }
	{ weights_1_3_1_011 float 32 regular  }
	{ weights_1_3_0_010 float 32 regular  }
	{ weights_1_2_2_09 float 32 regular  }
	{ weights_1_2_1_08 float 32 regular  }
	{ weights_1_2_0_07 float 32 regular  }
	{ weights_1_1_2_06 float 32 regular  }
	{ weights_1_1_1_05 float 32 regular  }
	{ weights_1_1_0_04 float 32 regular  }
	{ weights_1_0_2_03 float 32 regular  }
	{ weights_1_0_1_02 float 32 regular  }
	{ weights_1_0_0_01 float 32 regular  }
	{ S_AXIS_V int 64 regular {axi_s 0 volatile  { S_AXIS_V Data } }  }
	{ weights_1_7_2_2_out float 32 regular {pointer 1}  }
	{ weights_1_7_1_2_out float 32 regular {pointer 1}  }
	{ weights_1_7_0_2_out float 32 regular {pointer 1}  }
	{ weights_1_6_2_2_out float 32 regular {pointer 1}  }
	{ weights_1_6_1_2_out float 32 regular {pointer 1}  }
	{ weights_1_6_0_2_out float 32 regular {pointer 1}  }
	{ weights_1_5_2_2_out float 32 regular {pointer 1}  }
	{ weights_1_5_1_2_out float 32 regular {pointer 1}  }
	{ weights_1_5_0_2_out float 32 regular {pointer 1}  }
	{ weights_1_4_2_2_out float 32 regular {pointer 1}  }
	{ weights_1_4_1_2_out float 32 regular {pointer 1}  }
	{ weights_1_4_0_2_out float 32 regular {pointer 1}  }
	{ weights_1_3_2_2_out float 32 regular {pointer 1}  }
	{ weights_1_3_1_2_out float 32 regular {pointer 1}  }
	{ weights_1_3_0_2_out float 32 regular {pointer 1}  }
	{ weights_1_2_2_2_out float 32 regular {pointer 1}  }
	{ weights_1_2_1_2_out float 32 regular {pointer 1}  }
	{ weights_1_2_0_2_out float 32 regular {pointer 1}  }
	{ weights_1_1_2_2_out float 32 regular {pointer 1}  }
	{ weights_1_1_1_2_out float 32 regular {pointer 1}  }
	{ weights_1_1_0_2_out float 32 regular {pointer 1}  }
	{ weights_1_0_2_2_out float 32 regular {pointer 1}  }
	{ weights_1_0_1_2_out float 32 regular {pointer 1}  }
	{ weights_1_0_0_2_out float 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "weights_1_7_2_024", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_7_1_023", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_7_0_022", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_6_2_021", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_6_1_020", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_6_0_019", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_5_2_018", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_5_1_017", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_5_0_016", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_4_2_015", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_4_1_014", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_4_0_013", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_3_2_012", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_3_1_011", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_3_0_010", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_2_2_09", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_2_1_08", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_2_0_07", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_1_2_06", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_1_1_05", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_1_0_04", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_0_2_03", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_0_1_02", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_0_0_01", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "S_AXIS_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1_7_2_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_7_1_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_7_0_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_6_2_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_6_1_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_6_0_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_5_2_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_5_1_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_5_0_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_4_2_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_4_1_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_4_0_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_3_2_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_3_1_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_3_0_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_2_2_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_2_1_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_2_0_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_1_2_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_1_1_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_1_0_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_0_2_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_0_1_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weights_1_0_0_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 81
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ S_AXIS_V_TVALID sc_in sc_logic 1 invld 24 } 
	{ weights_1_7_2_024 sc_in sc_lv 32 signal 0 } 
	{ weights_1_7_1_023 sc_in sc_lv 32 signal 1 } 
	{ weights_1_7_0_022 sc_in sc_lv 32 signal 2 } 
	{ weights_1_6_2_021 sc_in sc_lv 32 signal 3 } 
	{ weights_1_6_1_020 sc_in sc_lv 32 signal 4 } 
	{ weights_1_6_0_019 sc_in sc_lv 32 signal 5 } 
	{ weights_1_5_2_018 sc_in sc_lv 32 signal 6 } 
	{ weights_1_5_1_017 sc_in sc_lv 32 signal 7 } 
	{ weights_1_5_0_016 sc_in sc_lv 32 signal 8 } 
	{ weights_1_4_2_015 sc_in sc_lv 32 signal 9 } 
	{ weights_1_4_1_014 sc_in sc_lv 32 signal 10 } 
	{ weights_1_4_0_013 sc_in sc_lv 32 signal 11 } 
	{ weights_1_3_2_012 sc_in sc_lv 32 signal 12 } 
	{ weights_1_3_1_011 sc_in sc_lv 32 signal 13 } 
	{ weights_1_3_0_010 sc_in sc_lv 32 signal 14 } 
	{ weights_1_2_2_09 sc_in sc_lv 32 signal 15 } 
	{ weights_1_2_1_08 sc_in sc_lv 32 signal 16 } 
	{ weights_1_2_0_07 sc_in sc_lv 32 signal 17 } 
	{ weights_1_1_2_06 sc_in sc_lv 32 signal 18 } 
	{ weights_1_1_1_05 sc_in sc_lv 32 signal 19 } 
	{ weights_1_1_0_04 sc_in sc_lv 32 signal 20 } 
	{ weights_1_0_2_03 sc_in sc_lv 32 signal 21 } 
	{ weights_1_0_1_02 sc_in sc_lv 32 signal 22 } 
	{ weights_1_0_0_01 sc_in sc_lv 32 signal 23 } 
	{ S_AXIS_V_TDATA sc_in sc_lv 64 signal 24 } 
	{ S_AXIS_V_TREADY sc_out sc_logic 1 inacc 24 } 
	{ weights_1_7_2_2_out sc_out sc_lv 32 signal 25 } 
	{ weights_1_7_2_2_out_ap_vld sc_out sc_logic 1 outvld 25 } 
	{ weights_1_7_1_2_out sc_out sc_lv 32 signal 26 } 
	{ weights_1_7_1_2_out_ap_vld sc_out sc_logic 1 outvld 26 } 
	{ weights_1_7_0_2_out sc_out sc_lv 32 signal 27 } 
	{ weights_1_7_0_2_out_ap_vld sc_out sc_logic 1 outvld 27 } 
	{ weights_1_6_2_2_out sc_out sc_lv 32 signal 28 } 
	{ weights_1_6_2_2_out_ap_vld sc_out sc_logic 1 outvld 28 } 
	{ weights_1_6_1_2_out sc_out sc_lv 32 signal 29 } 
	{ weights_1_6_1_2_out_ap_vld sc_out sc_logic 1 outvld 29 } 
	{ weights_1_6_0_2_out sc_out sc_lv 32 signal 30 } 
	{ weights_1_6_0_2_out_ap_vld sc_out sc_logic 1 outvld 30 } 
	{ weights_1_5_2_2_out sc_out sc_lv 32 signal 31 } 
	{ weights_1_5_2_2_out_ap_vld sc_out sc_logic 1 outvld 31 } 
	{ weights_1_5_1_2_out sc_out sc_lv 32 signal 32 } 
	{ weights_1_5_1_2_out_ap_vld sc_out sc_logic 1 outvld 32 } 
	{ weights_1_5_0_2_out sc_out sc_lv 32 signal 33 } 
	{ weights_1_5_0_2_out_ap_vld sc_out sc_logic 1 outvld 33 } 
	{ weights_1_4_2_2_out sc_out sc_lv 32 signal 34 } 
	{ weights_1_4_2_2_out_ap_vld sc_out sc_logic 1 outvld 34 } 
	{ weights_1_4_1_2_out sc_out sc_lv 32 signal 35 } 
	{ weights_1_4_1_2_out_ap_vld sc_out sc_logic 1 outvld 35 } 
	{ weights_1_4_0_2_out sc_out sc_lv 32 signal 36 } 
	{ weights_1_4_0_2_out_ap_vld sc_out sc_logic 1 outvld 36 } 
	{ weights_1_3_2_2_out sc_out sc_lv 32 signal 37 } 
	{ weights_1_3_2_2_out_ap_vld sc_out sc_logic 1 outvld 37 } 
	{ weights_1_3_1_2_out sc_out sc_lv 32 signal 38 } 
	{ weights_1_3_1_2_out_ap_vld sc_out sc_logic 1 outvld 38 } 
	{ weights_1_3_0_2_out sc_out sc_lv 32 signal 39 } 
	{ weights_1_3_0_2_out_ap_vld sc_out sc_logic 1 outvld 39 } 
	{ weights_1_2_2_2_out sc_out sc_lv 32 signal 40 } 
	{ weights_1_2_2_2_out_ap_vld sc_out sc_logic 1 outvld 40 } 
	{ weights_1_2_1_2_out sc_out sc_lv 32 signal 41 } 
	{ weights_1_2_1_2_out_ap_vld sc_out sc_logic 1 outvld 41 } 
	{ weights_1_2_0_2_out sc_out sc_lv 32 signal 42 } 
	{ weights_1_2_0_2_out_ap_vld sc_out sc_logic 1 outvld 42 } 
	{ weights_1_1_2_2_out sc_out sc_lv 32 signal 43 } 
	{ weights_1_1_2_2_out_ap_vld sc_out sc_logic 1 outvld 43 } 
	{ weights_1_1_1_2_out sc_out sc_lv 32 signal 44 } 
	{ weights_1_1_1_2_out_ap_vld sc_out sc_logic 1 outvld 44 } 
	{ weights_1_1_0_2_out sc_out sc_lv 32 signal 45 } 
	{ weights_1_1_0_2_out_ap_vld sc_out sc_logic 1 outvld 45 } 
	{ weights_1_0_2_2_out sc_out sc_lv 32 signal 46 } 
	{ weights_1_0_2_2_out_ap_vld sc_out sc_logic 1 outvld 46 } 
	{ weights_1_0_1_2_out sc_out sc_lv 32 signal 47 } 
	{ weights_1_0_1_2_out_ap_vld sc_out sc_logic 1 outvld 47 } 
	{ weights_1_0_0_2_out sc_out sc_lv 32 signal 48 } 
	{ weights_1_0_0_2_out_ap_vld sc_out sc_logic 1 outvld 48 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "S_AXIS_V_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "S_AXIS_V", "role": "TVALID" }} , 
 	{ "name": "weights_1_7_2_024", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_7_2_024", "role": "default" }} , 
 	{ "name": "weights_1_7_1_023", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_7_1_023", "role": "default" }} , 
 	{ "name": "weights_1_7_0_022", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_7_0_022", "role": "default" }} , 
 	{ "name": "weights_1_6_2_021", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_6_2_021", "role": "default" }} , 
 	{ "name": "weights_1_6_1_020", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_6_1_020", "role": "default" }} , 
 	{ "name": "weights_1_6_0_019", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_6_0_019", "role": "default" }} , 
 	{ "name": "weights_1_5_2_018", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_5_2_018", "role": "default" }} , 
 	{ "name": "weights_1_5_1_017", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_5_1_017", "role": "default" }} , 
 	{ "name": "weights_1_5_0_016", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_5_0_016", "role": "default" }} , 
 	{ "name": "weights_1_4_2_015", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_4_2_015", "role": "default" }} , 
 	{ "name": "weights_1_4_1_014", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_4_1_014", "role": "default" }} , 
 	{ "name": "weights_1_4_0_013", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_4_0_013", "role": "default" }} , 
 	{ "name": "weights_1_3_2_012", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_3_2_012", "role": "default" }} , 
 	{ "name": "weights_1_3_1_011", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_3_1_011", "role": "default" }} , 
 	{ "name": "weights_1_3_0_010", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_3_0_010", "role": "default" }} , 
 	{ "name": "weights_1_2_2_09", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_2_2_09", "role": "default" }} , 
 	{ "name": "weights_1_2_1_08", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_2_1_08", "role": "default" }} , 
 	{ "name": "weights_1_2_0_07", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_2_0_07", "role": "default" }} , 
 	{ "name": "weights_1_1_2_06", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_1_2_06", "role": "default" }} , 
 	{ "name": "weights_1_1_1_05", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_1_1_05", "role": "default" }} , 
 	{ "name": "weights_1_1_0_04", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_1_0_04", "role": "default" }} , 
 	{ "name": "weights_1_0_2_03", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_0_2_03", "role": "default" }} , 
 	{ "name": "weights_1_0_1_02", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_0_1_02", "role": "default" }} , 
 	{ "name": "weights_1_0_0_01", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_0_0_01", "role": "default" }} , 
 	{ "name": "S_AXIS_V_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "S_AXIS_V", "role": "TDATA" }} , 
 	{ "name": "S_AXIS_V_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "S_AXIS_V", "role": "TREADY" }} , 
 	{ "name": "weights_1_7_2_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_7_2_2_out", "role": "default" }} , 
 	{ "name": "weights_1_7_2_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_7_2_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_7_1_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_7_1_2_out", "role": "default" }} , 
 	{ "name": "weights_1_7_1_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_7_1_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_7_0_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_7_0_2_out", "role": "default" }} , 
 	{ "name": "weights_1_7_0_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_7_0_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_6_2_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_6_2_2_out", "role": "default" }} , 
 	{ "name": "weights_1_6_2_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_6_2_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_6_1_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_6_1_2_out", "role": "default" }} , 
 	{ "name": "weights_1_6_1_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_6_1_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_6_0_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_6_0_2_out", "role": "default" }} , 
 	{ "name": "weights_1_6_0_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_6_0_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_5_2_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_5_2_2_out", "role": "default" }} , 
 	{ "name": "weights_1_5_2_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_5_2_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_5_1_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_5_1_2_out", "role": "default" }} , 
 	{ "name": "weights_1_5_1_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_5_1_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_5_0_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_5_0_2_out", "role": "default" }} , 
 	{ "name": "weights_1_5_0_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_5_0_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_4_2_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_4_2_2_out", "role": "default" }} , 
 	{ "name": "weights_1_4_2_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_4_2_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_4_1_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_4_1_2_out", "role": "default" }} , 
 	{ "name": "weights_1_4_1_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_4_1_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_4_0_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_4_0_2_out", "role": "default" }} , 
 	{ "name": "weights_1_4_0_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_4_0_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_3_2_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_3_2_2_out", "role": "default" }} , 
 	{ "name": "weights_1_3_2_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_3_2_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_3_1_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_3_1_2_out", "role": "default" }} , 
 	{ "name": "weights_1_3_1_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_3_1_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_3_0_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_3_0_2_out", "role": "default" }} , 
 	{ "name": "weights_1_3_0_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_3_0_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_2_2_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_2_2_2_out", "role": "default" }} , 
 	{ "name": "weights_1_2_2_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_2_2_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_2_1_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_2_1_2_out", "role": "default" }} , 
 	{ "name": "weights_1_2_1_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_2_1_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_2_0_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_2_0_2_out", "role": "default" }} , 
 	{ "name": "weights_1_2_0_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_2_0_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_1_2_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_1_2_2_out", "role": "default" }} , 
 	{ "name": "weights_1_1_2_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_1_2_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_1_1_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_1_1_2_out", "role": "default" }} , 
 	{ "name": "weights_1_1_1_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_1_1_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_1_0_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_1_0_2_out", "role": "default" }} , 
 	{ "name": "weights_1_1_0_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_1_0_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_0_2_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_0_2_2_out", "role": "default" }} , 
 	{ "name": "weights_1_0_2_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_0_2_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_0_1_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_0_1_2_out", "role": "default" }} , 
 	{ "name": "weights_1_0_1_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_0_1_2_out", "role": "ap_vld" }} , 
 	{ "name": "weights_1_0_0_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1_0_0_2_out", "role": "default" }} , 
 	{ "name": "weights_1_0_0_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "weights_1_0_0_2_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "26", "EstimateLatencyMax" : "26",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "weights_1_7_2_024", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_7_1_023", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_7_0_022", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_6_2_021", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_6_1_020", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_6_0_019", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_5_2_018", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_5_1_017", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_5_0_016", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_4_2_015", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_4_1_014", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_4_0_013", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_3_2_012", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_3_1_011", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_3_0_010", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_2_2_09", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_2_1_08", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_2_0_07", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_1_2_06", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_1_1_05", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_1_0_04", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_0_2_03", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_0_1_02", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_1_0_0_01", "Type" : "None", "Direction" : "I"},
			{"Name" : "S_AXIS_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "S_AXIS_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weights_1_7_2_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_7_1_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_7_0_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_6_2_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_6_1_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_6_0_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_5_2_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_5_1_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_5_0_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_4_2_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_4_1_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_4_0_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_3_2_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_3_1_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_3_0_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_2_2_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_2_1_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_2_0_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_1_2_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_1_1_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_1_0_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_0_2_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_0_1_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "weights_1_0_0_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loadweights1_VITIS_LOOP_52_3", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3 {
		weights_1_7_2_024 {Type I LastRead 0 FirstWrite -1}
		weights_1_7_1_023 {Type I LastRead 0 FirstWrite -1}
		weights_1_7_0_022 {Type I LastRead 0 FirstWrite -1}
		weights_1_6_2_021 {Type I LastRead 0 FirstWrite -1}
		weights_1_6_1_020 {Type I LastRead 0 FirstWrite -1}
		weights_1_6_0_019 {Type I LastRead 0 FirstWrite -1}
		weights_1_5_2_018 {Type I LastRead 0 FirstWrite -1}
		weights_1_5_1_017 {Type I LastRead 0 FirstWrite -1}
		weights_1_5_0_016 {Type I LastRead 0 FirstWrite -1}
		weights_1_4_2_015 {Type I LastRead 0 FirstWrite -1}
		weights_1_4_1_014 {Type I LastRead 0 FirstWrite -1}
		weights_1_4_0_013 {Type I LastRead 0 FirstWrite -1}
		weights_1_3_2_012 {Type I LastRead 0 FirstWrite -1}
		weights_1_3_1_011 {Type I LastRead 0 FirstWrite -1}
		weights_1_3_0_010 {Type I LastRead 0 FirstWrite -1}
		weights_1_2_2_09 {Type I LastRead 0 FirstWrite -1}
		weights_1_2_1_08 {Type I LastRead 0 FirstWrite -1}
		weights_1_2_0_07 {Type I LastRead 0 FirstWrite -1}
		weights_1_1_2_06 {Type I LastRead 0 FirstWrite -1}
		weights_1_1_1_05 {Type I LastRead 0 FirstWrite -1}
		weights_1_1_0_04 {Type I LastRead 0 FirstWrite -1}
		weights_1_0_2_03 {Type I LastRead 0 FirstWrite -1}
		weights_1_0_1_02 {Type I LastRead 0 FirstWrite -1}
		weights_1_0_0_01 {Type I LastRead 0 FirstWrite -1}
		S_AXIS_V {Type I LastRead 0 FirstWrite -1}
		weights_1_7_2_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_7_1_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_7_0_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_6_2_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_6_1_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_6_0_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_5_2_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_5_1_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_5_0_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_4_2_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_4_1_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_4_0_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_3_2_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_3_1_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_3_0_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_2_2_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_2_1_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_2_0_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_1_2_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_1_1_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_1_0_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_0_2_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_0_1_2_out {Type O LastRead -1 FirstWrite 0}
		weights_1_0_0_2_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "26", "Max" : "26"}
	, {"Name" : "Interval", "Min" : "26", "Max" : "26"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	weights_1_7_2_024 { ap_none {  { weights_1_7_2_024 in_data 0 32 } } }
	weights_1_7_1_023 { ap_none {  { weights_1_7_1_023 in_data 0 32 } } }
	weights_1_7_0_022 { ap_none {  { weights_1_7_0_022 in_data 0 32 } } }
	weights_1_6_2_021 { ap_none {  { weights_1_6_2_021 in_data 0 32 } } }
	weights_1_6_1_020 { ap_none {  { weights_1_6_1_020 in_data 0 32 } } }
	weights_1_6_0_019 { ap_none {  { weights_1_6_0_019 in_data 0 32 } } }
	weights_1_5_2_018 { ap_none {  { weights_1_5_2_018 in_data 0 32 } } }
	weights_1_5_1_017 { ap_none {  { weights_1_5_1_017 in_data 0 32 } } }
	weights_1_5_0_016 { ap_none {  { weights_1_5_0_016 in_data 0 32 } } }
	weights_1_4_2_015 { ap_none {  { weights_1_4_2_015 in_data 0 32 } } }
	weights_1_4_1_014 { ap_none {  { weights_1_4_1_014 in_data 0 32 } } }
	weights_1_4_0_013 { ap_none {  { weights_1_4_0_013 in_data 0 32 } } }
	weights_1_3_2_012 { ap_none {  { weights_1_3_2_012 in_data 0 32 } } }
	weights_1_3_1_011 { ap_none {  { weights_1_3_1_011 in_data 0 32 } } }
	weights_1_3_0_010 { ap_none {  { weights_1_3_0_010 in_data 0 32 } } }
	weights_1_2_2_09 { ap_none {  { weights_1_2_2_09 in_data 0 32 } } }
	weights_1_2_1_08 { ap_none {  { weights_1_2_1_08 in_data 0 32 } } }
	weights_1_2_0_07 { ap_none {  { weights_1_2_0_07 in_data 0 32 } } }
	weights_1_1_2_06 { ap_none {  { weights_1_1_2_06 in_data 0 32 } } }
	weights_1_1_1_05 { ap_none {  { weights_1_1_1_05 in_data 0 32 } } }
	weights_1_1_0_04 { ap_none {  { weights_1_1_0_04 in_data 0 32 } } }
	weights_1_0_2_03 { ap_none {  { weights_1_0_2_03 in_data 0 32 } } }
	weights_1_0_1_02 { ap_none {  { weights_1_0_1_02 in_data 0 32 } } }
	weights_1_0_0_01 { ap_none {  { weights_1_0_0_01 in_data 0 32 } } }
	S_AXIS_V { axis {  { S_AXIS_V_TVALID in_vld 0 1 }  { S_AXIS_V_TDATA in_data 0 64 }  { S_AXIS_V_TREADY in_acc 1 1 } } }
	weights_1_7_2_2_out { ap_vld {  { weights_1_7_2_2_out out_data 1 32 }  { weights_1_7_2_2_out_ap_vld out_vld 1 1 } } }
	weights_1_7_1_2_out { ap_vld {  { weights_1_7_1_2_out out_data 1 32 }  { weights_1_7_1_2_out_ap_vld out_vld 1 1 } } }
	weights_1_7_0_2_out { ap_vld {  { weights_1_7_0_2_out out_data 1 32 }  { weights_1_7_0_2_out_ap_vld out_vld 1 1 } } }
	weights_1_6_2_2_out { ap_vld {  { weights_1_6_2_2_out out_data 1 32 }  { weights_1_6_2_2_out_ap_vld out_vld 1 1 } } }
	weights_1_6_1_2_out { ap_vld {  { weights_1_6_1_2_out out_data 1 32 }  { weights_1_6_1_2_out_ap_vld out_vld 1 1 } } }
	weights_1_6_0_2_out { ap_vld {  { weights_1_6_0_2_out out_data 1 32 }  { weights_1_6_0_2_out_ap_vld out_vld 1 1 } } }
	weights_1_5_2_2_out { ap_vld {  { weights_1_5_2_2_out out_data 1 32 }  { weights_1_5_2_2_out_ap_vld out_vld 1 1 } } }
	weights_1_5_1_2_out { ap_vld {  { weights_1_5_1_2_out out_data 1 32 }  { weights_1_5_1_2_out_ap_vld out_vld 1 1 } } }
	weights_1_5_0_2_out { ap_vld {  { weights_1_5_0_2_out out_data 1 32 }  { weights_1_5_0_2_out_ap_vld out_vld 1 1 } } }
	weights_1_4_2_2_out { ap_vld {  { weights_1_4_2_2_out out_data 1 32 }  { weights_1_4_2_2_out_ap_vld out_vld 1 1 } } }
	weights_1_4_1_2_out { ap_vld {  { weights_1_4_1_2_out out_data 1 32 }  { weights_1_4_1_2_out_ap_vld out_vld 1 1 } } }
	weights_1_4_0_2_out { ap_vld {  { weights_1_4_0_2_out out_data 1 32 }  { weights_1_4_0_2_out_ap_vld out_vld 1 1 } } }
	weights_1_3_2_2_out { ap_vld {  { weights_1_3_2_2_out out_data 1 32 }  { weights_1_3_2_2_out_ap_vld out_vld 1 1 } } }
	weights_1_3_1_2_out { ap_vld {  { weights_1_3_1_2_out out_data 1 32 }  { weights_1_3_1_2_out_ap_vld out_vld 1 1 } } }
	weights_1_3_0_2_out { ap_vld {  { weights_1_3_0_2_out out_data 1 32 }  { weights_1_3_0_2_out_ap_vld out_vld 1 1 } } }
	weights_1_2_2_2_out { ap_vld {  { weights_1_2_2_2_out out_data 1 32 }  { weights_1_2_2_2_out_ap_vld out_vld 1 1 } } }
	weights_1_2_1_2_out { ap_vld {  { weights_1_2_1_2_out out_data 1 32 }  { weights_1_2_1_2_out_ap_vld out_vld 1 1 } } }
	weights_1_2_0_2_out { ap_vld {  { weights_1_2_0_2_out out_data 1 32 }  { weights_1_2_0_2_out_ap_vld out_vld 1 1 } } }
	weights_1_1_2_2_out { ap_vld {  { weights_1_1_2_2_out out_data 1 32 }  { weights_1_1_2_2_out_ap_vld out_vld 1 1 } } }
	weights_1_1_1_2_out { ap_vld {  { weights_1_1_1_2_out out_data 1 32 }  { weights_1_1_1_2_out_ap_vld out_vld 1 1 } } }
	weights_1_1_0_2_out { ap_vld {  { weights_1_1_0_2_out out_data 1 32 }  { weights_1_1_0_2_out_ap_vld out_vld 1 1 } } }
	weights_1_0_2_2_out { ap_vld {  { weights_1_0_2_2_out out_data 1 32 }  { weights_1_0_2_2_out_ap_vld out_vld 1 1 } } }
	weights_1_0_1_2_out { ap_vld {  { weights_1_0_1_2_out out_data 1 32 }  { weights_1_0_1_2_out_ap_vld out_vld 1 1 } } }
	weights_1_0_0_2_out { ap_vld {  { weights_1_0_0_2_out out_data 1 32 }  { weights_1_0_0_2_out_ap_vld out_vld 1 1 } } }
}

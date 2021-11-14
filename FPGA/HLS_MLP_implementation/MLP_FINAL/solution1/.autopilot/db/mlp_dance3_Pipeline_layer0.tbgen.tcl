set moduleName mlp_dance3_Pipeline_layer0
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
set C_modelName {mlp_dance3_Pipeline_layer0}
set C_modelType { void 0 }
set C_modelArgList {
	{ buffer_0_7_0553 float 32 regular  }
	{ buffer_0_6_0552 float 32 regular  }
	{ buffer_0_5_0551 float 32 regular  }
	{ buffer_0_4_0550 float 32 regular  }
	{ buffer_0_3_0549 float 32 regular  }
	{ buffer_0_2_0548 float 32 regular  }
	{ buffer_0_1_0547 float 32 regular  }
	{ buffer_0_0_0546 float 32 regular  }
	{ input_r float 32 regular {array 78 { 1 1 } 1 1 }  }
	{ weights_0 float 32 regular {array 624 { 1 1 } 1 1 }  }
	{ bias_0 float 32 regular {array 78 { 1 3 } 1 1 }  }
	{ buffer_0_7_1_out float 32 regular {pointer 1}  }
	{ buffer_0_6_1_out float 32 regular {pointer 1}  }
	{ buffer_0_5_1_out float 32 regular {pointer 1}  }
	{ buffer_0_4_1_out float 32 regular {pointer 1}  }
	{ buffer_0_3_1_out float 32 regular {pointer 1}  }
	{ buffer_0_2_1_out float 32 regular {pointer 1}  }
	{ buffer_0_1_1_out float 32 regular {pointer 1}  }
	{ buffer_0_0_1_out float 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "buffer_0_7_0553", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_6_0552", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_5_0551", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_4_0550", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_3_0549", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_2_0548", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_1_0547", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_0_0546", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "input_r", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "bias_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_0_7_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "buffer_0_6_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "buffer_0_5_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "buffer_0_4_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "buffer_0_3_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "buffer_0_2_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "buffer_0_1_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "buffer_0_0_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 55
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ buffer_0_7_0553 sc_in sc_lv 32 signal 0 } 
	{ buffer_0_6_0552 sc_in sc_lv 32 signal 1 } 
	{ buffer_0_5_0551 sc_in sc_lv 32 signal 2 } 
	{ buffer_0_4_0550 sc_in sc_lv 32 signal 3 } 
	{ buffer_0_3_0549 sc_in sc_lv 32 signal 4 } 
	{ buffer_0_2_0548 sc_in sc_lv 32 signal 5 } 
	{ buffer_0_1_0547 sc_in sc_lv 32 signal 6 } 
	{ buffer_0_0_0546 sc_in sc_lv 32 signal 7 } 
	{ input_r_address0 sc_out sc_lv 7 signal 8 } 
	{ input_r_ce0 sc_out sc_logic 1 signal 8 } 
	{ input_r_q0 sc_in sc_lv 32 signal 8 } 
	{ input_r_address1 sc_out sc_lv 7 signal 8 } 
	{ input_r_ce1 sc_out sc_logic 1 signal 8 } 
	{ input_r_q1 sc_in sc_lv 32 signal 8 } 
	{ weights_0_address0 sc_out sc_lv 10 signal 9 } 
	{ weights_0_ce0 sc_out sc_logic 1 signal 9 } 
	{ weights_0_q0 sc_in sc_lv 32 signal 9 } 
	{ weights_0_address1 sc_out sc_lv 10 signal 9 } 
	{ weights_0_ce1 sc_out sc_logic 1 signal 9 } 
	{ weights_0_q1 sc_in sc_lv 32 signal 9 } 
	{ bias_0_address0 sc_out sc_lv 7 signal 10 } 
	{ bias_0_ce0 sc_out sc_logic 1 signal 10 } 
	{ bias_0_q0 sc_in sc_lv 32 signal 10 } 
	{ buffer_0_7_1_out sc_out sc_lv 32 signal 11 } 
	{ buffer_0_7_1_out_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ buffer_0_6_1_out sc_out sc_lv 32 signal 12 } 
	{ buffer_0_6_1_out_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ buffer_0_5_1_out sc_out sc_lv 32 signal 13 } 
	{ buffer_0_5_1_out_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ buffer_0_4_1_out sc_out sc_lv 32 signal 14 } 
	{ buffer_0_4_1_out_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ buffer_0_3_1_out sc_out sc_lv 32 signal 15 } 
	{ buffer_0_3_1_out_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ buffer_0_2_1_out sc_out sc_lv 32 signal 16 } 
	{ buffer_0_2_1_out_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ buffer_0_1_1_out sc_out sc_lv 32 signal 17 } 
	{ buffer_0_1_1_out_ap_vld sc_out sc_logic 1 outvld 17 } 
	{ buffer_0_0_1_out sc_out sc_lv 32 signal 18 } 
	{ buffer_0_0_1_out_ap_vld sc_out sc_logic 1 outvld 18 } 
	{ grp_fu_1742_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1742_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1742_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1742_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1742_p_ce sc_out sc_logic 1 signal -1 } 
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
 	{ "name": "buffer_0_7_0553", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_7_0553", "role": "default" }} , 
 	{ "name": "buffer_0_6_0552", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_6_0552", "role": "default" }} , 
 	{ "name": "buffer_0_5_0551", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_5_0551", "role": "default" }} , 
 	{ "name": "buffer_0_4_0550", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_4_0550", "role": "default" }} , 
 	{ "name": "buffer_0_3_0549", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_3_0549", "role": "default" }} , 
 	{ "name": "buffer_0_2_0548", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_2_0548", "role": "default" }} , 
 	{ "name": "buffer_0_1_0547", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_1_0547", "role": "default" }} , 
 	{ "name": "buffer_0_0_0546", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_0_0546", "role": "default" }} , 
 	{ "name": "input_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "input_r", "role": "address0" }} , 
 	{ "name": "input_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce0" }} , 
 	{ "name": "input_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "input_r", "role": "q0" }} , 
 	{ "name": "input_r_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "input_r", "role": "address1" }} , 
 	{ "name": "input_r_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce1" }} , 
 	{ "name": "input_r_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "input_r", "role": "q1" }} , 
 	{ "name": "weights_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "weights_0", "role": "address0" }} , 
 	{ "name": "weights_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights_0", "role": "ce0" }} , 
 	{ "name": "weights_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_0", "role": "q0" }} , 
 	{ "name": "weights_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "weights_0", "role": "address1" }} , 
 	{ "name": "weights_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights_0", "role": "ce1" }} , 
 	{ "name": "weights_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_0", "role": "q1" }} , 
 	{ "name": "bias_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "bias_0", "role": "address0" }} , 
 	{ "name": "bias_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_0", "role": "ce0" }} , 
 	{ "name": "bias_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bias_0", "role": "q0" }} , 
 	{ "name": "buffer_0_7_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_7_1_out", "role": "default" }} , 
 	{ "name": "buffer_0_7_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "buffer_0_7_1_out", "role": "ap_vld" }} , 
 	{ "name": "buffer_0_6_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_6_1_out", "role": "default" }} , 
 	{ "name": "buffer_0_6_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "buffer_0_6_1_out", "role": "ap_vld" }} , 
 	{ "name": "buffer_0_5_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_5_1_out", "role": "default" }} , 
 	{ "name": "buffer_0_5_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "buffer_0_5_1_out", "role": "ap_vld" }} , 
 	{ "name": "buffer_0_4_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_4_1_out", "role": "default" }} , 
 	{ "name": "buffer_0_4_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "buffer_0_4_1_out", "role": "ap_vld" }} , 
 	{ "name": "buffer_0_3_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_3_1_out", "role": "default" }} , 
 	{ "name": "buffer_0_3_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "buffer_0_3_1_out", "role": "ap_vld" }} , 
 	{ "name": "buffer_0_2_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_2_1_out", "role": "default" }} , 
 	{ "name": "buffer_0_2_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "buffer_0_2_1_out", "role": "ap_vld" }} , 
 	{ "name": "buffer_0_1_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_1_1_out", "role": "default" }} , 
 	{ "name": "buffer_0_1_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "buffer_0_1_1_out", "role": "ap_vld" }} , 
 	{ "name": "buffer_0_0_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_0_0_1_out", "role": "default" }} , 
 	{ "name": "buffer_0_0_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "buffer_0_0_1_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_1742_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1742_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1742_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1742_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1742_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1742_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1742_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1742_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1742_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1742_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_554_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_554_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_554_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_554_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_554_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_554_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_554_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_554_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_554_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_554_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "7"],
		"CDFG" : "mlp_dance3_Pipeline_layer0",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "677", "EstimateLatencyMax" : "677",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "buffer_0_7_0553", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_6_0552", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_5_0551", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_4_0550", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_3_0549", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_2_0548", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_1_0547", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_0_0_0546", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_calculate_fu_249", "Port" : "a", "Inst_start_state" : "2", "Inst_end_state" : "396"}]},
			{"Name" : "weights_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_calculate_fu_249", "Port" : "b", "Inst_start_state" : "2", "Inst_end_state" : "396"}]},
			{"Name" : "bias_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "buffer_0_7_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "buffer_0_6_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "buffer_0_5_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "buffer_0_4_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "buffer_0_3_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "buffer_0_2_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "buffer_0_1_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "buffer_0_0_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "layer0", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "39", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage12", "LastStateIter" : "ap_enable_reg_pp0_iter10", "LastStateBlock" : "ap_block_pp0_stage12_subdone", "QuitState" : "ap_ST_fsm_pp0_stage12", "QuitStateIter" : "ap_enable_reg_pp0_iter10", "QuitStateBlock" : "ap_block_pp0_stage12_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_calculate_fu_249", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6"],
		"CDFG" : "calculate",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "39",
		"VariableLatency" : "0", "ExactLatency" : "394", "EstimateLatencyMin" : "394", "EstimateLatencyMax" : "394",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "b", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "b_offset", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_calculate_fu_249.fadd_32ns_32ns_32_5_full_dsp_1_U1", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_calculate_fu_249.fadd_32ns_32ns_32_5_full_dsp_1_U2", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_calculate_fu_249.fmul_32ns_32ns_32_4_max_dsp_1_U3", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_calculate_fu_249.fmul_32ns_32ns_32_4_max_dsp_1_U4", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_calculate_fu_249.mul_3ns_8ns_10_1_1_U5", "Parent" : "1"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mlp_dance3_Pipeline_layer0 {
		buffer_0_7_0553 {Type I LastRead 0 FirstWrite -1}
		buffer_0_6_0552 {Type I LastRead 0 FirstWrite -1}
		buffer_0_5_0551 {Type I LastRead 0 FirstWrite -1}
		buffer_0_4_0550 {Type I LastRead 0 FirstWrite -1}
		buffer_0_3_0549 {Type I LastRead 0 FirstWrite -1}
		buffer_0_2_0548 {Type I LastRead 0 FirstWrite -1}
		buffer_0_1_0547 {Type I LastRead 0 FirstWrite -1}
		buffer_0_0_0546 {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 39 FirstWrite -1}
		weights_0 {Type I LastRead 39 FirstWrite -1}
		bias_0 {Type I LastRead 390 FirstWrite -1}
		buffer_0_7_1_out {Type O LastRead -1 FirstWrite 363}
		buffer_0_6_1_out {Type O LastRead -1 FirstWrite 363}
		buffer_0_5_1_out {Type O LastRead -1 FirstWrite 363}
		buffer_0_4_1_out {Type O LastRead -1 FirstWrite 363}
		buffer_0_3_1_out {Type O LastRead -1 FirstWrite 363}
		buffer_0_2_1_out {Type O LastRead -1 FirstWrite 363}
		buffer_0_1_1_out {Type O LastRead -1 FirstWrite 363}
		buffer_0_0_1_out {Type O LastRead -1 FirstWrite 363}}
	calculate {
		a {Type I LastRead 39 FirstWrite -1}
		b {Type I LastRead 39 FirstWrite -1}
		b_offset {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "677", "Max" : "677"}
	, {"Name" : "Interval", "Min" : "677", "Max" : "677"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	buffer_0_7_0553 { ap_none {  { buffer_0_7_0553 in_data 0 32 } } }
	buffer_0_6_0552 { ap_none {  { buffer_0_6_0552 in_data 0 32 } } }
	buffer_0_5_0551 { ap_none {  { buffer_0_5_0551 in_data 0 32 } } }
	buffer_0_4_0550 { ap_none {  { buffer_0_4_0550 in_data 0 32 } } }
	buffer_0_3_0549 { ap_none {  { buffer_0_3_0549 in_data 0 32 } } }
	buffer_0_2_0548 { ap_none {  { buffer_0_2_0548 in_data 0 32 } } }
	buffer_0_1_0547 { ap_none {  { buffer_0_1_0547 in_data 0 32 } } }
	buffer_0_0_0546 { ap_none {  { buffer_0_0_0546 in_data 0 32 } } }
	input_r { ap_memory {  { input_r_address0 mem_address 1 7 }  { input_r_ce0 mem_ce 1 1 }  { input_r_q0 mem_dout 0 32 }  { input_r_address1 MemPortADDR2 1 7 }  { input_r_ce1 MemPortCE2 1 1 }  { input_r_q1 MemPortDOUT2 0 32 } } }
	weights_0 { ap_memory {  { weights_0_address0 mem_address 1 10 }  { weights_0_ce0 mem_ce 1 1 }  { weights_0_q0 mem_dout 0 32 }  { weights_0_address1 MemPortADDR2 1 10 }  { weights_0_ce1 MemPortCE2 1 1 }  { weights_0_q1 MemPortDOUT2 0 32 } } }
	bias_0 { ap_memory {  { bias_0_address0 mem_address 1 7 }  { bias_0_ce0 mem_ce 1 1 }  { bias_0_q0 mem_dout 0 32 } } }
	buffer_0_7_1_out { ap_vld {  { buffer_0_7_1_out out_data 1 32 }  { buffer_0_7_1_out_ap_vld out_vld 1 1 } } }
	buffer_0_6_1_out { ap_vld {  { buffer_0_6_1_out out_data 1 32 }  { buffer_0_6_1_out_ap_vld out_vld 1 1 } } }
	buffer_0_5_1_out { ap_vld {  { buffer_0_5_1_out out_data 1 32 }  { buffer_0_5_1_out_ap_vld out_vld 1 1 } } }
	buffer_0_4_1_out { ap_vld {  { buffer_0_4_1_out out_data 1 32 }  { buffer_0_4_1_out_ap_vld out_vld 1 1 } } }
	buffer_0_3_1_out { ap_vld {  { buffer_0_3_1_out out_data 1 32 }  { buffer_0_3_1_out_ap_vld out_vld 1 1 } } }
	buffer_0_2_1_out { ap_vld {  { buffer_0_2_1_out out_data 1 32 }  { buffer_0_2_1_out_ap_vld out_vld 1 1 } } }
	buffer_0_1_1_out { ap_vld {  { buffer_0_1_1_out out_data 1 32 }  { buffer_0_1_1_out_ap_vld out_vld 1 1 } } }
	buffer_0_0_1_out { ap_vld {  { buffer_0_0_1_out out_data 1 32 }  { buffer_0_0_1_out_ap_vld out_vld 1 1 } } }
}

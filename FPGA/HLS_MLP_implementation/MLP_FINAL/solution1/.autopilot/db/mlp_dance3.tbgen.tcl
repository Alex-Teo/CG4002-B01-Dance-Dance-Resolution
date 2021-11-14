set moduleName mlp_dance3
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {mlp_dance3}
set C_modelType { void 0 }
set C_modelArgList {
	{ S_AXIS_V int 64 regular {axi_s 0 volatile  { S_AXIS_V Data } }  }
	{ M_AXIS_V int 64 regular {axi_s 1 volatile  { M_AXIS_V Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "S_AXIS_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "M_AXIS_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 8
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ S_AXIS_V_TDATA sc_in sc_lv 64 signal 0 } 
	{ S_AXIS_V_TVALID sc_in sc_logic 1 invld 0 } 
	{ S_AXIS_V_TREADY sc_out sc_logic 1 inacc 0 } 
	{ M_AXIS_V_TDATA sc_out sc_lv 64 signal 1 } 
	{ M_AXIS_V_TVALID sc_out sc_logic 1 outvld 1 } 
	{ M_AXIS_V_TREADY sc_in sc_logic 1 outacc 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "S_AXIS_V_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "S_AXIS_V", "role": "TDATA" }} , 
 	{ "name": "S_AXIS_V_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "S_AXIS_V", "role": "TVALID" }} , 
 	{ "name": "S_AXIS_V_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "S_AXIS_V", "role": "TREADY" }} , 
 	{ "name": "M_AXIS_V_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "M_AXIS_V", "role": "TDATA" }} , 
 	{ "name": "M_AXIS_V_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "M_AXIS_V", "role": "TVALID" }} , 
 	{ "name": "M_AXIS_V_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "M_AXIS_V", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "12", "14", "17", "36", "39", "41", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54"],
		"CDFG" : "mlp_dance3",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "S_AXIS_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "S_AXIS_V_TDATA_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_mlp_dance3_Pipeline_loadbias0_fu_547", "Port" : "S_AXIS_V", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "39", "SubInstance" : "grp_mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3_fu_493", "Port" : "S_AXIS_V", "Inst_start_state" : "13", "Inst_end_state" : "14"},
					{"ID" : "14", "SubInstance" : "grp_mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2_fu_435", "Port" : "S_AXIS_V", "Inst_start_state" : "2", "Inst_end_state" : "11"},
					{"ID" : "12", "SubInstance" : "grp_mlp_dance3_Pipeline_retrieve_inputs_fu_428", "Port" : "S_AXIS_V", "Inst_start_state" : "2", "Inst_end_state" : "8"}]},
			{"Name" : "M_AXIS_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_mlp_dance3_Pipeline_output_fu_484", "Port" : "M_AXIS_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_42_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "18", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state17"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.input_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bias_0_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer0_fu_405", "Parent" : "0", "Child" : ["5", "11"],
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
					{"ID" : "5", "SubInstance" : "grp_calculate_fu_249", "Port" : "a", "Inst_start_state" : "2", "Inst_end_state" : "396"}]},
			{"Name" : "weights_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_calculate_fu_249", "Port" : "b", "Inst_start_state" : "2", "Inst_end_state" : "396"}]},
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
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer0_fu_405.grp_calculate_fu_249", "Parent" : "4", "Child" : ["6", "7", "8", "9", "10"],
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
	{"ID" : "6", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer0_fu_405.grp_calculate_fu_249.fadd_32ns_32ns_32_5_full_dsp_1_U1", "Parent" : "5"},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer0_fu_405.grp_calculate_fu_249.fadd_32ns_32ns_32_5_full_dsp_1_U2", "Parent" : "5"},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer0_fu_405.grp_calculate_fu_249.fmul_32ns_32ns_32_4_max_dsp_1_U3", "Parent" : "5"},
	{"ID" : "9", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer0_fu_405.grp_calculate_fu_249.fmul_32ns_32ns_32_4_max_dsp_1_U4", "Parent" : "5"},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer0_fu_405.grp_calculate_fu_249.mul_3ns_8ns_10_1_1_U5", "Parent" : "5"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer0_fu_405.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_retrieve_inputs_fu_428", "Parent" : "0", "Child" : ["13"],
		"CDFG" : "mlp_dance3_Pipeline_retrieve_inputs",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "80", "EstimateLatencyMax" : "80",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "S_AXIS_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "S_AXIS_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "retrieve_inputs", "PipelineType" : "NotSupport"}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_retrieve_inputs_fu_428.flow_control_loop_pipe_sequential_init_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2_fu_435", "Parent" : "0", "Child" : ["15", "16"],
		"CDFG" : "mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "628", "EstimateLatencyMax" : "628",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "weights_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "S_AXIS_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "S_AXIS_V_TDATA_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "loadweights0_VITIS_LOOP_46_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2_fu_435.mac_muladd_4ns_7ns_7ns_10_4_1_U107", "Parent" : "14"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2_fu_435.flow_control_loop_pipe_sequential_init_U", "Parent" : "14"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442", "Parent" : "0", "Child" : ["18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35"],
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
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.bias_1_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.fmul_32ns_32ns_32_4_max_dsp_1_U43", "Parent" : "17"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.fmul_32ns_32ns_32_4_max_dsp_1_U44", "Parent" : "17"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.fmul_32ns_32ns_32_4_max_dsp_1_U45", "Parent" : "17"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.fmul_32ns_32ns_32_4_max_dsp_1_U46", "Parent" : "17"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.fmul_32ns_32ns_32_4_max_dsp_1_U47", "Parent" : "17"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.fmul_32ns_32ns_32_4_max_dsp_1_U48", "Parent" : "17"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.fmul_32ns_32ns_32_4_max_dsp_1_U49", "Parent" : "17"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.fmul_32ns_32ns_32_4_max_dsp_1_U50", "Parent" : "17"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.mux_32_32_1_1_U52", "Parent" : "17"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.mux_32_32_1_1_U53", "Parent" : "17"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.mux_32_32_1_1_U54", "Parent" : "17"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.mux_32_32_1_1_U55", "Parent" : "17"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.mux_32_32_1_1_U56", "Parent" : "17"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.mux_32_32_1_1_U57", "Parent" : "17"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.mux_32_32_1_1_U58", "Parent" : "17"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.mux_32_32_1_1_U59", "Parent" : "17"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_layer1_fu_442.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_output_fu_484", "Parent" : "0", "Child" : ["37", "38"],
		"CDFG" : "mlp_dance3_Pipeline_output",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "buffer_1_0_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_1_1_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_1_2_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "M_AXIS_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "M_AXIS_V_TDATA_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "output", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_output_fu_484.mux_32_32_1_1_U100", "Parent" : "36"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_output_fu_484.flow_control_loop_pipe_sequential_init_U", "Parent" : "36"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3_fu_493", "Parent" : "0", "Child" : ["40"],
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
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3_fu_493.flow_control_loop_pipe_sequential_init_U", "Parent" : "39"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_loadbias0_fu_547", "Parent" : "0", "Child" : ["42"],
		"CDFG" : "mlp_dance3_Pipeline_loadbias0",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "10",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "S_AXIS_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "S_AXIS_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "bias_0", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "loadbias0", "PipelineType" : "NotSupport"}]},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mlp_dance3_Pipeline_loadbias0_fu_547.flow_control_loop_pipe_sequential_init_U", "Parent" : "41"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U162", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U163", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U164", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U165", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U166", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U167", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U168", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U169", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U170", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U171", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_S_AXIS_V_U", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_M_AXIS_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mlp_dance3 {
		S_AXIS_V {Type I LastRead 5 FirstWrite -1}
		M_AXIS_V {Type O LastRead -1 FirstWrite 1}}
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
		b_offset {Type I LastRead 0 FirstWrite -1}}
	mlp_dance3_Pipeline_retrieve_inputs {
		S_AXIS_V {Type I LastRead 0 FirstWrite -1}
		input_r {Type O LastRead -1 FirstWrite 0}}
	mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2 {
		weights_0 {Type O LastRead -1 FirstWrite 3}
		S_AXIS_V {Type I LastRead 0 FirstWrite -1}}
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
		buffer_1_0_1_out {Type O LastRead -1 FirstWrite 49}}
	mlp_dance3_Pipeline_output {
		buffer_1_0_1_reload {Type I LastRead 0 FirstWrite -1}
		buffer_1_1_1_reload {Type I LastRead 0 FirstWrite -1}
		buffer_1_2_1_reload {Type I LastRead 0 FirstWrite -1}
		M_AXIS_V {Type O LastRead -1 FirstWrite 1}}
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
		weights_1_0_0_2_out {Type O LastRead -1 FirstWrite 0}}
	mlp_dance3_Pipeline_loadbias0 {
		S_AXIS_V {Type I LastRead 0 FirstWrite -1}
		bias_0 {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	S_AXIS_V { axis {  { S_AXIS_V_TDATA in_data 0 64 }  { S_AXIS_V_TVALID in_vld 0 1 }  { S_AXIS_V_TREADY in_acc 1 1 } } }
	M_AXIS_V { axis {  { M_AXIS_V_TDATA out_data 1 64 }  { M_AXIS_V_TVALID out_vld 1 1 }  { M_AXIS_V_TREADY out_acc 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}

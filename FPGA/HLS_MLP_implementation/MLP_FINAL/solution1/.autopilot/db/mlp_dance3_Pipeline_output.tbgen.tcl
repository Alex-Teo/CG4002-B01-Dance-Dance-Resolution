set moduleName mlp_dance3_Pipeline_output
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
set C_modelName {mlp_dance3_Pipeline_output}
set C_modelType { void 0 }
set C_modelArgList {
	{ buffer_1_0_1_reload float 32 regular  }
	{ buffer_1_1_1_reload float 32 regular  }
	{ buffer_1_2_1_reload float 32 regular  }
	{ M_AXIS_V int 64 regular {axi_s 1 volatile  { M_AXIS_V Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "buffer_1_0_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_1_1_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_1_2_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "M_AXIS_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 12
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ M_AXIS_V_TREADY sc_in sc_logic 1 outacc 3 } 
	{ buffer_1_0_1_reload sc_in sc_lv 32 signal 0 } 
	{ buffer_1_1_1_reload sc_in sc_lv 32 signal 1 } 
	{ buffer_1_2_1_reload sc_in sc_lv 32 signal 2 } 
	{ M_AXIS_V_TDATA sc_out sc_lv 64 signal 3 } 
	{ M_AXIS_V_TVALID sc_out sc_logic 1 outvld 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "M_AXIS_V_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "M_AXIS_V", "role": "TREADY" }} , 
 	{ "name": "buffer_1_0_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_1_0_1_reload", "role": "default" }} , 
 	{ "name": "buffer_1_1_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_1_1_1_reload", "role": "default" }} , 
 	{ "name": "buffer_1_2_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buffer_1_2_1_reload", "role": "default" }} , 
 	{ "name": "M_AXIS_V_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "M_AXIS_V", "role": "TDATA" }} , 
 	{ "name": "M_AXIS_V_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "M_AXIS_V", "role": "TVALID" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_32_32_1_1_U100", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mlp_dance3_Pipeline_output {
		buffer_1_0_1_reload {Type I LastRead 0 FirstWrite -1}
		buffer_1_1_1_reload {Type I LastRead 0 FirstWrite -1}
		buffer_1_2_1_reload {Type I LastRead 0 FirstWrite -1}
		M_AXIS_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "6"}
	, {"Name" : "Interval", "Min" : "6", "Max" : "6"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	buffer_1_0_1_reload { ap_none {  { buffer_1_0_1_reload in_data 0 32 } } }
	buffer_1_1_1_reload { ap_none {  { buffer_1_1_1_reload in_data 0 32 } } }
	buffer_1_2_1_reload { ap_none {  { buffer_1_2_1_reload in_data 0 32 } } }
	M_AXIS_V { axis {  { M_AXIS_V_TREADY out_acc 0 1 }  { M_AXIS_V_TDATA out_data 1 64 }  { M_AXIS_V_TVALID out_vld 1 1 } } }
}

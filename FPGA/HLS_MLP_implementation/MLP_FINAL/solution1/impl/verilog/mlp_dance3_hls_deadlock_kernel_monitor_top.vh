
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [5:0] axis_block_sigs;
wire [5:0] inst_idle_sigs;
wire [0:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[1] = ~grp_mlp_dance3_Pipeline_retrieve_inputs_fu_428.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[2] = ~grp_mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2_fu_435.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[3] = ~grp_mlp_dance3_Pipeline_output_fu_484.M_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[4] = ~grp_mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3_fu_493.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[5] = ~grp_mlp_dance3_Pipeline_loadbias0_fu_547.S_AXIS_V_TDATA_blk_n;

assign inst_block_sigs[0] = 1'b0;

assign inst_idle_sigs[0] = 1'b0;
assign inst_idle_sigs[1] = grp_mlp_dance3_Pipeline_retrieve_inputs_fu_428.ap_idle;
assign inst_idle_sigs[2] = grp_mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2_fu_435.ap_idle;
assign inst_idle_sigs[3] = grp_mlp_dance3_Pipeline_output_fu_484.ap_idle;
assign inst_idle_sigs[4] = grp_mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3_fu_493.ap_idle;
assign inst_idle_sigs[5] = grp_mlp_dance3_Pipeline_loadbias0_fu_547.ap_idle;

mlp_dance3_hls_deadlock_idx0_monitor mlp_dance3_hls_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);


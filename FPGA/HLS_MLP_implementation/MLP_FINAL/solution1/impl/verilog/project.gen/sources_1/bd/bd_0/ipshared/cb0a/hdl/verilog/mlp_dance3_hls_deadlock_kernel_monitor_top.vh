
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [22:0] axis_block_sigs;
wire [22:0] inst_idle_sigs;
wire [0:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[1] = ~grp_mlp_dance3_Pipeline_retrieve_inputs_pos_fu_254.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[2] = ~grp_mlp_dance3_Pipeline_retrieve_inputs_fu_269.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[3] = ~grp_mlp_dance3_Pipeline_loadweights0_pos_VITIS_LOOP_96_7_fu_276.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[4] = ~grp_mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2_fu_283.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[5] = ~grp_mlp_dance3_Pipeline_output_pos_fu_316.M_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[6] = ~grp_mlp_dance3_Pipeline_output_fu_355.M_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[7] = ~grp_mlp_dance3_Pipeline_loadweights1_pos_VITIS_LOOP_102_8_fu_362.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[8] = ~grp_mlp_dance3_Pipeline_loadweights2_pos_VITIS_LOOP_108_9_fu_369.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[9] = ~grp_mlp_dance3_Pipeline_loadweights3_pos_VITIS_LOOP_114_10_fu_376.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[10] = ~grp_mlp_dance3_Pipeline_loadbias0_pos_fu_383.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[11] = ~grp_mlp_dance3_Pipeline_loadbias1_pos_fu_390.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[12] = ~grp_mlp_dance3_Pipeline_loadbias2_pos_fu_397.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[13] = ~grp_mlp_dance3_Pipeline_loadbias3_pos_fu_404.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[14] = ~grp_mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3_fu_416.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[15] = ~grp_mlp_dance3_Pipeline_loadweights2_VITIS_LOOP_58_4_fu_423.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[16] = ~grp_mlp_dance3_Pipeline_loadweights3_VITIS_LOOP_64_5_fu_430.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[17] = ~grp_mlp_dance3_Pipeline_loadweights4_VITIS_LOOP_69_6_fu_437.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[18] = ~grp_mlp_dance3_Pipeline_loadbias0_fu_444.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[19] = ~grp_mlp_dance3_Pipeline_loadbias1_fu_451.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[20] = ~grp_mlp_dance3_Pipeline_loadbias2_fu_458.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[21] = ~grp_mlp_dance3_Pipeline_loadbias3_fu_465.S_AXIS_V_TDATA_blk_n;
assign axis_block_sigs[22] = ~grp_mlp_dance3_Pipeline_loadbias4_fu_472.S_AXIS_V_TDATA_blk_n;

assign inst_block_sigs[0] = 1'b0;

assign inst_idle_sigs[0] = 1'b0;
assign inst_idle_sigs[1] = grp_mlp_dance3_Pipeline_retrieve_inputs_pos_fu_254.ap_idle;
assign inst_idle_sigs[2] = grp_mlp_dance3_Pipeline_retrieve_inputs_fu_269.ap_idle;
assign inst_idle_sigs[3] = grp_mlp_dance3_Pipeline_loadweights0_pos_VITIS_LOOP_96_7_fu_276.ap_idle;
assign inst_idle_sigs[4] = grp_mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2_fu_283.ap_idle;
assign inst_idle_sigs[5] = grp_mlp_dance3_Pipeline_output_pos_fu_316.ap_idle;
assign inst_idle_sigs[6] = grp_mlp_dance3_Pipeline_output_fu_355.ap_idle;
assign inst_idle_sigs[7] = grp_mlp_dance3_Pipeline_loadweights1_pos_VITIS_LOOP_102_8_fu_362.ap_idle;
assign inst_idle_sigs[8] = grp_mlp_dance3_Pipeline_loadweights2_pos_VITIS_LOOP_108_9_fu_369.ap_idle;
assign inst_idle_sigs[9] = grp_mlp_dance3_Pipeline_loadweights3_pos_VITIS_LOOP_114_10_fu_376.ap_idle;
assign inst_idle_sigs[10] = grp_mlp_dance3_Pipeline_loadbias0_pos_fu_383.ap_idle;
assign inst_idle_sigs[11] = grp_mlp_dance3_Pipeline_loadbias1_pos_fu_390.ap_idle;
assign inst_idle_sigs[12] = grp_mlp_dance3_Pipeline_loadbias2_pos_fu_397.ap_idle;
assign inst_idle_sigs[13] = grp_mlp_dance3_Pipeline_loadbias3_pos_fu_404.ap_idle;
assign inst_idle_sigs[14] = grp_mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3_fu_416.ap_idle;
assign inst_idle_sigs[15] = grp_mlp_dance3_Pipeline_loadweights2_VITIS_LOOP_58_4_fu_423.ap_idle;
assign inst_idle_sigs[16] = grp_mlp_dance3_Pipeline_loadweights3_VITIS_LOOP_64_5_fu_430.ap_idle;
assign inst_idle_sigs[17] = grp_mlp_dance3_Pipeline_loadweights4_VITIS_LOOP_69_6_fu_437.ap_idle;
assign inst_idle_sigs[18] = grp_mlp_dance3_Pipeline_loadbias0_fu_444.ap_idle;
assign inst_idle_sigs[19] = grp_mlp_dance3_Pipeline_loadbias1_fu_451.ap_idle;
assign inst_idle_sigs[20] = grp_mlp_dance3_Pipeline_loadbias2_fu_458.ap_idle;
assign inst_idle_sigs[21] = grp_mlp_dance3_Pipeline_loadbias3_fu_465.ap_idle;
assign inst_idle_sigs[22] = grp_mlp_dance3_Pipeline_loadbias4_fu_472.ap_idle;

mlp_dance3_hls_deadlock_idx0_monitor mlp_dance3_hls_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);


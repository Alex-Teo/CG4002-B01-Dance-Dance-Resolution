`timescale 1 ns / 1 ps

module mlp_dance3_hls_deadlock_idx0_monitor ( // for module mlp_dance3_mlp_dance3_inst
    input wire clock,
    input wire reset,
    input wire [22:0] axis_block_sigs,
    input wire [22:0] inst_idle_sigs,
    input wire [0:0] inst_block_sigs,
    output wire [3:0] axis_block_info,
    output wire block
);

// signal declare
reg [3:0] monitor_axis_block_info;
reg monitor_find_block;
wire idx8_block;
wire idx9_block;
wire idx10_block;
wire idx11_block;
wire idx12_block;
wire idx1_block;
wire idx7_block;
wire idx13_block;
wire idx2_block;
wire idx3_block;
wire idx4_block;
wire idx14_block;
wire idx18_block;
wire idx16_block;
wire idx17_block;
wire idx19_block;
wire idx22_block;
wire idx15_block;
wire idx20_block;
wire idx21_block;
wire idx5_block;
wire idx6_block;
wire sub_parallel_block;
wire all_sub_parallel_has_block;
wire all_sub_single_has_block;
wire cur_axis_has_block;
wire seq_is_axis_block;

assign axis_block_info = (monitor_find_block == 1'b1) ? monitor_axis_block_info : 4'h0;
assign block = monitor_find_block;
assign idx8_block = axis_block_sigs[8];
assign idx9_block = axis_block_sigs[9];
assign idx10_block = axis_block_sigs[10];
assign idx11_block = axis_block_sigs[11];
assign idx12_block = axis_block_sigs[12];
assign idx1_block = axis_block_sigs[1];
assign idx7_block = axis_block_sigs[7];
assign idx13_block = axis_block_sigs[13];
assign idx2_block = axis_block_sigs[2];
assign idx3_block = axis_block_sigs[3];
assign idx4_block = axis_block_sigs[4];
assign idx14_block = axis_block_sigs[14];
assign idx18_block = axis_block_sigs[18];
assign idx16_block = axis_block_sigs[16];
assign idx17_block = axis_block_sigs[17];
assign idx19_block = axis_block_sigs[19];
assign idx22_block = axis_block_sigs[22];
assign idx15_block = axis_block_sigs[15];
assign idx20_block = axis_block_sigs[20];
assign idx21_block = axis_block_sigs[21];
assign idx5_block = axis_block_sigs[5];
assign idx6_block = axis_block_sigs[6];
assign sub_parallel_block = 1'b0 | ((idx1_block & (axis_block_sigs[1])) & ((idx2_block | inst_idle_sigs[2]) & (idx3_block | inst_idle_sigs[3]) & (idx4_block | inst_idle_sigs[4]))) | ((idx2_block & (axis_block_sigs[2])) & ((idx1_block | inst_idle_sigs[1]) & (idx3_block | inst_idle_sigs[3]) & (idx4_block | inst_idle_sigs[4]))) | ((idx3_block & (axis_block_sigs[3])) & ((idx1_block | inst_idle_sigs[1]) & (idx2_block | inst_idle_sigs[2]) & (idx4_block | inst_idle_sigs[4]))) | ((idx4_block & (axis_block_sigs[4])) & ((idx1_block | inst_idle_sigs[1]) & (idx2_block | inst_idle_sigs[2]) & (idx3_block | inst_idle_sigs[3])));
assign all_sub_parallel_has_block = sub_parallel_block;
assign all_sub_single_has_block = 1'b0 | (idx8_block & (axis_block_sigs[8])) | (idx9_block & (axis_block_sigs[9])) | (idx10_block & (axis_block_sigs[10])) | (idx11_block & (axis_block_sigs[11])) | (idx12_block & (axis_block_sigs[12])) | (idx7_block & (axis_block_sigs[7])) | (idx13_block & (axis_block_sigs[13])) | (idx14_block & (axis_block_sigs[14])) | (idx18_block & (axis_block_sigs[18])) | (idx16_block & (axis_block_sigs[16])) | (idx17_block & (axis_block_sigs[17])) | (idx19_block & (axis_block_sigs[19])) | (idx22_block & (axis_block_sigs[22])) | (idx15_block & (axis_block_sigs[15])) | (idx20_block & (axis_block_sigs[20])) | (idx21_block & (axis_block_sigs[21])) | (idx5_block & (axis_block_sigs[5])) | (idx6_block & (axis_block_sigs[6]));
assign cur_axis_has_block = 1'b0 | axis_block_sigs[0];
assign seq_is_axis_block = all_sub_parallel_has_block | all_sub_single_has_block | cur_axis_has_block;

always @(posedge clock) begin
    if (reset == 1'b1)
        monitor_find_block <= 1'b0;
    else if (seq_is_axis_block == 1'b1)
        monitor_find_block <= 1'b1;
    else
        monitor_find_block <= 1'b0;
end

always @(posedge clock) begin
    if (reset == 1'b1)
        monitor_axis_block_info[1:0] <= 2'h0;
    else if (axis_block_sigs[0] | axis_block_sigs[8] | axis_block_sigs[9] | axis_block_sigs[10] | axis_block_sigs[11] | axis_block_sigs[12] | axis_block_sigs[1] | axis_block_sigs[7] | axis_block_sigs[13] | axis_block_sigs[2] | axis_block_sigs[3] | axis_block_sigs[4] | axis_block_sigs[14] | axis_block_sigs[18] | axis_block_sigs[16] | axis_block_sigs[17] | axis_block_sigs[19] | axis_block_sigs[22] | axis_block_sigs[15] | axis_block_sigs[20] | axis_block_sigs[21])
        monitor_axis_block_info[1:0] <= ~(2'h1 << 0);
    else
        monitor_axis_block_info[1:0] <= 2'h0;
end
always @(posedge clock) begin
    if (reset == 1'b1)
        monitor_axis_block_info[3:2] <= 2'h0;
    else if (axis_block_sigs[5] | axis_block_sigs[6])
        monitor_axis_block_info[3:2] <= ~(2'h1 << 1);
    else
        monitor_axis_block_info[3:2] <= 2'h0;
end

// instant sub module
endmodule

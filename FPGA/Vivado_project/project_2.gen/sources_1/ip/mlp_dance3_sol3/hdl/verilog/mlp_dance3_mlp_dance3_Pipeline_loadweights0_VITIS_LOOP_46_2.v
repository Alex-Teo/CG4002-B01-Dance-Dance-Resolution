// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mlp_dance3_mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        S_AXIS_V_TVALID,
        weights_0_address0,
        weights_0_ce0,
        weights_0_we0,
        weights_0_d0,
        S_AXIS_V_TDATA,
        S_AXIS_V_TREADY
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   S_AXIS_V_TVALID;
output  [9:0] weights_0_address0;
output   weights_0_ce0;
output   weights_0_we0;
output  [31:0] weights_0_d0;
input  [63:0] S_AXIS_V_TDATA;
output   S_AXIS_V_TREADY;

reg ap_idle;
reg weights_0_ce0;
reg weights_0_we0;
reg S_AXIS_V_TREADY;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire   [0:0] icmp_ln45_fu_103_p2;
reg    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    S_AXIS_V_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    ap_block_pp0_stage0_11001;
wire   [6:0] select_ln45_fu_133_p3;
reg   [6:0] select_ln45_reg_223;
reg   [6:0] select_ln45_reg_223_pp0_iter1_reg;
wire   [31:0] trunc_ln145_fu_153_p1;
reg   [31:0] trunc_ln145_reg_233;
reg   [31:0] trunc_ln145_reg_233_pp0_iter1_reg;
reg   [31:0] trunc_ln145_reg_233_pp0_iter2_reg;
wire   [63:0] zext_ln48_1_fu_181_p1;
reg   [6:0] j_fu_54;
wire    ap_loop_init;
reg   [6:0] ap_sig_allocacmp_j_load;
wire   [6:0] add_ln46_fu_157_p2;
reg   [3:0] i_fu_58;
reg   [3:0] ap_sig_allocacmp_i_load;
wire   [3:0] select_ln45_1_fu_141_p3;
reg   [9:0] indvar_flatten_fu_62;
reg   [9:0] ap_sig_allocacmp_indvar_flatten_load;
wire   [9:0] add_ln45_1_fu_109_p2;
wire   [0:0] icmp_ln46_fu_127_p2;
wire   [3:0] add_ln45_fu_121_p2;
wire   [9:0] grp_fu_189_p3;
wire   [3:0] grp_fu_189_p0;
wire   [6:0] grp_fu_189_p1;
wire   [6:0] grp_fu_189_p2;
reg    grp_fu_189_ce;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire   [9:0] grp_fu_189_p00;
wire   [9:0] grp_fu_189_p20;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_done_reg = 1'b0;
end

mlp_dance3_mac_muladd_4ns_7ns_7ns_10_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 4 ),
    .din1_WIDTH( 7 ),
    .din2_WIDTH( 7 ),
    .dout_WIDTH( 10 ))
mac_muladd_4ns_7ns_7ns_10_4_1_U107(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_189_p0),
    .din1(grp_fu_189_p1),
    .din2(grp_fu_189_p2),
    .ce(grp_fu_189_ce),
    .dout(grp_fu_189_p3)
);

mlp_dance3_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln45_fu_103_p2 == 1'd0) & (ap_start_int == 1'b1))) begin
            i_fu_58 <= select_ln45_1_fu_141_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_58 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln45_fu_103_p2 == 1'd0) & (ap_start_int == 1'b1))) begin
            indvar_flatten_fu_62 <= add_ln45_1_fu_109_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_62 <= 10'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln45_fu_103_p2 == 1'd0) & (ap_start_int == 1'b1))) begin
            j_fu_54 <= add_ln46_fu_157_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_54 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        select_ln45_reg_223_pp0_iter1_reg <= select_ln45_reg_223;
        trunc_ln145_reg_233_pp0_iter1_reg <= trunc_ln145_reg_233;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln45_fu_103_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln45_reg_223 <= select_ln45_fu_133_p3;
        trunc_ln145_reg_233 <= trunc_ln145_fu_153_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        trunc_ln145_reg_233_pp0_iter2_reg <= trunc_ln145_reg_233_pp0_iter1_reg;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln45_fu_103_p2 == 1'd0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        S_AXIS_V_TDATA_blk_n = S_AXIS_V_TVALID;
    end else begin
        S_AXIS_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln45_fu_103_p2 == 1'd0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        S_AXIS_V_TREADY = 1'b1;
    end else begin
        S_AXIS_V_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln45_fu_103_p2 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_load = 4'd0;
    end else begin
        ap_sig_allocacmp_i_load = i_fu_58;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_indvar_flatten_load = 10'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_62;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_j_load = 7'd0;
    end else begin
        ap_sig_allocacmp_j_load = j_fu_54;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_189_ce = 1'b1;
    end else begin
        grp_fu_189_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        weights_0_ce0 = 1'b1;
    end else begin
        weights_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        weights_0_we0 = 1'b1;
    end else begin
        weights_0_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln45_1_fu_109_p2 = (ap_sig_allocacmp_indvar_flatten_load + 10'd1);

assign add_ln45_fu_121_p2 = (ap_sig_allocacmp_i_load + 4'd1);

assign add_ln46_fu_157_p2 = (select_ln45_fu_133_p3 + 7'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((icmp_ln45_fu_103_p2 == 1'd0) & (1'b0 == S_AXIS_V_TVALID) & (ap_start_int == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((icmp_ln45_fu_103_p2 == 1'd0) & (1'b0 == S_AXIS_V_TVALID) & (ap_start_int == 1'b1));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((icmp_ln45_fu_103_p2 == 1'd0) & (1'b0 == S_AXIS_V_TVALID));
end

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign grp_fu_189_p0 = grp_fu_189_p00;

assign grp_fu_189_p00 = select_ln45_1_fu_141_p3;

assign grp_fu_189_p1 = 10'd78;

assign grp_fu_189_p2 = grp_fu_189_p20;

assign grp_fu_189_p20 = select_ln45_reg_223_pp0_iter1_reg;

assign icmp_ln45_fu_103_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 10'd624) ? 1'b1 : 1'b0);

assign icmp_ln46_fu_127_p2 = ((ap_sig_allocacmp_j_load == 7'd78) ? 1'b1 : 1'b0);

assign select_ln45_1_fu_141_p3 = ((icmp_ln46_fu_127_p2[0:0] == 1'b1) ? add_ln45_fu_121_p2 : ap_sig_allocacmp_i_load);

assign select_ln45_fu_133_p3 = ((icmp_ln46_fu_127_p2[0:0] == 1'b1) ? 7'd0 : ap_sig_allocacmp_j_load);

assign trunc_ln145_fu_153_p1 = S_AXIS_V_TDATA[31:0];

assign weights_0_address0 = zext_ln48_1_fu_181_p1;

assign weights_0_d0 = trunc_ln145_reg_233_pp0_iter2_reg;

assign zext_ln48_1_fu_181_p1 = grp_fu_189_p3;

endmodule //mlp_dance3_mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2
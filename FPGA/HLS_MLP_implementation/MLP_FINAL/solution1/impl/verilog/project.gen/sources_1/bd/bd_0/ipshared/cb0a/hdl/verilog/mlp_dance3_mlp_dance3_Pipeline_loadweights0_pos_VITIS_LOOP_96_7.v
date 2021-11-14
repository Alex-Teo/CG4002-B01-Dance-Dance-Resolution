// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mlp_dance3_mlp_dance3_Pipeline_loadweights0_pos_VITIS_LOOP_96_7 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        S_AXIS_V_TVALID,
        weights_0_pos_address0,
        weights_0_pos_ce0,
        weights_0_pos_we0,
        weights_0_pos_d0,
        S_AXIS_V_TDATA,
        S_AXIS_V_TREADY
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   S_AXIS_V_TVALID;
output  [11:0] weights_0_pos_address0;
output   weights_0_pos_ce0;
output   weights_0_pos_we0;
output  [31:0] weights_0_pos_d0;
input  [63:0] S_AXIS_V_TDATA;
output   S_AXIS_V_TREADY;

reg ap_idle;
reg weights_0_pos_ce0;
reg weights_0_pos_we0;
reg S_AXIS_V_TREADY;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln95_fu_103_p2;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    S_AXIS_V_TDATA_blk_n;
wire   [63:0] zext_ln98_fu_157_p1;
reg   [6:0] j_fu_54;
wire    ap_loop_init;
reg   [6:0] ap_sig_allocacmp_j_load;
wire   [6:0] add_ln96_fu_171_p2;
reg   [5:0] i_1_fu_58;
reg   [5:0] ap_sig_allocacmp_i_1_load;
wire   [5:0] select_ln95_1_fu_141_p3;
reg   [11:0] indvar_flatten39_fu_62;
reg   [11:0] ap_sig_allocacmp_indvar_flatten39_load;
wire   [11:0] add_ln95_1_fu_109_p2;
wire   [0:0] icmp_ln96_fu_127_p2;
wire   [5:0] add_ln95_fu_121_p2;
wire   [6:0] select_ln95_fu_133_p3;
wire   [12:0] tmp_s_fu_149_p3;
wire   [31:0] trunc_ln145_fu_162_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
reg    ap_condition_144;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_done_reg = 1'b0;
end

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
        ap_CS_fsm <= ap_ST_fsm_state1;
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
        end else if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln95_fu_103_p2 == 1'd0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_144)) begin
        if ((icmp_ln95_fu_103_p2 == 1'd0)) begin
            i_1_fu_58 <= select_ln95_1_fu_141_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            i_1_fu_58 <= 6'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_144)) begin
        if ((icmp_ln95_fu_103_p2 == 1'd0)) begin
            indvar_flatten39_fu_62 <= add_ln95_1_fu_109_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten39_fu_62 <= 12'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_144)) begin
        if ((icmp_ln95_fu_103_p2 == 1'd0)) begin
            j_fu_54 <= add_ln96_fu_171_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_54 <= 7'd0;
        end
    end
end

always @ (*) begin
    if (((icmp_ln95_fu_103_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        S_AXIS_V_TDATA_blk_n = S_AXIS_V_TVALID;
    end else begin
        S_AXIS_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln95_fu_103_p2 == 1'd0))) & (icmp_ln95_fu_103_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        S_AXIS_V_TREADY = 1'b1;
    end else begin
        S_AXIS_V_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln95_fu_103_p2 == 1'd0)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln95_fu_103_p2 == 1'd0))) & (icmp_ln95_fu_103_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln95_fu_103_p2 == 1'd0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln95_fu_103_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_i_1_load = 6'd0;
    end else begin
        ap_sig_allocacmp_i_1_load = i_1_fu_58;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_indvar_flatten39_load = 12'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten39_load = indvar_flatten39_fu_62;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_j_load = 7'd0;
    end else begin
        ap_sig_allocacmp_j_load = j_fu_54;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln95_fu_103_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        weights_0_pos_ce0 = 1'b1;
    end else begin
        weights_0_pos_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln95_fu_103_p2 == 1'd0))) & (icmp_ln95_fu_103_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        weights_0_pos_we0 = 1'b1;
    end else begin
        weights_0_pos_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln95_1_fu_109_p2 = (ap_sig_allocacmp_indvar_flatten39_load + 12'd1);

assign add_ln95_fu_121_p2 = (ap_sig_allocacmp_i_1_load + 6'd1);

assign add_ln96_fu_171_p2 = (select_ln95_fu_133_p3 + 7'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln95_fu_103_p2 == 1'd0)));
end

always @ (*) begin
    ap_condition_144 = (~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln95_fu_103_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1));
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln95_fu_103_p2 = ((ap_sig_allocacmp_indvar_flatten39_load == 12'd3200) ? 1'b1 : 1'b0);

assign icmp_ln96_fu_127_p2 = ((ap_sig_allocacmp_j_load == 7'd100) ? 1'b1 : 1'b0);

assign select_ln95_1_fu_141_p3 = ((icmp_ln96_fu_127_p2[0:0] == 1'b1) ? add_ln95_fu_121_p2 : ap_sig_allocacmp_i_1_load);

assign select_ln95_fu_133_p3 = ((icmp_ln96_fu_127_p2[0:0] == 1'b1) ? 7'd0 : ap_sig_allocacmp_j_load);

assign tmp_s_fu_149_p3 = {{select_ln95_1_fu_141_p3}, {select_ln95_fu_133_p3}};

assign trunc_ln145_fu_162_p1 = S_AXIS_V_TDATA[31:0];

assign weights_0_pos_address0 = zext_ln98_fu_157_p1;

assign weights_0_pos_d0 = trunc_ln145_fu_162_p1;

assign zext_ln98_fu_157_p1 = tmp_s_fu_149_p3;

endmodule //mlp_dance3_mlp_dance3_Pipeline_loadweights0_pos_VITIS_LOOP_96_7

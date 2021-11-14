// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mlp_dance3_mlp_dance3_Pipeline_loadbias1_pos (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        S_AXIS_V_TVALID,
        S_AXIS_V_TDATA,
        S_AXIS_V_TREADY,
        bias_1_pos_address0,
        bias_1_pos_ce0,
        bias_1_pos_we0,
        bias_1_pos_d0
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   S_AXIS_V_TVALID;
input  [63:0] S_AXIS_V_TDATA;
output   S_AXIS_V_TREADY;
output  [4:0] bias_1_pos_address0;
output   bias_1_pos_ce0;
output   bias_1_pos_we0;
output  [31:0] bias_1_pos_d0;

reg ap_idle;
reg S_AXIS_V_TREADY;
reg bias_1_pos_ce0;
reg bias_1_pos_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln122_fu_71_p2;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    S_AXIS_V_TDATA_blk_n;
wire   [63:0] i_23_cast_fu_83_p1;
reg   [5:0] i_fu_40;
wire    ap_loop_init;
reg   [5:0] ap_sig_allocacmp_i_10;
wire   [5:0] add_ln122_fu_77_p2;
wire   [31:0] trunc_ln145_fu_88_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
reg    ap_condition_105;
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
        end else if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln122_fu_71_p2 == 1'd0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_105)) begin
        if ((icmp_ln122_fu_71_p2 == 1'd0)) begin
            i_fu_40 <= add_ln122_fu_77_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_40 <= 6'd0;
        end
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (icmp_ln122_fu_71_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        S_AXIS_V_TDATA_blk_n = S_AXIS_V_TVALID;
    end else begin
        S_AXIS_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln122_fu_71_p2 == 1'd0))) & (icmp_ln122_fu_71_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        S_AXIS_V_TREADY = 1'b1;
    end else begin
        S_AXIS_V_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln122_fu_71_p2 == 1'd0)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln122_fu_71_p2 == 1'd0))) & (icmp_ln122_fu_71_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln122_fu_71_p2 == 1'd0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln122_fu_71_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_i_10 = 6'd0;
    end else begin
        ap_sig_allocacmp_i_10 = i_fu_40;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln122_fu_71_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        bias_1_pos_ce0 = 1'b1;
    end else begin
        bias_1_pos_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln122_fu_71_p2 == 1'd0))) & (icmp_ln122_fu_71_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        bias_1_pos_we0 = 1'b1;
    end else begin
        bias_1_pos_we0 = 1'b0;
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

assign add_ln122_fu_77_p2 = (ap_sig_allocacmp_i_10 + 6'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln122_fu_71_p2 == 1'd0)));
end

always @ (*) begin
    ap_condition_105 = (~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln122_fu_71_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1));
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign bias_1_pos_address0 = i_23_cast_fu_83_p1;

assign bias_1_pos_d0 = trunc_ln145_fu_88_p1;

assign i_23_cast_fu_83_p1 = ap_sig_allocacmp_i_10;

assign icmp_ln122_fu_71_p2 = ((ap_sig_allocacmp_i_10 == 6'd32) ? 1'b1 : 1'b0);

assign trunc_ln145_fu_88_p1 = S_AXIS_V_TDATA[31:0];

endmodule //mlp_dance3_mlp_dance3_Pipeline_loadbias1_pos

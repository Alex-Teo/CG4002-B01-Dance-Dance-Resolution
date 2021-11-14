// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mlp_dance3_mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        S_AXIS_V_TVALID,
        weights_1_address0,
        weights_1_ce0,
        weights_1_we0,
        weights_1_d0,
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
output  [13:0] weights_1_address0;
output   weights_1_ce0;
output   weights_1_we0;
output  [31:0] weights_1_d0;
input  [63:0] S_AXIS_V_TDATA;
output   S_AXIS_V_TREADY;

reg ap_idle;
reg weights_1_ce0;
reg weights_1_we0;
reg S_AXIS_V_TREADY;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln51_fu_101_p2;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    S_AXIS_V_TDATA_blk_n;
wire   [63:0] zext_ln54_1_fu_169_p1;
reg   [7:0] j_fu_52;
wire    ap_loop_init;
reg   [7:0] ap_sig_allocacmp_j_load;
wire   [7:0] add_ln52_fu_183_p2;
reg   [7:0] i_fu_56;
reg   [7:0] ap_sig_allocacmp_i_load;
wire   [7:0] select_ln51_1_fu_139_p3;
reg   [14:0] indvar_flatten7_fu_60;
reg   [14:0] ap_sig_allocacmp_indvar_flatten7_load;
wire   [14:0] add_ln51_1_fu_107_p2;
wire   [0:0] icmp_ln52_fu_125_p2;
wire   [7:0] add_ln51_fu_119_p2;
wire   [6:0] trunc_ln54_fu_147_p1;
wire   [7:0] select_ln51_fu_131_p3;
wire   [13:0] tmp_21_cast_fu_151_p3;
wire   [13:0] zext_ln54_fu_159_p1;
wire   [13:0] add_ln54_fu_163_p2;
wire   [31:0] trunc_ln145_fu_174_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
reg    ap_condition_153;
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
        end else if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln51_fu_101_p2 == 1'd0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_153)) begin
        if ((icmp_ln51_fu_101_p2 == 1'd0)) begin
            i_fu_56 <= select_ln51_1_fu_139_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_56 <= 8'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_153)) begin
        if ((icmp_ln51_fu_101_p2 == 1'd0)) begin
            indvar_flatten7_fu_60 <= add_ln51_1_fu_107_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten7_fu_60 <= 15'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_153)) begin
        if ((icmp_ln51_fu_101_p2 == 1'd0)) begin
            j_fu_52 <= add_ln52_fu_183_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_52 <= 8'd0;
        end
    end
end

always @ (*) begin
    if (((icmp_ln51_fu_101_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        S_AXIS_V_TDATA_blk_n = S_AXIS_V_TVALID;
    end else begin
        S_AXIS_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln51_fu_101_p2 == 1'd0))) & (icmp_ln51_fu_101_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        S_AXIS_V_TREADY = 1'b1;
    end else begin
        S_AXIS_V_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln51_fu_101_p2 == 1'd0)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln51_fu_101_p2 == 1'd0))) & (icmp_ln51_fu_101_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln51_fu_101_p2 == 1'd0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln51_fu_101_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_i_load = 8'd0;
    end else begin
        ap_sig_allocacmp_i_load = i_fu_56;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_indvar_flatten7_load = 15'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten7_load = indvar_flatten7_fu_60;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_j_load = 8'd0;
    end else begin
        ap_sig_allocacmp_j_load = j_fu_52;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln51_fu_101_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        weights_1_ce0 = 1'b1;
    end else begin
        weights_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln51_fu_101_p2 == 1'd0))) & (icmp_ln51_fu_101_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        weights_1_we0 = 1'b1;
    end else begin
        weights_1_we0 = 1'b0;
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

assign add_ln51_1_fu_107_p2 = (ap_sig_allocacmp_indvar_flatten7_load + 15'd1);

assign add_ln51_fu_119_p2 = (ap_sig_allocacmp_i_load + 8'd1);

assign add_ln52_fu_183_p2 = (select_ln51_fu_131_p3 + 8'd1);

assign add_ln54_fu_163_p2 = (tmp_21_cast_fu_151_p3 + zext_ln54_fu_159_p1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln51_fu_101_p2 == 1'd0)));
end

always @ (*) begin
    ap_condition_153 = (~((ap_start_int == 1'b0) | ((1'b0 == S_AXIS_V_TVALID) & (icmp_ln51_fu_101_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1));
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln51_fu_101_p2 = ((ap_sig_allocacmp_indvar_flatten7_load == 15'd16384) ? 1'b1 : 1'b0);

assign icmp_ln52_fu_125_p2 = ((ap_sig_allocacmp_j_load == 8'd128) ? 1'b1 : 1'b0);

assign select_ln51_1_fu_139_p3 = ((icmp_ln52_fu_125_p2[0:0] == 1'b1) ? add_ln51_fu_119_p2 : ap_sig_allocacmp_i_load);

assign select_ln51_fu_131_p3 = ((icmp_ln52_fu_125_p2[0:0] == 1'b1) ? 8'd0 : ap_sig_allocacmp_j_load);

assign tmp_21_cast_fu_151_p3 = {{trunc_ln54_fu_147_p1}, {7'd0}};

assign trunc_ln145_fu_174_p1 = S_AXIS_V_TDATA[31:0];

assign trunc_ln54_fu_147_p1 = select_ln51_1_fu_139_p3[6:0];

assign weights_1_address0 = zext_ln54_1_fu_169_p1;

assign weights_1_d0 = trunc_ln145_fu_174_p1;

assign zext_ln54_1_fu_169_p1 = add_ln54_fu_163_p2;

assign zext_ln54_fu_159_p1 = select_ln51_fu_131_p3;

endmodule //mlp_dance3_mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3
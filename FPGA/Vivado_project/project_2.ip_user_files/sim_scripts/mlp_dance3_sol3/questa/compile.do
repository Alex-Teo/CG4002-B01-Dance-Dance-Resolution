vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xbip_utils_v3_0_10
vlib questa_lib/msim/axi_utils_v2_0_6
vlib questa_lib/msim/xbip_pipe_v3_0_6
vlib questa_lib/msim/xbip_dsp48_wrapper_v3_0_4
vlib questa_lib/msim/xbip_dsp48_addsub_v3_0_6
vlib questa_lib/msim/xbip_dsp48_multadd_v3_0_6
vlib questa_lib/msim/xbip_bram18k_v3_0_6
vlib questa_lib/msim/mult_gen_v12_0_17
vlib questa_lib/msim/floating_point_v7_1_12
vlib questa_lib/msim/xil_defaultlib

vmap xbip_utils_v3_0_10 questa_lib/msim/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 questa_lib/msim/axi_utils_v2_0_6
vmap xbip_pipe_v3_0_6 questa_lib/msim/xbip_pipe_v3_0_6
vmap xbip_dsp48_wrapper_v3_0_4 questa_lib/msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_6 questa_lib/msim/xbip_dsp48_addsub_v3_0_6
vmap xbip_dsp48_multadd_v3_0_6 questa_lib/msim/xbip_dsp48_multadd_v3_0_6
vmap xbip_bram18k_v3_0_6 questa_lib/msim/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_17 questa_lib/msim/mult_gen_v12_0_17
vmap floating_point_v7_1_12 questa_lib/msim/floating_point_v7_1_12
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xbip_utils_v3_0_10  -93 \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6  -93 \
"../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6  -93 \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4  -93 \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6  -93 \
"../../../ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_6  -93 \
"../../../ipstatic/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6  -93 \
"../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_17  -93 \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_12  -93 \
"../../../ipstatic/hdl/floating_point_v7_1_rfs.vhd" \

vlog -work floating_point_v7_1_12  -incr -mfcu "+incdir+../../../ipstatic/hdl/verilog" \
"../../../ipstatic/hdl/floating_point_v7_1_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../ipstatic/hdl/verilog" \
"../../../ipstatic/hdl/verilog/mlp_dance3_bias_0.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_calculate.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_fadd_32ns_32ns_32_5_full_dsp_1.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_fcmp_32ns_32ns_1_2_no_dsp_1.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_flow_control_loop_pipe_sequential_init.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_fmul_32ns_32ns_32_4_max_dsp_1.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_hls_deadlock_idx0_monitor.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_input.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_mac_muladd_4ns_7ns_7ns_10_4_1.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_mlp_dance3_Pipeline_layer0.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_mlp_dance3_Pipeline_layer1.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_mlp_dance3_Pipeline_layer1_bias_1.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_mlp_dance3_Pipeline_loadbias0.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_mlp_dance3_Pipeline_output.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_mlp_dance3_Pipeline_retrieve_inputs.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_mul_3ns_8ns_10_1_1.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_mux_32_32_1_1.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_regslice_both.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3_weights_0.v" \
"../../../ipstatic/hdl/verilog/mlp_dance3.v" \
"../../../ipstatic/hdl/ip/mlp_dance3_fadd_32ns_32ns_32_5_full_dsp_1_ip.v" \
"../../../ipstatic/hdl/ip/mlp_dance3_fcmp_32ns_32ns_1_2_no_dsp_1_ip.v" \
"../../../ipstatic/hdl/ip/mlp_dance3_fmul_32ns_32ns_32_4_max_dsp_1_ip.v" \
"../../../../project_2.gen/sources_1/ip/mlp_dance3_sol3/sim/mlp_dance3_sol3.v" \

vlog -work xil_defaultlib \
"glbl.v"


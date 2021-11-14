# This script segment is generated automatically by AutoPilot

set name mlp_dance3_fcmp_32ns_32ns_1_2_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fcmp} IMPL {auto} LATENCY 1 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 23 \
    name input_r \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename input_r \
    op interface \
    ports { input_r_address0 { O 7 vector } input_r_ce0 { O 1 bit } input_r_q0 { I 32 vector } input_r_address1 { O 7 vector } input_r_ce1 { O 1 bit } input_r_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'input_r'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 24 \
    name weights_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weights_0 \
    op interface \
    ports { weights_0_address0 { O 10 vector } weights_0_ce0 { O 1 bit } weights_0_q0 { I 32 vector } weights_0_address1 { O 10 vector } weights_0_ce1 { O 1 bit } weights_0_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weights_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 25 \
    name bias_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_0 \
    op interface \
    ports { bias_0_address0 { O 7 vector } bias_0_ce0 { O 1 bit } bias_0_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_0'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name buffer_0_7_0553 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_7_0553 \
    op interface \
    ports { buffer_0_7_0553 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name buffer_0_6_0552 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_6_0552 \
    op interface \
    ports { buffer_0_6_0552 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 17 \
    name buffer_0_5_0551 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_5_0551 \
    op interface \
    ports { buffer_0_5_0551 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name buffer_0_4_0550 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_4_0550 \
    op interface \
    ports { buffer_0_4_0550 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 19 \
    name buffer_0_3_0549 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_3_0549 \
    op interface \
    ports { buffer_0_3_0549 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name buffer_0_2_0548 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_2_0548 \
    op interface \
    ports { buffer_0_2_0548 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name buffer_0_1_0547 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_1_0547 \
    op interface \
    ports { buffer_0_1_0547 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name buffer_0_0_0546 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_0_0546 \
    op interface \
    ports { buffer_0_0_0546 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name buffer_0_7_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_7_1_out \
    op interface \
    ports { buffer_0_7_1_out { O 32 vector } buffer_0_7_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 27 \
    name buffer_0_6_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_6_1_out \
    op interface \
    ports { buffer_0_6_1_out { O 32 vector } buffer_0_6_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name buffer_0_5_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_5_1_out \
    op interface \
    ports { buffer_0_5_1_out { O 32 vector } buffer_0_5_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name buffer_0_4_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_4_1_out \
    op interface \
    ports { buffer_0_4_1_out { O 32 vector } buffer_0_4_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name buffer_0_3_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_3_1_out \
    op interface \
    ports { buffer_0_3_1_out { O 32 vector } buffer_0_3_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name buffer_0_2_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_2_1_out \
    op interface \
    ports { buffer_0_2_1_out { O 32 vector } buffer_0_2_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name buffer_0_1_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_1_1_out \
    op interface \
    ports { buffer_0_1_1_out { O 32 vector } buffer_0_1_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name buffer_0_0_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_0_1_out \
    op interface \
    ports { buffer_0_0_1_out { O 32 vector } buffer_0_0_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName mlp_dance3_flow_control_loop_pipe_sequential_init_U
set CompName mlp_dance3_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix mlp_dance3_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}



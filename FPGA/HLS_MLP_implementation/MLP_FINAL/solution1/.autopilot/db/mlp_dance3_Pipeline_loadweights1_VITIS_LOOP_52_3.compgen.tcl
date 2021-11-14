# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 135 \
    name S_AXIS_V \
    reset_level 1 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { S_AXIS_V_TVALID { I 1 bit } S_AXIS_V_TDATA { I 64 vector } S_AXIS_V_TREADY { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'S_AXIS_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 111 \
    name weights_1_7_2_024 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_7_2_024 \
    op interface \
    ports { weights_1_7_2_024 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 112 \
    name weights_1_7_1_023 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_7_1_023 \
    op interface \
    ports { weights_1_7_1_023 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 113 \
    name weights_1_7_0_022 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_7_0_022 \
    op interface \
    ports { weights_1_7_0_022 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 114 \
    name weights_1_6_2_021 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_6_2_021 \
    op interface \
    ports { weights_1_6_2_021 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 115 \
    name weights_1_6_1_020 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_6_1_020 \
    op interface \
    ports { weights_1_6_1_020 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 116 \
    name weights_1_6_0_019 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_6_0_019 \
    op interface \
    ports { weights_1_6_0_019 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 117 \
    name weights_1_5_2_018 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_5_2_018 \
    op interface \
    ports { weights_1_5_2_018 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 118 \
    name weights_1_5_1_017 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_5_1_017 \
    op interface \
    ports { weights_1_5_1_017 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 119 \
    name weights_1_5_0_016 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_5_0_016 \
    op interface \
    ports { weights_1_5_0_016 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 120 \
    name weights_1_4_2_015 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_4_2_015 \
    op interface \
    ports { weights_1_4_2_015 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 121 \
    name weights_1_4_1_014 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_4_1_014 \
    op interface \
    ports { weights_1_4_1_014 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 122 \
    name weights_1_4_0_013 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_4_0_013 \
    op interface \
    ports { weights_1_4_0_013 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 123 \
    name weights_1_3_2_012 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_3_2_012 \
    op interface \
    ports { weights_1_3_2_012 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 124 \
    name weights_1_3_1_011 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_3_1_011 \
    op interface \
    ports { weights_1_3_1_011 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 125 \
    name weights_1_3_0_010 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_3_0_010 \
    op interface \
    ports { weights_1_3_0_010 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 126 \
    name weights_1_2_2_09 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_2_2_09 \
    op interface \
    ports { weights_1_2_2_09 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 127 \
    name weights_1_2_1_08 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_2_1_08 \
    op interface \
    ports { weights_1_2_1_08 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name weights_1_2_0_07 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_2_0_07 \
    op interface \
    ports { weights_1_2_0_07 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 129 \
    name weights_1_1_2_06 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_1_2_06 \
    op interface \
    ports { weights_1_1_2_06 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 130 \
    name weights_1_1_1_05 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_1_1_05 \
    op interface \
    ports { weights_1_1_1_05 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 131 \
    name weights_1_1_0_04 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_1_0_04 \
    op interface \
    ports { weights_1_1_0_04 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name weights_1_0_2_03 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_0_2_03 \
    op interface \
    ports { weights_1_0_2_03 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 133 \
    name weights_1_0_1_02 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_0_1_02 \
    op interface \
    ports { weights_1_0_1_02 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 134 \
    name weights_1_0_0_01 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_0_0_01 \
    op interface \
    ports { weights_1_0_0_01 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 136 \
    name weights_1_7_2_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_7_2_2_out \
    op interface \
    ports { weights_1_7_2_2_out { O 32 vector } weights_1_7_2_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 137 \
    name weights_1_7_1_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_7_1_2_out \
    op interface \
    ports { weights_1_7_1_2_out { O 32 vector } weights_1_7_1_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 138 \
    name weights_1_7_0_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_7_0_2_out \
    op interface \
    ports { weights_1_7_0_2_out { O 32 vector } weights_1_7_0_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 139 \
    name weights_1_6_2_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_6_2_2_out \
    op interface \
    ports { weights_1_6_2_2_out { O 32 vector } weights_1_6_2_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 140 \
    name weights_1_6_1_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_6_1_2_out \
    op interface \
    ports { weights_1_6_1_2_out { O 32 vector } weights_1_6_1_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 141 \
    name weights_1_6_0_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_6_0_2_out \
    op interface \
    ports { weights_1_6_0_2_out { O 32 vector } weights_1_6_0_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 142 \
    name weights_1_5_2_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_5_2_2_out \
    op interface \
    ports { weights_1_5_2_2_out { O 32 vector } weights_1_5_2_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 143 \
    name weights_1_5_1_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_5_1_2_out \
    op interface \
    ports { weights_1_5_1_2_out { O 32 vector } weights_1_5_1_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 144 \
    name weights_1_5_0_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_5_0_2_out \
    op interface \
    ports { weights_1_5_0_2_out { O 32 vector } weights_1_5_0_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 145 \
    name weights_1_4_2_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_4_2_2_out \
    op interface \
    ports { weights_1_4_2_2_out { O 32 vector } weights_1_4_2_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 146 \
    name weights_1_4_1_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_4_1_2_out \
    op interface \
    ports { weights_1_4_1_2_out { O 32 vector } weights_1_4_1_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 147 \
    name weights_1_4_0_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_4_0_2_out \
    op interface \
    ports { weights_1_4_0_2_out { O 32 vector } weights_1_4_0_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 148 \
    name weights_1_3_2_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_3_2_2_out \
    op interface \
    ports { weights_1_3_2_2_out { O 32 vector } weights_1_3_2_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 149 \
    name weights_1_3_1_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_3_1_2_out \
    op interface \
    ports { weights_1_3_1_2_out { O 32 vector } weights_1_3_1_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 150 \
    name weights_1_3_0_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_3_0_2_out \
    op interface \
    ports { weights_1_3_0_2_out { O 32 vector } weights_1_3_0_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 151 \
    name weights_1_2_2_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_2_2_2_out \
    op interface \
    ports { weights_1_2_2_2_out { O 32 vector } weights_1_2_2_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 152 \
    name weights_1_2_1_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_2_1_2_out \
    op interface \
    ports { weights_1_2_1_2_out { O 32 vector } weights_1_2_1_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 153 \
    name weights_1_2_0_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_2_0_2_out \
    op interface \
    ports { weights_1_2_0_2_out { O 32 vector } weights_1_2_0_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 154 \
    name weights_1_1_2_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_1_2_2_out \
    op interface \
    ports { weights_1_1_2_2_out { O 32 vector } weights_1_1_2_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 155 \
    name weights_1_1_1_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_1_1_2_out \
    op interface \
    ports { weights_1_1_1_2_out { O 32 vector } weights_1_1_1_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 156 \
    name weights_1_1_0_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_1_0_2_out \
    op interface \
    ports { weights_1_1_0_2_out { O 32 vector } weights_1_1_0_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 157 \
    name weights_1_0_2_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_0_2_2_out \
    op interface \
    ports { weights_1_0_2_2_out { O 32 vector } weights_1_0_2_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 158 \
    name weights_1_0_1_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_0_1_2_out \
    op interface \
    ports { weights_1_0_1_2_out { O 32 vector } weights_1_0_1_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 159 \
    name weights_1_0_0_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1_0_0_2_out \
    op interface \
    ports { weights_1_0_0_2_out { O 32 vector } weights_1_0_0_2_out_ap_vld { O 1 bit } } \
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



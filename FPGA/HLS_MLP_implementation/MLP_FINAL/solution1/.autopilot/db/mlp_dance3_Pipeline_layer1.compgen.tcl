# This script segment is generated automatically by AutoPilot

set id 52
set name mlp_dance3_mux_32_32_1_1
set corename simcore_mux
set op mux
set stage_num 1
set din0_width 32
set din0_signed 0
set din1_width 32
set din1_signed 0
set din2_width 32
set din2_signed 0
set din3_width 2
set din3_signed 0
set dout_width 32
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mux} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set op mux
set corename Multiplexer
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_pipemux] == "::AESL_LIB_VIRTEX::xil_gen_pipemux"} {
eval "::AESL_LIB_VIRTEX::xil_gen_pipemux { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    din0_width ${din0_width} \
    din0_signed ${din0_signed} \
    din1_width ${din1_width} \
    din1_signed ${din1_signed} \
    din2_width ${din2_width} \
    din2_signed ${din2_signed} \
    din3_width ${din3_width} \
    din3_signed ${din3_signed} \
    dout_width ${dout_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_pipemux, check your platform lib"
}
}


# Memory (RAM/ROM)  definition:
set ID 61
set hasByteEnable 0
set MemName mlp_dance3_mlp_dance3_Pipeline_layer1_bias_1
set CoreName ap_simcore_mem
set PortList { 1 3 }
set DataWd 32
set AddrRange 8
set AddrWd 3
set impl_style auto
set TrueReset 0
set IsROM 0
set ROMData { }
set HasInitializer 0
set Initializer $ROMData
set NumOfStage 2
set DelayBudget 0.79
set ClkPeriod 10
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $MemName BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


set CoreName RAM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_RAM] == "::AESL_LIB_VIRTEX::xil_gen_RAM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_RAM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_RAM, check your platform lib"
  }
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 62 \
    name buffer_1_2_027 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_1_2_027 \
    op interface \
    ports { buffer_1_2_027 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 63 \
    name buffer_1_1_026 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_1_1_026 \
    op interface \
    ports { buffer_1_1_026 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 64 \
    name buffer_1_0_025 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_1_0_025 \
    op interface \
    ports { buffer_1_0_025 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 65 \
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
    id 66 \
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
    id 67 \
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
    id 68 \
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
    id 69 \
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
    id 70 \
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
    id 71 \
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
    id 72 \
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
    id 73 \
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
    id 74 \
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
    id 75 \
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
    id 76 \
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
    id 77 \
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
    id 78 \
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
    id 79 \
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
    id 80 \
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
    id 81 \
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
    id 82 \
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
    id 83 \
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
    id 84 \
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
    id 85 \
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
    id 86 \
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
    id 87 \
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
    id 88 \
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
    id 89 \
    name buffer_0_0_1_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_0_1_reload \
    op interface \
    ports { buffer_0_0_1_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 90 \
    name buffer_0_1_1_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_1_1_reload \
    op interface \
    ports { buffer_0_1_1_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 91 \
    name buffer_0_2_1_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_2_1_reload \
    op interface \
    ports { buffer_0_2_1_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 92 \
    name buffer_0_3_1_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_3_1_reload \
    op interface \
    ports { buffer_0_3_1_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 93 \
    name buffer_0_4_1_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_4_1_reload \
    op interface \
    ports { buffer_0_4_1_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 94 \
    name buffer_0_5_1_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_5_1_reload \
    op interface \
    ports { buffer_0_5_1_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 95 \
    name buffer_0_6_1_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_6_1_reload \
    op interface \
    ports { buffer_0_6_1_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 96 \
    name buffer_0_7_1_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_0_7_1_reload \
    op interface \
    ports { buffer_0_7_1_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 97 \
    name buffer_1_2_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_1_2_1_out \
    op interface \
    ports { buffer_1_2_1_out { O 32 vector } buffer_1_2_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 98 \
    name buffer_1_1_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_1_1_1_out \
    op interface \
    ports { buffer_1_1_1_out { O 32 vector } buffer_1_1_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 99 \
    name buffer_1_0_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_buffer_1_0_1_out \
    op interface \
    ports { buffer_1_0_1_out { O 32 vector } buffer_1_0_1_out_ap_vld { O 1 bit } } \
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



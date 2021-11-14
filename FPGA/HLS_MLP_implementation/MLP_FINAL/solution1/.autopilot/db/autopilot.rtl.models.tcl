set SynModuleInfo {
  {SRCNAME calculate MODELNAME calculate RTLNAME mlp_dance3_calculate
    SUBMODULES {
      {MODELNAME mlp_dance3_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME mlp_dance3_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME mlp_dance3_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME mlp_dance3_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME mlp_dance3_mul_3ns_8ns_10_1_1 RTLNAME mlp_dance3_mul_3ns_8ns_10_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME mlp_dance3_Pipeline_layer0 MODELNAME mlp_dance3_Pipeline_layer0 RTLNAME mlp_dance3_mlp_dance3_Pipeline_layer0
    SUBMODULES {
      {MODELNAME mlp_dance3_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME mlp_dance3_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME mlp_dance3_flow_control_loop_pipe_sequential_init RTLNAME mlp_dance3_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME mlp_dance3_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME mlp_dance3_Pipeline_layer1 MODELNAME mlp_dance3_Pipeline_layer1 RTLNAME mlp_dance3_mlp_dance3_Pipeline_layer1
    SUBMODULES {
      {MODELNAME mlp_dance3_mux_32_32_1_1 RTLNAME mlp_dance3_mux_32_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME mlp_dance3_mlp_dance3_Pipeline_layer1_bias_1 RTLNAME mlp_dance3_mlp_dance3_Pipeline_layer1_bias_1 BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME mlp_dance3_Pipeline_output MODELNAME mlp_dance3_Pipeline_output RTLNAME mlp_dance3_mlp_dance3_Pipeline_output}
  {SRCNAME mlp_dance3_Pipeline_retrieve_inputs MODELNAME mlp_dance3_Pipeline_retrieve_inputs RTLNAME mlp_dance3_mlp_dance3_Pipeline_retrieve_inputs}
  {SRCNAME mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2 MODELNAME mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2 RTLNAME mlp_dance3_mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2
    SUBMODULES {
      {MODELNAME mlp_dance3_mac_muladd_4ns_7ns_7ns_10_4_1 RTLNAME mlp_dance3_mac_muladd_4ns_7ns_7ns_10_4_1 BINDTYPE op TYPE add IMPL dsp LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3 MODELNAME mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3 RTLNAME mlp_dance3_mlp_dance3_Pipeline_loadweights1_VITIS_LOOP_52_3}
  {SRCNAME mlp_dance3_Pipeline_loadbias0 MODELNAME mlp_dance3_Pipeline_loadbias0 RTLNAME mlp_dance3_mlp_dance3_Pipeline_loadbias0}
  {SRCNAME mlp_dance3 MODELNAME mlp_dance3 RTLNAME mlp_dance3 IS_TOP 1
    SUBMODULES {
      {MODELNAME mlp_dance3_input RTLNAME mlp_dance3_input BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME mlp_dance3_weights_0 RTLNAME mlp_dance3_weights_0 BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME mlp_dance3_bias_0 RTLNAME mlp_dance3_bias_0 BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME mlp_dance3_regslice_both RTLNAME mlp_dance3_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME mlp_dance3_regslice_both_U}
    }
  }
}

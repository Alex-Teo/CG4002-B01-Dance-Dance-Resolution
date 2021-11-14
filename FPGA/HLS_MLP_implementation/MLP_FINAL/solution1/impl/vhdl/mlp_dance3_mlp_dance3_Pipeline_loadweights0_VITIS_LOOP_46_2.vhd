-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Version: 2021.1
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mlp_dance3_mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    S_AXIS_V_TVALID : IN STD_LOGIC;
    weights_0_address0 : OUT STD_LOGIC_VECTOR (13 downto 0);
    weights_0_ce0 : OUT STD_LOGIC;
    weights_0_we0 : OUT STD_LOGIC;
    weights_0_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    S_AXIS_V_TDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    S_AXIS_V_TREADY : OUT STD_LOGIC );
end;


architecture behav of mlp_dance3_mlp_dance3_Pipeline_loadweights0_VITIS_LOOP_46_2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv14_0 : STD_LOGIC_VECTOR (13 downto 0) := "00000000000000";
    constant ap_const_lv14_3200 : STD_LOGIC_VECTOR (13 downto 0) := "11001000000000";
    constant ap_const_lv14_1 : STD_LOGIC_VECTOR (13 downto 0) := "00000000000001";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_lv7_64 : STD_LOGIC_VECTOR (6 downto 0) := "1100100";
    constant ap_const_lv7_1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal icmp_ln45_fu_103_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal S_AXIS_V_TDATA_blk_n : STD_LOGIC;
    signal zext_ln48_fu_157_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal j_fu_54 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_j_load : STD_LOGIC_VECTOR (6 downto 0);
    signal add_ln46_fu_171_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal i_fu_58 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_sig_allocacmp_i_load : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln45_1_fu_141_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal indvar_flatten_fu_62 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_sig_allocacmp_indvar_flatten_load : STD_LOGIC_VECTOR (13 downto 0);
    signal add_ln45_1_fu_109_p2 : STD_LOGIC_VECTOR (13 downto 0);
    signal icmp_ln46_fu_127_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln45_fu_121_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln45_fu_133_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal tmp_s_fu_149_p3 : STD_LOGIC_VECTOR (14 downto 0);
    signal trunc_ln145_fu_162_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_condition_144 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component mlp_dance3_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component mlp_dance3_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((not(((ap_start_int = ap_const_logic_0) or ((ap_const_logic_0 = S_AXIS_V_TVALID) and (icmp_ln45_fu_103_p2 = ap_const_lv1_0)))) and (ap_loop_exit_ready = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    i_fu_58_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_144)) then
                if ((icmp_ln45_fu_103_p2 = ap_const_lv1_0)) then 
                    i_fu_58 <= select_ln45_1_fu_141_p3;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_58 <= ap_const_lv8_0;
                end if;
            end if; 
        end if;
    end process;

    indvar_flatten_fu_62_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_144)) then
                if ((icmp_ln45_fu_103_p2 = ap_const_lv1_0)) then 
                    indvar_flatten_fu_62 <= add_ln45_1_fu_109_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    indvar_flatten_fu_62 <= ap_const_lv14_0;
                end if;
            end if; 
        end if;
    end process;

    j_fu_54_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_144)) then
                if ((icmp_ln45_fu_103_p2 = ap_const_lv1_0)) then 
                    j_fu_54 <= add_ln46_fu_171_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    j_fu_54 <= ap_const_lv7_0;
                end if;
            end if; 
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_CS_fsm_state1, S_AXIS_V_TVALID, icmp_ln45_fu_103_p2, ap_start_int)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;

    S_AXIS_V_TDATA_blk_n_assign_proc : process(ap_CS_fsm_state1, S_AXIS_V_TVALID, icmp_ln45_fu_103_p2, ap_start_int)
    begin
        if (((icmp_ln45_fu_103_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_1))) then 
            S_AXIS_V_TDATA_blk_n <= S_AXIS_V_TVALID;
        else 
            S_AXIS_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    S_AXIS_V_TREADY_assign_proc : process(ap_CS_fsm_state1, S_AXIS_V_TVALID, icmp_ln45_fu_103_p2, ap_start_int)
    begin
        if ((not(((ap_start_int = ap_const_logic_0) or ((ap_const_logic_0 = S_AXIS_V_TVALID) and (icmp_ln45_fu_103_p2 = ap_const_lv1_0)))) and (icmp_ln45_fu_103_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            S_AXIS_V_TREADY <= ap_const_logic_1;
        else 
            S_AXIS_V_TREADY <= ap_const_logic_0;
        end if; 
    end process;

    add_ln45_1_fu_109_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_indvar_flatten_load) + unsigned(ap_const_lv14_1));
    add_ln45_fu_121_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_load) + unsigned(ap_const_lv8_1));
    add_ln46_fu_171_p2 <= std_logic_vector(unsigned(select_ln45_fu_133_p3) + unsigned(ap_const_lv7_1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_ST_fsm_state1_blk_assign_proc : process(S_AXIS_V_TVALID, icmp_ln45_fu_103_p2, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) or ((ap_const_logic_0 = S_AXIS_V_TVALID) and (icmp_ln45_fu_103_p2 = ap_const_lv1_0)))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(S_AXIS_V_TVALID, icmp_ln45_fu_103_p2, ap_start_int)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_start_int = ap_const_logic_0) or ((ap_const_logic_0 = S_AXIS_V_TVALID) and (icmp_ln45_fu_103_p2 = ap_const_lv1_0)));
    end process;


    ap_condition_144_assign_proc : process(ap_CS_fsm_state1, S_AXIS_V_TVALID, icmp_ln45_fu_103_p2, ap_start_int)
    begin
                ap_condition_144 <= (not(((ap_start_int = ap_const_logic_0) or ((ap_const_logic_0 = S_AXIS_V_TVALID) and (icmp_ln45_fu_103_p2 = ap_const_lv1_0)))) and (ap_const_logic_1 = ap_CS_fsm_state1));
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_state1, S_AXIS_V_TVALID, icmp_ln45_fu_103_p2, ap_start_int)
    begin
        if ((not(((ap_start_int = ap_const_logic_0) or ((ap_const_logic_0 = S_AXIS_V_TVALID) and (icmp_ln45_fu_103_p2 = ap_const_lv1_0)))) and (icmp_ln45_fu_103_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_state1, S_AXIS_V_TVALID, icmp_ln45_fu_103_p2, ap_loop_exit_ready, ap_done_reg, ap_start_int)
    begin
        if ((not(((ap_start_int = ap_const_logic_0) or ((ap_const_logic_0 = S_AXIS_V_TVALID) and (icmp_ln45_fu_103_p2 = ap_const_lv1_0)))) and (ap_loop_exit_ready = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_state1, S_AXIS_V_TVALID, icmp_ln45_fu_103_p2, ap_start_int)
    begin
        if ((not(((ap_start_int = ap_const_logic_0) or ((ap_const_logic_0 = S_AXIS_V_TVALID) and (icmp_ln45_fu_103_p2 = ap_const_lv1_0)))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_i_load_assign_proc : process(ap_CS_fsm_state1, ap_loop_init, i_fu_58)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_sig_allocacmp_i_load <= ap_const_lv8_0;
        else 
            ap_sig_allocacmp_i_load <= i_fu_58;
        end if; 
    end process;


    ap_sig_allocacmp_indvar_flatten_load_assign_proc : process(ap_CS_fsm_state1, ap_loop_init, indvar_flatten_fu_62)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_sig_allocacmp_indvar_flatten_load <= ap_const_lv14_0;
        else 
            ap_sig_allocacmp_indvar_flatten_load <= indvar_flatten_fu_62;
        end if; 
    end process;


    ap_sig_allocacmp_j_load_assign_proc : process(ap_CS_fsm_state1, j_fu_54, ap_loop_init)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_sig_allocacmp_j_load <= ap_const_lv7_0;
        else 
            ap_sig_allocacmp_j_load <= j_fu_54;
        end if; 
    end process;

    icmp_ln45_fu_103_p2 <= "1" when (ap_sig_allocacmp_indvar_flatten_load = ap_const_lv14_3200) else "0";
    icmp_ln46_fu_127_p2 <= "1" when (ap_sig_allocacmp_j_load = ap_const_lv7_64) else "0";
    select_ln45_1_fu_141_p3 <= 
        add_ln45_fu_121_p2 when (icmp_ln46_fu_127_p2(0) = '1') else 
        ap_sig_allocacmp_i_load;
    select_ln45_fu_133_p3 <= 
        ap_const_lv7_0 when (icmp_ln46_fu_127_p2(0) = '1') else 
        ap_sig_allocacmp_j_load;
    tmp_s_fu_149_p3 <= (select_ln45_1_fu_141_p3 & select_ln45_fu_133_p3);
    trunc_ln145_fu_162_p1 <= S_AXIS_V_TDATA(32 - 1 downto 0);
    weights_0_address0 <= zext_ln48_fu_157_p1(14 - 1 downto 0);

    weights_0_ce0_assign_proc : process(ap_CS_fsm_state1, S_AXIS_V_TVALID, icmp_ln45_fu_103_p2, ap_start_int)
    begin
        if ((not(((ap_start_int = ap_const_logic_0) or ((ap_const_logic_0 = S_AXIS_V_TVALID) and (icmp_ln45_fu_103_p2 = ap_const_lv1_0)))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            weights_0_ce0 <= ap_const_logic_1;
        else 
            weights_0_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    weights_0_d0 <= trunc_ln145_fu_162_p1;

    weights_0_we0_assign_proc : process(ap_CS_fsm_state1, S_AXIS_V_TVALID, icmp_ln45_fu_103_p2, ap_start_int)
    begin
        if ((not(((ap_start_int = ap_const_logic_0) or ((ap_const_logic_0 = S_AXIS_V_TVALID) and (icmp_ln45_fu_103_p2 = ap_const_lv1_0)))) and (icmp_ln45_fu_103_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            weights_0_we0 <= ap_const_logic_1;
        else 
            weights_0_we0 <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln48_fu_157_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_s_fu_149_p3),64));
end behav;
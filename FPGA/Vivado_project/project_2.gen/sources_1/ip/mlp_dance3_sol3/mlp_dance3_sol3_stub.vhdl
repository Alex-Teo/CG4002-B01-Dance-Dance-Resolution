-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
-- Date        : Tue Oct 12 04:16:15 2021
-- Host        : DESKTOP-F07M07L running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/o/nus_files/2122-Year4-sem-1/CG4002/YETONG-Ultra96/Ultra96-main/FPGA/HLS/MLP_FINAL/MLP_FINAL/solution3/impl/ip/mlp_dance3_sol3/mlp_dance3_sol3_stub.vhdl
-- Design      : mlp_dance3_sol3
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu3eg-sbva484-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mlp_dance3_sol3 is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    S_AXIS_V_TVALID : in STD_LOGIC;
    S_AXIS_V_TREADY : out STD_LOGIC;
    S_AXIS_V_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_V_TVALID : out STD_LOGIC;
    M_AXIS_V_TREADY : in STD_LOGIC;
    M_AXIS_V_TDATA : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );

end mlp_dance3_sol3;

architecture stub of mlp_dance3_sol3 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,S_AXIS_V_TVALID,S_AXIS_V_TREADY,S_AXIS_V_TDATA[63:0],M_AXIS_V_TVALID,M_AXIS_V_TREADY,M_AXIS_V_TDATA[63:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "mlp_dance3,Vivado 2021.1";
begin
end;

// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __mlp_dance3_mlp_dance3_Pipeline_layer1_bias_1_H__
#define __mlp_dance3_mlp_dance3_Pipeline_layer1_bias_1_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct mlp_dance3_mlp_dance3_Pipeline_layer1_bias_1_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 32;
  static const unsigned AddressRange = 8;
  static const unsigned AddressWidth = 3;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(mlp_dance3_mlp_dance3_Pipeline_layer1_bias_1_ram) {


SC_METHOD(prc_write_0);
  sensitive<<clk.pos();
   }


void prc_write_0()
{
    if (ce0.read() == sc_dt::Log_1) 
    {
            if(address0.read().is_01() && address0.read().to_uint()<AddressRange)
              q0 = ram[address0.read().to_uint()];
            else
              q0 = sc_lv<DataWidth>();
    }
}


}; //endmodule


SC_MODULE(mlp_dance3_mlp_dance3_Pipeline_layer1_bias_1) {


static const unsigned DataWidth = 32;
static const unsigned AddressRange = 8;
static const unsigned AddressWidth = 3;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


mlp_dance3_mlp_dance3_Pipeline_layer1_bias_1_ram* meminst;


SC_CTOR(mlp_dance3_mlp_dance3_Pipeline_layer1_bias_1) {
meminst = new mlp_dance3_mlp_dance3_Pipeline_layer1_bias_1_ram("mlp_dance3_mlp_dance3_Pipeline_layer1_bias_1_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);


meminst->reset(reset);
meminst->clk(clk);
}
~mlp_dance3_mlp_dance3_Pipeline_layer1_bias_1() {
    delete meminst;
}


};//endmodule
#endif

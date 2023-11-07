// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Tue Nov  7 23:11:13 2023
// Host        : DESKTOP-R2U1HPU running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {C:/Users/gjk19/Desktop/RISC
//               CPU/RISC_V_CPU/RISC_V_CPU.srcs/sources_1/ip/rom_32x256/rom_32x256_stub.v}
// Design      : rom_32x256
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2017.4" *)
module rom_32x256(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[7:0],douta[31:0]" */;
  input clka;
  input [7:0]addra;
  output [31:0]douta;
endmodule

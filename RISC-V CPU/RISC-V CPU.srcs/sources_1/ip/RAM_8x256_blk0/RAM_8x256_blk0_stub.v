// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Thu Oct 12 21:30:30 2023
// Host        : DESKTOP-JB05U9D running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/gjk19/Desktop/RISC CPU/RISC-V CPU/RISC-V
//               CPU.srcs/sources_1/ip/RAM_8x256_blk0/RAM_8x256_blk0_stub.v}
// Design      : RAM_8x256_blk0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2017.4" *)
module RAM_8x256_blk0(a, d, clk, we, spo)
/* synthesis syn_black_box black_box_pad_pin="a[7:0],d[7:0],clk,we,spo[7:0]" */;
  input [7:0]a;
  input [7:0]d;
  input clk;
  input we;
  output [7:0]spo;
endmodule

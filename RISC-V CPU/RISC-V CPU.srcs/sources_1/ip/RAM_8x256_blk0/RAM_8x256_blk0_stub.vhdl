-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Thu Oct 12 21:30:30 2023
-- Host        : DESKTOP-JB05U9D running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/Users/gjk19/Desktop/RISC CPU/RISC-V CPU/RISC-V
--               CPU.srcs/sources_1/ip/RAM_8x256_blk0/RAM_8x256_blk0_stub.vhdl}
-- Design      : RAM_8x256_blk0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RAM_8x256_blk0 is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 7 downto 0 );
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end RAM_8x256_blk0;

architecture stub of RAM_8x256_blk0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[7:0],d[7:0],clk,we,spo[7:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0_12,Vivado 2017.4";
begin
end;

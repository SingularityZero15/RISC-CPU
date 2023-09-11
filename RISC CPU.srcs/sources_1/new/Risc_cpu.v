`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/08 10:26:06
// Design Name: 
// Module Name: Risc_cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Risc_cpu(
    input Ex_clk,
    input Ex_Fetch_EN,
    input Ex_Inc_EN,
    input Ex_Set_EN
    );

    wire [15:0] In_Data_bus;
    wire In_Read_EN;
    wire [15:0] In_Address_Bus;
    wire In_Addr_EN;
    wire [15:0] In_Instruction;
    wire [1:0] In_Rd, In_Rs1, In_Rs2;
    wire [3:0] In_ALU_Opcode;
    wire In_Rs1_EN, In_Rs2_EN;
    wire In_ALU_Extended;
    wire [8:0] In_Immediate_num;
    wire [15:0] In_Data_Rd, In_Data_Rs1, In_Data_Rs2;
    wire In_Flag_in;
    wire In_Flag_out;
    wire In_Flag_EN;
    wire In_Rd_EN;
    wire In_GR_Store_EN;
    wire In_Instruction_decoder_Reset;

    Internal_rom Internal_rom_Inst(
        .clk(Ex_clk),
        .Enable(In_Read_EN),
        .Address_Bus(In_Address_Bus),
        .Data_bus(In_Data_bus)
    );

    Instruction_fetching Instruction_fetching_Inst(
        .clk(Ex_clk),
        .Fetch_EN(Ex_Fetch_EN),
        .Data_bus(In_Data_bus),
        .Instruction(In_Instruction),
        .Addr_EN(In_Addr_EN)
    );
    
    Program_Counter Program_Counter_Inst(
        .clk(Ex_clk),
        .Inc_EN(Ex_Inc_EN),
        .Read_EN(In_Read_EN),
        .Set_EN(Ex_Set_EN),
        .Address_Bus_In(In_Address_Bus),
        .Address_Bus_Out(In_Address_Bus),
        .Addr_EN(In_Addr_EN)
    );

    Instruction_decoder Instruction_decoder_Inst(
        .Instruction(In_Instruction),
        .Rd(In_Rd),
        .Rs1(In_Rs1),
        .Rs2(In_Rs2),
        .ALU_Opcode(In_ALU_Opcode),
        .Rd_EN(In_Rd_EN),
        .Rs1_EN(In_Rs1_EN),
        .Rs2_EN(In_Rs2_EN),
        .ALU_Extended(In_ALU_Extended),
        .Immediate_num(In_Immediate_num),
        .Reset(In_Instruction_decoder_Reset)
    );

    Runtime_register Runtime_register_Inst(
        .Address_out_a(In_Rs1),
        .Address_out_b(In_Rs2),
        .Address_in(In_Rd),
        .Data_out_a(In_Data_Rs1),
        .Data_out_b(In_Data_Rs2),
        .Data_in(In_Data_Rd),
        .Flag_in(In_Flag_in),
        .Flag_out(In_Flag_out),
        .A_EN(In_Rs1_EN),
        .B_EN(In_Rs2_EN),
        .I_EN(In_GR_Store_EN),
        .Flag_EN(In_GR_Store_EN)
    );

    ALU_16bit ALU_16bit_Inst(
        .func(In_ALU_Opcode),
        .op1(In_Data_Rs1),
        .op2(In_Rs2_EN ? In_Data_Rs2 : {7'b0000000, In_Immediate_num}),
        .extended(In_ALU_Extended),
        .carry_in(In_Flag_out),
        .result(In_Data_Rd),
        .carry_out(In_Flag_in)
    );

    Control_unit Control_unit_Inst(
        .clk(Ex_clk),
        .Rd_EN(In_Rd_EN),
        .GR_Store_EN(In_GR_Store_EN),
        .Instruction_decoder_Reset(In_Instruction_decoder_Reset)
    );

endmodule

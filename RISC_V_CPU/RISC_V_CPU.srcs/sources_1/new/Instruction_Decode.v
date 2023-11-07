`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/05 19:45:32
// Design Name: 
// Module Name: Instruction_Decode
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


module Instruction_Decode(
    input clk,

    input [31:0] Instruction,
    input RegWrite_In,
    input [4:0] Write_Register,
    input [31:0] Write_Data,
    
    output [31:0] Read_Data_1,
    output [31:0] Read_Data_2,
    output [31:0] Immediate_Number,

    output Branch,
    output [2:0] MemConf,
    output MemtoReg,
    output [1:0] ALUOp,
    output MemWrite,
    output ALUSrc,
    output RegWrite_Out,
    output ALU_Rs1_Zero,

    output [3:0] Instruction_30_14_12,
    output [4:0] Instruction_11_7,
    output [4:0] Instruction_19_15,
    output [4:0] Instruction_24_20
    );

    Controller Controller_inst(
        .Instruction_14_12_6_0({Instruction[14:12], Instruction[6:0]}),
        .Branch(Branch),
        .MemConf(MemConf),
        .MemtoReg(MemtoReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite_Out),
        .ALU_Rs1_Zero(ALU_Rs1_Zero)
    );

    Register_File Register_File_inst(
        .clk(clk),
        .Read_Register_1(Instruction[19:15]),
        .Read_Data_1(Read_Data_1),
        .Read_Register_2(Instruction[24:20]),
        .Read_Data_2(Read_Data_2),
        .Write_Register(Write_Register),
        .Write_Data(Write_Data),
        .RegWrite(RegWrite_In)
    );

    Immediate_Number_Generater Immediate_Number_Generater_inst(
        .Instruction(Instruction),
        .Immediate_Number(Immediate_Number)
    );

    assign Instruction_30_14_12 = {Instruction[30], Instruction[14:12]};
    assign Instruction_11_7 = Instruction[11:7];
    assign Instruction_19_15 = Instruction[19:15];
    assign Instruction_24_20 = Instruction[24:20];

endmodule

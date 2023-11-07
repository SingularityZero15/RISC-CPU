`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/07 13:35:17
// Design Name: 
// Module Name: CPU_Core
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


module CPU_Core(
    input clk,
    input rst
    );

    wire [31:0] REG_IF_Instruction_Address;
    wire MEM_IF_PCSrc;
    wire [31:0] IF_REG_PC_Address;
    wire [31:0] IF_REG_Instruction;

    wire [31:0] REG_ID_REG_PC_Address;
    wire [31:0] REG_ID_Instruction;
    wire REG_ID_RegWrite;
    wire [4:0] REG_ID_Write_Register;
    wire [31:0] WB_ID_Write_Data;

    wire [31:0] ID_REG_Read_Data_1;
    wire [31:0] ID_REG_Read_Data_2;
    wire [31:0] ID_REG_Immediate_Number;
    wire ID_REG_Branch;
    wire ID_REG_MemRead;
    wire ID_REG_MemtoReg;
    wire ID_REG_ALUOp;
    wire ID_REG_MemWrite;
    wire ID_REG_ALUSrc;
    wire ID_REG_RegWrite;
    wire [3:0] ID_REG_Instruction_30_14_12;
    wire [4:0] ID_REG_Instruction_11_7;

    wire REG_EX_REG_Branch;
    wire REG_EX_REG_MemRead;
    wire REG_EX_REG_MemtoReg;
    wire REG_EX_REG_MemWrite;
    wire REG_EX_REG_RegWrite;
    wire REG_EX_ALUOp;
    wire REG_EX_ALUSrc;
    wire [31:0] REG_EX_PC_Address;
    wire [31:0] REG_EX_Read_Data_1;
    wire [31:0] REG_EX_Read_Data_2;
    wire [31:0] REG_EX_REG_Read_Data_2;
    assign REG_EX_REG_Read_Data_2 = REG_EX_Read_Data_2;
    wire [31:0] REG_EX_Immediate_Number;
    wire [3:0] REG_EX_Instruction_30_14_12;
    wire [4:0] REG_EX_REG_Instruction_11_7;

    wire [31:0] EX_REG_Instruction_Address;
    wire EX_REG_Zero;
    wire [31:0] EX_REG_ALU_result;

    wire REG_MEM_REG_MemtoReg;
    wire REG_MEM_REG_RegWrite;
    wire REG_MEM_Branch;
    wire REG_MEM_MemRead;
    wire REG_MEM_MemWrite;
    wire REG_MEM_Zero;
    wire [31:0] REG_MEM_ALU_result;
    wire [31:0] REG_MEM_REG_ALU_result;
    assign REG_MEM_REG_ALU_result = REG_MEM_ALU_result;
    wire [31:0] REG_MEM_Read_Data_2;
    wire [4:0] REG_MEM_REG_Instruction_11_7;

    wire [31:0] MEM_REG_Read_Data;

    wire REG_WB_MemtoReg;
    wire [31:0] REG_WB_Read_Data;
    wire [31:0] REG_WB_ALU_result;

    Instruction_Fetch Instruction_Fetch_inst(
        .clk(clk),
        .rst(rst),
        .Instruction_Address(REG_IF_Instruction_Address),
        .PCSrc(MEM_IF_PCSrc),
        .PC_Address(IF_REG_PC_Address),
        .Instruction(IF_REG_Instruction)
    );

    IF_ID_Register IF_ID_Register_inst(
        .clk(clk),
        .rst(rst),
        .PC_Address_In(IF_REG_PC_Address),
        .Instruction_In(IF_REG_Instruction),
        .PC_Address_Out(REG_ID_REG_PC_Address),
        .Instruction_Out(REG_ID_Instruction)
    );

    Instruction_Decode Instruction_Decode_inst(
        .clk(clk),
        .Instruction(REG_ID_Instruction),
        .RegWrite_In(REG_ID_RegWrite),
        .Write_Register(REG_ID_Write_Register),
        .Write_Data(WB_ID_Write_Data),
        .Read_Data_1(ID_REG_Read_Data_1),
        .Read_Data_2(ID_REG_Read_Data_2),
        .Immediate_Number(ID_REG_Immediate_Number),
        .Branch(ID_REG_Branch),
        .MemRead(ID_REG_MemRead),
        .MemtoReg(ID_REG_MemtoReg),
        .ALUOp(ID_REG_ALUOp),
        .MemWrite(ID_REG_MemWrite),
        .ALUSrc(ID_REG_ALUSrc),
        .RegWrite_Out(ID_REG_RegWrite),
        .Instruction_30_14_12(ID_REG_Instruction_30_14_12),
        .Instruction_11_7(ID_REG_Instruction_11_7)
    );

    ID_EX_Register ID_EX_Register_inst(
        .clk(clk),
        .rst(rst),
        .Branch_In(ID_REG_Branch),
        .MemRead_In(ID_REG_MemRead),
        .MemtoReg_In(ID_REG_MemtoReg),
        .ALUOp_In(ID_REG_ALUOp),
        .MemWrite_In(ID_REG_MemWrite),
        .ALUSrc_In(ID_REG_ALUSrc),
        .RegWrite_In(ID_REG_RegWrite),
        .PC_Address_In(REG_ID_REG_PC_Address),
        .Read_Data_1_In(ID_REG_Read_Data_1),
        .Read_Data_2_In(ID_REG_Read_Data_2),
        .Immediate_Number_In(ID_REG_Immediate_Number),
        .Instruction_30_14_12_In(ID_REG_Instruction_30_14_12),
        .Instruction_11_7_In(ID_REG_Instruction_11_7),
        .Branch_Out(REG_EX_REG_Branch),
        .MemRead_Out(REG_EX_REG_MemRead),
        .MemtoReg_Out(REG_EX_REG_MemtoReg),
        .ALUOp_Out(REG_EX_ALUOp),
        .MemWrite_Out(REG_EX_REG_MemWrite),
        .ALUSrc_Out(REG_EX_ALUSrc),
        .RegWrite_Out(REG_EX_REG_RegWrite),
        .PC_Address_Out(REG_EX_PC_Address),
        .Read_Data_1_Out(REG_EX_Read_Data_1),
        .Read_Data_2_Out(REG_EX_Read_Data_2),
        .Immediate_Number_Out(REG_EX_Immediate_Number),
        .Instruction_30_14_12_Out(REG_EX_Instruction_30_14_12),
        .Instruction_11_7_Out(REG_EX_REG_Instruction_11_7)
    );

    Execute Execute_inst(
        .PC_Address(REG_EX_PC_Address),
        .Read_Data_1(REG_EX_Read_Data_1),
        .Read_Data_2(REG_EX_Read_Data_2),
        .Immediate_Number(REG_EX_Immediate_Number),
        .Instruction_30_14_12(REG_EX_Instruction_30_14_12),
        .ALUOp(REG_EX_ALUOp),
        .ALUSrc(REG_EX_ALUSrc),
        .Instruction_Address(EX_REG_Instruction_Address),
        .Zero(EX_REG_Zero),
        .ALU_result(EX_REG_ALU_result)
    );

    EX_MEM_Register EX_MEM_Register_inst(
        .clk(clk),
        .rst(rst),
        .Branch_In(REG_EX_REG_Branch),
        .MemRead_In(REG_EX_REG_MemRead),
        .MemtoReg_In(REG_EX_REG_MemtoReg),
        .MemWrite_In(REG_EX_REG_MemWrite),
        .RegWrite_In(REG_EX_REG_RegWrite),
        .Instruction_Address_In(EX_REG_Instruction_Address),
        .Zero_In(EX_REG_Zero),
        .ALU_result_In(EX_REG_ALU_result),
        .Read_Data_2_In(REG_EX_REG_Read_Data_2),
        .Instruction_11_7_In(REG_EX_REG_Instruction_11_7),
        .Branch_Out(REG_MEM_Branch),
        .MemRead_Out(REG_MEM_MemRead),
        .MemtoReg_Out(REG_MEM_REG_MemtoReg),
        .MemWrite_Out(REG_MEM_MemWrite),
        .RegWrite_Out(REG_MEM_REG_RegWrite),
        .Instruction_Address_Out(REG_IF_Instruction_Address),
        .Zero_Out(REG_MEM_Zero),
        .ALU_result_Out(REG_MEM_ALU_result),
        .Read_Data_2_Out(REG_MEM_Read_Data_2),
        .Instruction_11_7_Out(REG_MEM_REG_Instruction_11_7)
    );

    Memory Memory_inst(
        .clk(clk),
        .Branch(REG_MEM_Branch),
        .MemRead(REG_MEM_MemRead),
        .MemWrite(REG_MEM_MemWrite),
        .Zero(REG_MEM_Zero),
        .ALU_result(REG_MEM_ALU_result),
        .Read_Data_2(REG_MEM_Read_Data_2),
        .PCSrc(MEM_IF_PCSrc),
        .Read_Data(MEM_REG_Read_Data)
    );

    MEM_WB_Register MEM_WB_Register_inst(
        .clk(clk),
        .rst(rst),
        .MemtoReg_In(REG_MEM_REG_MemtoReg),
        .RegWrite_In(REG_MEM_REG_RegWrite),
        .Read_Data_In(MEM_REG_Read_Data),
        .ALU_result_In(REG_MEM_REG_ALU_result),
        .Instruction_11_7_In(REG_MEM_REG_Instruction_11_7),
        .MemtoReg_Out(REG_WB_MemtoReg),
        .RegWrite_Out(REG_ID_RegWrite),
        .Read_Data_Out(REG_WB_Read_Data),
        .ALU_result_Out(REG_WB_ALU_result),
        .Instruction_11_7_Out(REG_ID_Write_Register)
    );

    Write_Back Write_Back_inst(
        .MemtoReg(REG_WB_MemtoReg),
        .Read_Data(REG_WB_Read_Data),
        .ALU_result(REG_WB_ALU_result),
        .Register_Write_Data(WB_ID_Write_Data)
    );
endmodule

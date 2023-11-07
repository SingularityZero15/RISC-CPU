`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/06 14:43:57
// Design Name: 
// Module Name: ID_EX_Register
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


module ID_EX_Register(
    input clk,
    input rst,

    input Branch_In,
    input MemRead_In,
    input MemtoReg_In,
    input ALUOp_In,
    input MemWrite_In,
    input ALUSrc_In,
    input RegWrite_In,

    input [31:0] PC_Address_In,
    input [31:0] Read_Data_1_In,
    input [31:0] Read_Data_2_In,
    input [31:0] Immediate_Number_In,

    input [3:0] Instruction_30_14_12_In,
    input [4:0] Instruction_11_7_In,

    output reg Branch_Out,
    output reg MemRead_Out,
    output reg MemtoReg_Out,
    output reg ALUOp_Out,
    output reg MemWrite_Out,
    output reg ALUSrc_Out,
    output reg RegWrite_Out,

    output reg [31:0] PC_Address_Out,
    output reg [31:0] Read_Data_1_Out,
    output reg [31:0] Read_Data_2_Out,
    output reg [31:0] Immediate_Number_Out,

    output reg [3:0] Instruction_30_14_12_Out,
    output reg [4:0] Instruction_11_7_Out
    );

    always @(posedge clk) begin
    end
    
    always @(posedge clk) begin
        if (rst) begin
            Branch_Out = 0;
            MemRead_Out = 0;
            MemtoReg_Out = 0;
            ALUOp_Out = 0;
            MemWrite_Out = 0;
            ALUSrc_Out = 0;
            RegWrite_Out = 0;

            PC_Address_Out = 0;
            Read_Data_1_Out = 0;
            Read_Data_2_Out = 0;
            Immediate_Number_Out = 0;

            Instruction_30_14_12_Out = 0;
            Instruction_11_7_Out = 0;
        end else begin
            Branch_Out = Branch_In;
            MemRead_Out = MemRead_In;
            MemtoReg_Out = MemtoReg_In;
            ALUOp_Out = ALUOp_In;
            MemWrite_Out = MemWrite_In;
            ALUSrc_Out = ALUSrc_In;
            RegWrite_Out = RegWrite_In;

            PC_Address_Out = PC_Address_In;
            Read_Data_1_Out = Read_Data_1_In;
            Read_Data_2_Out = Read_Data_2_In;
            Immediate_Number_Out = Immediate_Number_In;

            Instruction_30_14_12_Out = Instruction_30_14_12_In;
            Instruction_11_7_Out = Instruction_11_7_In;
        end
    end
endmodule

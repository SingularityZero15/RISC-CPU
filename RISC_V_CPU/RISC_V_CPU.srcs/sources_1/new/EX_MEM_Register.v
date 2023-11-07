`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/06 20:28:26
// Design Name: 
// Module Name: EX_MEM_Register
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


module EX_MEM_Register(
    input clk,
    input rst,

    input Branch_In,
    input [2:0] MemConf_In,
    input MemtoReg_In,
    input MemWrite_In,
    input RegWrite_In,

    input [31:0] Instruction_Address_In,
    input Zero_In,
    input [31:0] ALU_result_In,
    input [31:0] Read_Data_2_In,
    input [4:0] Instruction_11_7_In,

    output reg Branch_Out,
    output reg [2:0] MemConf_Out,
    output reg MemtoReg_Out,
    output reg MemWrite_Out,
    output reg RegWrite_Out,

    output reg [31:0] Instruction_Address_Out,
    output reg Zero_Out,
    output reg [31:0] ALU_result_Out,
    output reg [31:0] Read_Data_2_Out,
    output reg [4:0] Instruction_11_7_Out
    );

    always @(posedge clk) begin
        if (rst) begin
            Branch_Out = 0;
            MemConf_Out = 0;
            MemtoReg_Out = 0;
            MemWrite_Out = 0;
            RegWrite_Out = 0;

            Instruction_Address_Out = 0;
            Zero_Out = 0;
            ALU_result_Out = 0;
            Read_Data_2_Out = 0;
            Instruction_11_7_Out = 0;
        end else begin
            Branch_Out = Branch_In;
            MemConf_Out = MemConf_In;
            MemtoReg_Out = MemtoReg_In;
            MemWrite_Out = MemWrite_In;
            RegWrite_Out = RegWrite_In;

            Instruction_Address_Out = Instruction_Address_In;
            Zero_Out = Zero_In;
            ALU_result_Out = ALU_result_In;
            Read_Data_2_Out = Read_Data_2_In;
            Instruction_11_7_Out = Instruction_11_7_In;
        end
    end
endmodule

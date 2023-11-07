`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/06 21:26:46
// Design Name: 
// Module Name: MEM_WB_Register
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


module MEM_WB_Register(
    input clk,
    input rst,

    input MemtoReg_In,
    input RegWrite_In,

    input [31:0] Read_Data_In,
    input [31:0] ALU_result_In,

    input [4:0] Instruction_11_7_In,

    output reg MemtoReg_Out,
    output reg RegWrite_Out,

    output reg [31:0] Read_Data_Out,
    output reg [31:0] ALU_result_Out,

    output reg [4:0] Instruction_11_7_Out
    );

    always @(posedge clk) begin
        MemtoReg_Out = MemtoReg_In;
        RegWrite_Out = RegWrite_In;
        Read_Data_Out = Read_Data_In;
        ALU_result_Out = ALU_result_In;
        Instruction_11_7_Out = Instruction_11_7_In;
    end

    always @(posedge clk) begin
        if (rst) begin
            MemtoReg_Out = 0;
            RegWrite_Out = 0;
            Read_Data_Out = 0;
            ALU_result_Out = 0;
            Instruction_11_7_Out = 0;
        end else begin
            MemtoReg_Out = MemtoReg_In;
            RegWrite_Out = RegWrite_In;
            Read_Data_Out = Read_Data_In;
            ALU_result_Out = ALU_result_In;
            Instruction_11_7_Out = Instruction_11_7_In;
        end
    end
endmodule

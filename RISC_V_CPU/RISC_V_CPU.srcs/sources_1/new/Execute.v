`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/06 16:42:51
// Design Name: 
// Module Name: Execute
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


module Execute(
    input [31:0] PC_Address,
    input [31:0] Read_Data_1,
    input [31:0] Read_Data_2,
    input [31:0] Immediate_Number,
    
    input [3:0] Instruction_30_14_12,
    input ALUOp,
    input ALUSrc,

    output [31:0] Instruction_Address,
    output Zero,
    output [31:0] ALU_result
    );

    wire [2:0] funct3;
    wire funct7;

    assign Instruction_Address = PC_Address + (Immediate_Number << 1);

    Arithmetic_Logic_Unit Arithmetic_Logic_Unit_inst(
        .funct3(funct3),
        .funct7(funct7),
        .operand1(Read_Data_1),
        .operand2(ALUSrc ? Immediate_Number : Read_Data_2),
        .ALU_result(ALU_result),
        .Zero(Zero)
    );

    ALU_Control ALU_Control_inst(
        .ALUOp(ALUOp),
        .Instruction_30_14_12(Instruction_30_14_12),
        .funct3(funct3),
        .funct7(funct7)
    );

endmodule

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
    input [1:0] ALUOp,
    input ALUSrc,
    input ALU_Rs1_Zero,

    output [31:0] Instruction_Address,
    output Zero,
    output [31:0] ALU_result,

    input [4:0] EX_RS1,
    input [4:0] EX_RS2,
    input [4:0] EX_MEM_RD,
    input [4:0] MEM_WB_RD,
    input EX_MEM_RegWrite,
    input MEM_WB_RegWrite,
    input [31:0] MEM_ALU_result,
    input [31:0] WB_Write_Data
    );

    wire [2:0] funct3;
    wire funct7;

    assign Instruction_Address = PC_Address + Immediate_Number;

    reg [31:0] operand1;
    reg [31:0] operand2;
    wire [1:0] ForwardA;
    wire [1:0] ForwardB;

    always @(*) begin
        case (ForwardA)
            2'b10: begin
                operand1 = MEM_ALU_result;
            end
            2'b01: begin
                operand1 = WB_Write_Data;
            end
            default: begin
                operand1 = Read_Data_1;
            end
        endcase
        
        case (ForwardB)
            2'b10: begin
                operand2 = MEM_ALU_result;
            end
            2'b01: begin
                operand2 = WB_Write_Data;
            end
            default: begin
                operand2 = Read_Data_2;
            end
        endcase
    end

    Arithmetic_Logic_Unit Arithmetic_Logic_Unit_inst(
        .funct3(funct3),
        .funct7(funct7),
        .operand1(ALU_Rs1_Zero ? 0 : operand1),
        .operand2(ALUSrc ? Immediate_Number : operand2),
        .ALU_result(ALU_result),
        .Zero(Zero)
    );

    ALU_Control ALU_Control_inst(
        .ALUOp(ALUOp),
        .Instruction_30_14_12(Instruction_30_14_12),
        .funct3(funct3),
        .funct7(funct7)
    );
    
    Forwarding_Unit Forwarding_Unit_inst(
        .EX_RS1(EX_RS1),
        .EX_RS2(EX_RS2),
        .EX_MEM_RD(EX_MEM_RD),
        .MEM_WB_RD(MEM_WB_RD),
        .EX_MEM_RegWrite(EX_MEM_RegWrite),
        .MEM_WB_RegWrite(MEM_WB_RegWrite),
        .ForwardA(ForwardA),
        .ForwardB(ForwardB)
    );
endmodule

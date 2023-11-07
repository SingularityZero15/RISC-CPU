`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/06 16:39:34
// Design Name: 
// Module Name: ALU_Control
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


module ALU_Control(
    input [1:0] ALUOp,
    input [3:0] Instruction_30_14_12,
    output [2:0] funct3,
    output funct7
    );

    assign funct3 = Instruction_30_14_12[2:0] & {3{ALUOp[0]}};
    assign funct7 = Instruction_30_14_12[3] & ALUOp[0] & (funct3 == 3'b101 || ALUOp[1]);

endmodule

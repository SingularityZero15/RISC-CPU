`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/05 20:14:00
// Design Name: 
// Module Name: Controller
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


module Controller(
    input [9:0] Instruction_14_12_6_0,
    output reg Branch,
    output reg [2:0] MemConf,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg [2:0] MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg ALU_Rs1_Zero
    );

    always @(*) begin
        case (Instruction_14_12_6_0)
            7'b0110111: begin
                Branch = 0;
                MemConf = 0;
                MemtoReg = 0;
                ALUOp = 2'b00;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 1;
                ALU_Rs1_Zero = 1;
            end
            7'b1100011: begin
                Branch = 1;
                MemConf = 0;
                MemtoReg = 0;
                ALUOp = 2'b01;
                MemWrite = 0;
                ALUSrc = 0;
                RegWrite = 0;
                ALU_Rs1_Zero = 0;
            end
            7'b0000011: begin
                Branch = 0;
                MemConf = Instruction_14_12_6_0[9:7];
                MemtoReg = 1;
                ALUOp = 2'b00;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 1;
                ALU_Rs1_Zero = 0;
            end
            7'b0100011: begin
                Branch = 0;
                MemConf = Instruction_14_12_6_0[9:7];
                MemtoReg = 0;
                ALUOp = 2'b00;
                MemWrite = 1;
                ALUSrc = 1;
                RegWrite = 0;
                ALU_Rs1_Zero = 0;
            end
            7'b0010011: begin
                Branch = 0;
                MemConf = 0;
                MemtoReg = 0;
                ALUOp = 2'b01;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 1;
                ALU_Rs1_Zero = 0;
            end
            7'b0110011: begin
                Branch = 0;
                MemConf = 0;
                MemtoReg = 0;
                ALUOp = 2'b11;
                MemWrite = 0;
                ALUSrc = 0;
                RegWrite = 1;
                ALU_Rs1_Zero = 0;
            end
            default: begin
                Branch = 0;
                MemConf = 0;
                MemtoReg = 0;
                ALUOp = 0;
                MemWrite = 0;
                ALUSrc = 0;
                RegWrite = 0;
                ALU_Rs1_Zero = 0;
            end
        endcase
    end

endmodule

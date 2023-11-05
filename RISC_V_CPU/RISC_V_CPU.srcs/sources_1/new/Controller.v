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
    input [6:0] Instruction,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
    );

    always @(*) begin
        case (Instruction)
            7'b0010011: begin
                Branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 1;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 1;
            end
            7'b0110011: begin
                Branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 1;
                MemWrite = 0;
                ALUSrc = 0;
                RegWrite = 1;
            end
            default: begin
                Branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 0;
                MemWrite = 0;
                ALUSrc = 0;
                RegWrite = 0;
            end
        endcase
    end

endmodule

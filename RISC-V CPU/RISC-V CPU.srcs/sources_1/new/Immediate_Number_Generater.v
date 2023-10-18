`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/15 20:28:27
// Design Name: 
// Module Name: Immediate_Number_Generater
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


module Immediate_Number_Generater(
    input [31:0] Instruction,
    output reg [31:0] Immediate_Number
    );

    always @(*) begin
        case (Instruction[6:0])
            //R-type
            //I-type
            7'b0000011: begin
                Immediate_Number[11:0] <= Instruction[31:20];
                Immediate_Number[31:12] <= Instruction[31];
            end
            7'b0010011: begin
                Immediate_Number[11:0] <= Instruction[31:20];
                Immediate_Number[31:12] <= Instruction[31];
            end
            7'b1110011: begin
                Immediate_Number[11:0] <= Instruction[31:20];
                Immediate_Number[31:12] <= Instruction[31];
            end
            7'b1100111: begin
                Immediate_Number[11:1] <= Instruction[31:21];
                Immediate_Number[31:12] <= Instruction[31];
                Immediate_Number[0] <= 0;
            end
            //S-type
            7'b0100011: begin
                Immediate_Number[11:5] <= Instruction[31:25];
                Immediate_Number[4:0] <= Instruction[11:7];
                Immediate_Number[31:12] <= Instruction[31];
            end
            //B-type
            7'b1100011: begin
                Immediate_Number[12] <= Instruction[31];
                Immediate_Number[10:5] <= Instruction[30:25];
                Immediate_Number[4:1] <= Instruction[11:8];
                Immediate_Number[11] <= Instruction[7];
                Immediate_Number[31:13] <= Instruction[31];
                Immediate_Number[0] <= 0;
            end
            // U-type
            7'b0010111: begin
                Immediate_Number[31:12] <= Instruction[31:12];
                Immediate_Number[11:0] <= 0;
            end
            7'b0110111: begin
                Immediate_Number[31:12] <= Instruction[31:12];
                Immediate_Number[11:0] <= 0;
            end
            //J-type
            7'b1101111: begin
                Immediate_Number[20] <= Instruction[31];
                Immediate_Number[10:1] <= Instruction[30:21];
                Immediate_Number[11] <= Instruction[20];
                Immediate_Number[19:12] <= Instruction[19:12];
                Immediate_Number[31:21] <= Instruction[31];
                Immediate_Number[0] <= 0;
            end
            //default
            default: begin
                Immediate_Number <= 0;
            end
        endcase
    end

endmodule

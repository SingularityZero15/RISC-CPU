`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/15 20:11:06
// Design Name: 
// Module Name: Instruction_Register
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


module Instruction_Register(
    input Write_Enable,
    input [31:0] In_Instruction,
    output reg [31:0] Out_Instruction
    );

    always @(*) begin
        if (Write_Enable) begin
            Out_Instruction <= In_Instruction;
        end
    end

endmodule

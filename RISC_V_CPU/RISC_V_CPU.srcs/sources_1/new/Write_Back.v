`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/06 21:31:04
// Design Name: 
// Module Name: Write_Back
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


module Write_Back(
    input MemtoReg,

    input [31:0] Read_Data,
    input [31:0] ALU_result,

    output [31:0] Register_Write_Data
    );

    assign Register_Write_Data = MemtoReg ? Read_Data : ALU_result;

endmodule

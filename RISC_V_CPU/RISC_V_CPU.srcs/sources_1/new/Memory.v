`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/06 20:48:12
// Design Name: 
// Module Name: Memory
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


module Memory(
    input clk,

    input Branch,
    input MemRead,
    input MemWrite,

    input Zero,
    input [31:0] ALU_result,
    input [31:0] Read_Data_2,

    output PCSrc,
    output [31:0] Read_Data
    );

    assign PCSrc = Branch & Zero;
    
    Data_Memory Data_Memory_inst(
        .clk(~clk),
        // .Read_Unsigned(),
        .Write_Enable(MemWrite),
        // .Data_Width(),
        .Address(ALU_result),
        .In_Data(Read_Data_2),
        .Out_Data(Read_Data)
    );
endmodule

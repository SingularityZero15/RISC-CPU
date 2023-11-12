`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/05 19:55:14
// Design Name: 
// Module Name: Register_File
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


module Register_File(
    input clk,
    input [4:0] Read_Register_1,
    output [31:0] Read_Data_1,
    input [4:0] Read_Register_2,
    output [31:0] Read_Data_2,
    input [4:0] Write_Register,
    input [31:0] Write_Data,
    input RegWrite
    );
    
    integer i;
    
    reg [31:0] Registers [31:0];
    assign Read_Data_1 = (Write_Register == Read_Register_1) ? Write_Data : Registers[Read_Register_1];
    assign Read_Data_2 = (Write_Register == Read_Register_2) ? Write_Data : Registers[Read_Register_2];

    always @(posedge clk) begin
        if (RegWrite) begin
            if (Write_Register != 0) begin
                Registers[Write_Register] = Write_Data;
            end
        end
    end

    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            Registers[i] = 0;
        end
    end
endmodule
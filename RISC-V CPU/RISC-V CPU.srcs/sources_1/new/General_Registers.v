`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/12 20:40:34
// Design Name: 
// Module Name: General_Registers
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

module General_Registers(
    input [4:0] Read_Address_1,
    input [4:0] Read_Address_2,
    input [4:0] Write_Address,
    input [31:0] Write_Data,
    input Register_Write,
    output reg [31:0] Read_Data_1,
    output reg [31:0] Read_Data_2
    );
    
    reg [31:0] Registers [31:0];

    always @(Read_Address_1) begin
        Read_Data_1 <= Registers[Read_Address_1];
    end

    always @(Read_Address_2) begin
        Read_Data_2 <= Registers[Read_Address_2];
    end

    always @(posedge Register_Write) begin
        Registers[Write_Address] <= Write_Data;
    end
endmodule
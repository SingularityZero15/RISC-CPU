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
    output reg [31:0] Read_Data_1,
    input [4:0] Read_Address_2,
    output [31:0] Read_Data_2,
    input Store_Instruction,
    output [31:0] Read_Data_2_to_Bus,
    input [4:0] Write_Address,
    input [31:0] Write_Data,
    input Register_Write
    );
    
    reg [31:0] Registers [31:0];
    reg [31:0] __Read_Data_2;
    assign Read_Data_2 = __Read_Data_2;
    assign Read_Data_2_to_Bus = Store_Instruction ? __Read_Data_2 : 32'bz;

    always @(Read_Address_1) begin
        Read_Data_1 <= Registers[Read_Address_1];
    end

    always @(Read_Address_2) begin
        __Read_Data_2 <= Registers[Read_Address_2];
    end

    always @(posedge Register_Write) begin
        if (Write_Address != 5'b0) begin
            Registers[Write_Address] <= Write_Data;
        end
    end
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/08 10:26:06
// Design Name: 
// Module Name: Risc_cpu
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


module Risc_cpu(
    input Ex_clk,
    input Ex_Fetch_EN,
    input Ex_Inc_EN,
    input Ex_Set_EN,
    input [15:0] Ex_Address_Bus,
    output [15:0] Ex_Instruction
    );

    wire [15:0] In_Data_bus;
    wire In_Read_EN;
    wire [15:0] In_Address_Bus;
    wire In_Addr_EN;

    Internal_rom Internal_rom_Inst(
        .clk(Ex_clk),
        .Enable(In_Read_EN),
        .Address_Bus(Ex_Address_Bus),
        .Data_bus(In_Data_bus)
    );

    Instruction_fetching Instruction_fetching_Inst(
        .Fetch_EN(Ex_Fetch_EN),
        .Data_bus(In_Data_bus),
        .Instruction(Ex_Instruction),
        .Addr_EN(In_Addr_EN)
    );
    
    Program_Counter Program_Counter_Inst(
        .Inc_EN(Ex_Inc_EN),
        .Read_EN(In_Read_EN),
        .Set_EN(Ex_Set_EN),
        .Address_Bus_In(Ex_Address_Bus),
        .Address_Bus_Out(Ex_Address_Bus),
        .Addr_EN(In_Addr_EN)
    );

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/22 14:12:14
// Design Name: 
// Module Name: Micro_Processor_Unit
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


module Micro_Processor_Unit(
    input Clock,
    input Reset
    );

    wire [31:0] Address_Bus;
    wire [31:0] Data_Bus;
    wire [4:0] Control_Bus;

    CPU_Core CPU_Core_inst(
        .External_Clock(Clock),
        .External_Reset(Reset),
        .Address_Bus(Address_Bus),
        .Data_Bus(Data_Bus),
        .Control_Bus(Control_Bus)
    );

    Firmware_ROM Firmware_ROM_inst(
        .CLK(Clock),
        .Read_Enable(Control_Bus[0]),
        .Read_Unsigned(Control_Bus[1]),
        .Data_Width(Control_Bus[4:3]),
        .Address(Address_Bus),
        .Out_Data(Data_Bus)
    );

    General_RAM General_RAM_inst(
        .CLK(Clock),
        .Read_Enable(Control_Bus[0]),
        .Read_Unsigned(Control_Bus[1]),
        .Write_Enable(Control_Bus[2]),
        .Data_Width(Control_Bus[4:3]),
        .Address(Address_Bus),
        .In_Data(Data_Bus),
        .Out_Data(Data_Bus)
    );

endmodule

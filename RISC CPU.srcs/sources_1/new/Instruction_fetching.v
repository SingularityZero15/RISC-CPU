`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/07 19:26:56
// Design Name: 
// Module Name: Instruction_fetching
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

`define PERIOD 10

module Instruction_fetching(
    input clk,
    input Fetch_EN,
    input Inc_EN,
    input [15:0] Data_bus,
    //input [15:0] PC_Reg,
    output reg [15:0] Instruction,
    // output reg Read_EN,
    output Read_EN,
    output [15:0] Address_Bus
    );

    reg Addr_EN;

    initial begin
        Instruction <= 16'hzzzz;
        Addr_EN = 1'b0;
    end

    always @(posedge Fetch_EN ) begin
        Addr_EN <= 1'b1;
        # (`PERIOD * 1.5)
        Instruction <= Data_bus;
        Addr_EN <= 1'b0;
    end

    Program_Counter Program_Counter_Inst(
        // .clk(clk),
        .Inc_EN(Inc_EN),
        .Read_EN(Read_EN),
        .Address_Bus(Address_Bus),
        .Addr_EN(Addr_EN)
    );
endmodule

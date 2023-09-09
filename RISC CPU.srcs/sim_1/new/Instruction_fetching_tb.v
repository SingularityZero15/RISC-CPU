`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/07 20:46:14
// Design Name: 
// Module Name: Instruction_fetching_tb
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

module Instruction_fetching_tb(

    );

    reg clk;
    reg in_Fetch_EN;
    reg [15:0] in_Data_Bus;
    wire [15:0] out_Instruction;
    wire [15:0] out_Address_Bus;
    wire out_Read_EN;

    initial begin
        in_Data_Bus <= 16'h0000;
        in_Fetch_EN <= 0;
    end

    always begin
        clk <= 1'b0;
        #(`PERIOD/2)
        clk <= 1'b1;
        #(`PERIOD/2);
    end

    always @(posedge clk ) begin
        in_Fetch_EN <= 1;
        #3
        in_Fetch_EN <= 0;
        #7;
    end

    always @(posedge out_Read_EN ) begin
        in_Data_Bus <= out_Address_Bus + 16'h0004;
    end

    Instruction_fetching Instruction_fetching_inst(
        .clk(clk),
        .Fetch_EN(in_Fetch_EN),
        .Data_bus(in_Data_Bus),
        .Instruction(out_Instruction),
        .Address_Bus(out_Address_Bus),
        .Read_EN(out_Read_EN)
    );
endmodule

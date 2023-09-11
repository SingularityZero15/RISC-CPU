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
    input [15:0] Data_bus,
    output reg [15:0] Instruction,
    output reg Addr_EN
    );

    reg counter_en;
    reg [1:0] clk_counter;

    initial begin
        Instruction <= 16'hzzzz;
        Addr_EN = 1'b0;
        counter_en <= 1'b0;
        clk_counter <= 2'b00;
    end

    always @(posedge clk) begin
        if (counter_en) begin
            clk_counter <= clk_counter + 1;
        end

        if (Fetch_EN && clk_counter == 2'b11) begin
            counter_en <= 1'b1;
            clk_counter <= 2'b00;
            Instruction <= Data_bus;
            Addr_EN<= 1'b0;
        end
    end

    always @(posedge Fetch_EN ) begin
        Addr_EN <= 1'b1;
        counter_en <= 1'b1;
    end

endmodule

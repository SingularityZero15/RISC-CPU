`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/11 11:43:23
// Design Name: 
// Module Name: Double_edge_counter_3bit
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


module Double_edge_counter_3bit(
    input clk,
    input Reset,
    output reg [2:0] Count
    );

    reg [2:0] clk_counter1, clk_counter2;

    always @(*) begin
        if(clk)
            Count = clk_counter1;
        else
            Count = clk_counter2;
    end

    always @(posedge clk) begin
        clk_counter1 <= clk_counter2 + 1'b1;
    end

    always @(negedge clk) begin
        clk_counter2 <= clk_counter1 + 1'b1;
    end

    always @(posedge Reset) begin
        clk_counter1 <= 3'b000;
        clk_counter2 <= 3'b000;
    end
endmodule
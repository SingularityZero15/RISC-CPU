`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/11 11:45:34
// Design Name: 
// Module Name: Double_edge_counter_1bit
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


module Double_edge_counter_1bit(
    input clk,
    input Reset,
    output reg Count
    );

    reg clk_counter1, clk_counter2;

    always @(*) begin
        if(clk)
            Count = clk_counter1;
        else
            Count = clk_counter2;
    end

    always @(posedge clk) begin
        clk_counter1 <= ~clk_counter2;
    end

    always @(negedge clk) begin
        clk_counter2 <= ~clk_counter1;
    end

    always @(posedge Reset) begin
        clk_counter1 <= 1'b0;
        clk_counter2 <= 1'b0;
    end
endmodule

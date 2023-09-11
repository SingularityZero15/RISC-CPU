`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/11 19:31:32
// Design Name: 
// Module Name: Control_unit
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


module Control_unit(
    input clk,
    input Rd_EN,
    output reg GR_Store_EN,
    output reg Instruction_decoder_Reset
    );

    reg Reset;
    wire Timer_Count;

    always @(posedge Rd_EN) begin
        GR_Store_EN <= 1'b0;
        Instruction_decoder_Reset <= 1'b0;
        Reset <= 1'b1;
    end

    always @(clk) begin
        if (Timer_Count && Reset) begin
            GR_Store_EN <= 1'b1;
            Instruction_decoder_Reset <= 1'b1;
            Reset <= 1'b0;
        end
    end

    Double_edge_counter_1bit Control_unit_Timer(
        .clk(clk),
        .Reset(Reset),
        .Count(Timer_Count)
    );

endmodule

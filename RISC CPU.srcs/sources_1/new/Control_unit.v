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
    input rst,
    input Rd_EN,
    output reg Fetch_EN,
    output reg Inc_EN,
    output reg GR_Store_EN,
    output reg Instruction_decoder_Reset
    );

    reg rstpos, rstneg;
    reg Reset1, Reset2;
    wire Timer_Count1;
    wire [2:0] Timer_Count2;

    always @(negedge rst) begin
        GR_Store_EN <= 1'b0;
        Instruction_decoder_Reset <= 1'b0;
        Fetch_EN <= 1'b0;
        Inc_EN <= 1'b0;
        Reset1 <= 1'b0;
        Reset2 <= 1'b0;
        rstpos <= 1'b1;
        rstneg <= 1'b1;
    end

    always @(posedge clk) begin
        if (~rstneg && rstpos) begin
            rstpos <= 1'b0;
            Reset2 <= 1'b1;
        end
    end

    always @(negedge clk) begin
        if (rstneg) begin
            rstneg <= 1'b0;
        end
    end

    always @(posedge Rd_EN) begin
        GR_Store_EN <= 1'b0;
        Instruction_decoder_Reset <= 1'b0;
        Reset1 <= 1'b1;
    end

    always @(clk) begin
        if (Timer_Count1 && Reset1) begin
            GR_Store_EN <= 1'b1;
            Instruction_decoder_Reset <= 1'b1;
            Reset1 <= 1'b0;
        end
        if (Timer_Count2 == 3'b001 && Reset2) begin
            Fetch_EN <= 1'b1;
        end
        if (Timer_Count2 == 3'b011 && Reset2) begin
            Fetch_EN <= 1'b0;
        end
        if (Timer_Count2 == 3'b100 && Reset2) begin
            Inc_EN <= 1'b1;
        end
        if (Timer_Count2 == 3'b110 && Reset2) begin
            Inc_EN <= 1'b0;
        end
    end

    Double_edge_counter_1bit Control_unit_Timer1(
        .clk(clk),
        .Reset(Reset1),
        .Count(Timer_Count1)
    );

    Double_edge_counter_3bit Control_unit_Timer2(
        .clk(clk),
        .Reset(Reset2),
        .Count(Timer_Count2)
    );

endmodule

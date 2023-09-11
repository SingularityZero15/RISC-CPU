`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/07 19:47:22
// Design Name: 
// Module Name: Program_Counter
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

module Program_Counter(
    input clk,
    input Addr_EN,
    input Inc_EN,
    input Set_EN,
    input [15:0] Address_Bus_In,
    output reg [15:0] Address_Bus_Out,
    output reg Read_EN
    );

    reg [15:0] Register;
    reg Reset1, Reset2;
    wire Timer_Count1;
    wire [2:0] Timer_Count2;
    
    initial begin
        Address_Bus_Out <= 16'hzzzz;
        Register <= 16'h0000;
        Read_EN <= 0;
    end
    
    always @(posedge Inc_EN ) begin
        Register <= Address_Bus_Out + 1;
    end

    always @(posedge Set_EN ) begin
        Address_Bus_Out <= 16'hzzzz;
        Reset1 <= 1'b1;
    end

    always @(clk) begin
        if (Timer_Count1 && Reset1) begin
            Register <= Address_Bus_In;
            Reset1 <= 1'b0;
        end

        if (Timer_Count2 == 3'b010 && Reset2) begin
            Read_EN <= 1;
        end
        
        if (Timer_Count2 == 3'b100 && Reset2) begin
            Read_EN <= 0;
            Address_Bus_Out <= 16'hzzzz;
            Reset2 <= 1'b0;
        end
    end

    always @(posedge Addr_EN) begin
        Address_Bus_Out <= Register;
        Reset2 <= 1'b1;
    end

    Double_edge_counter_1bit Program_Counter_Timer1(
        .clk(clk),
        .Reset(Reset1),
        .Count(Timer_Count1)
    );

    Double_edge_counter_3bit Program_Counter_Timer2(
        .clk(clk),
        .Reset(Reset2),
        .Count(Timer_Count2)
    );
endmodule

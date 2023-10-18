`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/13 15:42:38
// Design Name: 
// Module Name: tb_General_RAM
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

module tb_General_RAM(

    );

    reg clk;
    reg [31:0] Address;
    reg Write_Enable;
    reg [1:0] Operate_Mode;
    reg [31:0] In_Data;
    wire [31:0] Out_Data;

    always begin
        clk <= 1'b1;
        #(`PERIOD/2)
        clk <= 1'b0;
        #(`PERIOD/2);
    end

    initial begin
        // Address = 0;
        // Write_Enable = 1'b1;
        // Operate_Mode = 2'b00;
        // In_Data = 32'hFFFFFFFF;

        #50;

        Address = 0;
        Write_Enable = 1'b0;
        Operate_Mode = 2'b00;
        In_Data = 32'hFFFFFFFF;

        #50;

        Address = 0;
        Write_Enable = 1'b0;
        Operate_Mode = 2'b01;
        In_Data = 32'hFFFFFFFF;

        #50;

        Address = 0;
        Write_Enable = 1'b0;
        Operate_Mode = 2'b10;
        In_Data = 32'hFFFFFFFF;

        #50;

        Address = 0;
        Write_Enable = 1'b0;
        Operate_Mode = 2'b11;
        In_Data = 32'hFFFFFFFF;

        #50;

        Address = 0;
        Write_Enable = 1'b1;
        Operate_Mode = 2'b11;
        In_Data = 32'h66666666;

        #50;

        Address = 0;
        Write_Enable = 1'b0;
        Operate_Mode = 2'b00;
        In_Data = 32'hFFFFFFFF;

        #50;

        Address = 0;
        Write_Enable = 1'b0;
        Operate_Mode = 2'b01;
        In_Data = 32'hFFFFFFFF;

        #50;

        Address = 0;
        Write_Enable = 1'b0;
        Operate_Mode = 2'b10;
        In_Data = 32'hFFFFFFFF;

        #50;

        Address = 0;
        Write_Enable = 1'b0;
        Operate_Mode = 2'b11;
        In_Data = 32'hFFFFFFFF;
    end

    General_RAM inst(
        .clk(clk),
        .Address(Address),
        .Write_Enable(Write_Enable),
        .Operate_Mode(Operate_Mode),
        .In_Data(In_Data),
        .Out_Data(Out_Data)
    );

endmodule
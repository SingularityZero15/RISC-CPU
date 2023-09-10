`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/08 19:06:42
// Design Name: 
// Module Name: Risc_cpu_tb
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

module Risc_cpu_tb(

    );

    reg clk;
    reg Tb_Fetch_EN;
    reg Tb_Inc_EN;
    reg Tb_Set_EN;
    reg [15:0] Tb_Address_Bus;
    wire [15:0] Tb_Instruction;

    always begin
        clk <= 1'b0;
        #(`PERIOD/2)
        clk <= 1'b1;
        #(`PERIOD/2);
    end

    //Test fetch instruction for 4 times
    initial begin
        Tb_Fetch_EN <= 1'b0;
        # `PERIOD
        Tb_Fetch_EN <= 1'b1;
        # `PERIOD
        Tb_Fetch_EN <= 1'b0;
        # `PERIOD
        Tb_Fetch_EN <= 1'b1;
        # `PERIOD
        Tb_Fetch_EN <= 1'b0;
        # `PERIOD
        Tb_Fetch_EN <= 1'b1;
        # `PERIOD
        Tb_Fetch_EN <= 1'b0;
        # `PERIOD
        Tb_Fetch_EN <= 1'b1;
        # `PERIOD
        Tb_Fetch_EN <= 1'b0;
    end

    //Test increase pc for 3 times
    initial begin
        Tb_Inc_EN <= 1'b0;
        # (`PERIOD * 2.5)
        Tb_Inc_EN <= 1'b1;
        # `PERIOD
        Tb_Inc_EN <= 1'b0;
        # `PERIOD
        Tb_Inc_EN <= 1'b1;
        # `PERIOD
        Tb_Inc_EN <= 1'b0;
        # `PERIOD
        Tb_Inc_EN <= 1'b1;
        # `PERIOD
        Tb_Inc_EN <= 1'b0;
    end

    initial begin
        Tb_Set_EN <= 1'b0;
        Tb_Address_Bus <= 16'hzzzz;
        # (`PERIOD * 9)
        Tb_Address_Bus <= 16'h0005;
        Tb_Set_EN <= 1'b1;
        # (`PERIOD / 2)
        Tb_Set_EN <= 1'b0;
        # (`PERIOD / 2)
        Tb_Fetch_EN <= 1'b1;
        # `PERIOD
        Tb_Fetch_EN <= 1'b0;
    end

    Risc_cpu Risc_cpu_Inst(
        .Ex_clk(clk),
        .Ex_Fetch_EN(Tb_Fetch_EN),
        .Ex_Inc_EN(Tb_Inc_EN),
        .Ex_Instruction(Tb_Instruction),
        .Ex_Address_Bus(Tb_Address_Bus),
        .Ex_Set_EN(Tb_Set_EN)
    );

endmodule
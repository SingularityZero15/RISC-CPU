`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/18 22:18:55
// Design Name: 
// Module Name: tb_Firmware_ROM
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

module tb_Firmware_ROM(

    );

    reg CLK, Read_Enable;
    reg [31:0] Address;
    wire [31:0] Out_Data;

    always begin
        CLK <= 1'b1;
        #(`PERIOD/2)
        CLK <= 1'b0;
        #(`PERIOD/2);
    end

    initial begin
        Read_Enable = 1;
        Address = 32'h00000000;

        #50
        Address = 32'h00000004;

        #50
        Address = 32'h00000008;

        #50
        Address = 32'h0000000C;

        #50
        Address = 32'h00000010;

        #50
        Read_Enable = 0;

        #50
        Address = 32'h0000000C;

        #50
        Read_Enable = 1;
        Address = 32'h00000000;

        #50
        Address = 32'h0001000C;

    end

    Firmware_ROM inst(
        .CLK(CLK),
        .Read_Enable(Read_Enable),
        .Address(Address),
        .Out_Data(Out_Data)
    );
endmodule

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
    // input clk,
    input Addr_EN,
    input Inc_EN,
    output reg [15:0] Address_Bus,
    output reg Read_EN
    );

    reg [15:0] Register;
    
    initial begin
        Address_Bus <= 16'hzzzz;
        Register <= 16'h0000;
        Read_EN <= 0;
    end
    
    always @(posedge Inc_EN ) begin
        Register <= Register + 1;
    end

    always @(posedge Addr_EN) begin
        Address_Bus <= Register;
        # `PERIOD
        Read_EN <= 1;
        # `PERIOD
        Read_EN <= 0;
        Address_Bus <= 16'hzzzz;
    end
endmodule

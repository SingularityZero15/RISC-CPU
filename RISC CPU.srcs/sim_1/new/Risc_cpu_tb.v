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
    reg rst;

    always begin
        clk <= 1'b0;
        #(`PERIOD/2)
        clk <= 1'b1;
        #(`PERIOD/2);
    end

    initial begin
        rst <= 1'b1;
        #(`PERIOD/2);
        rst <= 1'b0;
    end

    Risc_cpu Risc_cpu_Inst(
        .Ex_clk(clk),
        .Ex_rst(rst)
    );

endmodule

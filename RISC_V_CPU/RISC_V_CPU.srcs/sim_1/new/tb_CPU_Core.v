`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/07 16:28:31
// Design Name: 
// Module Name: tb_CPU_Core
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

module tb_CPU_Core(

    );

    reg rst;
    reg clk;

    initial begin
        clk = 1;
        rst = 1;
        #30
        rst = 0;
    end

    always begin
        #(`PERIOD / 2)
        clk = 0;
        #(`PERIOD / 2)
        clk = 1;
    end

    CPU_Core CPU_Core_inst(
        .clk(clk),
        .rst(rst)
    );
endmodule

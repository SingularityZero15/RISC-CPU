`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/21 23:09:06
// Design Name: 
// Module Name: tb_Clock_Doubler
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

module tb_Clock_Doubler(

    );

    reg clk;
    reg rst;
    wire clk_200m;

    always begin
        clk <= 1'b1;
        #(`PERIOD/2)
        clk <= 1'b0;
        #(`PERIOD/2);
    end

    initial begin
        rst = 1;
        #500
        rst = 0;
    end

    Clock_Doubler inst(
        .clk_100m(clk),
        .rst(rst),
        .clk_200m(clk_200m)
    );

endmodule

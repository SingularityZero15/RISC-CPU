`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/21 23:06:55
// Design Name: 
// Module Name: Clock_Doubler
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


module Clock_Doubler(
    input clk_100m,
    output clk_200m,
    output clk_100m_d
    );

    assign clk_200m = (clk_100m ^ clk_100m_d)/* & (~rst)*/;

    clk_wiz_0 inst(
    .clk_out1(clk_100m_d),
    .clk_in1(clk_100m)
    );
endmodule

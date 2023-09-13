`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/12 19:58:28
// Design Name: 
// Module Name: Comparer_tb
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


module Comparer_tb(

    );

    reg [7:0] op1, op2;
    wire EQ, LT;

    always #1 op1 = {$random} % 255;
    always #1 op2 = {$random} % 255;

    initial begin
        op1 <= 8'b0;
        op2 <= 8'b0;
    end

    Comparer_16bit test(
        .op1(op1),
        .op2(op2),
        .EQ(EQ),
        .LT(LT)
    );

endmodule

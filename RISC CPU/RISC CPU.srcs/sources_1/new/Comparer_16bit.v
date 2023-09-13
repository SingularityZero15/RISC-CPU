`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/12 19:40:20
// Design Name: 
// Module Name: Comparer_16bit
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


module Comparer_16bit(
    input [7:0] op1,
    input [7:0] op2,
    output reg EQ,
    output reg LT
    );

    always @(op1 or op2) begin
        if (op1[7] ^ op2[7]) begin
            EQ <= 1'b0;
            LT <= op2[7];
        end else if (op1[6] ^ op2[6]) begin
            EQ <= 1'b0;
            LT <= op2[6];
        end else if (op1[5] ^ op2[5]) begin
            EQ <= 1'b0;
            LT <= op2[5];
        end else if (op1[4] ^ op2[4]) begin
            EQ <= 1'b0;
            LT <= op2[4];
        end else if (op1[3] ^ op2[3]) begin
            EQ <= 1'b0;
            LT <= op2[3];
        end else if (op1[2] ^ op2[2]) begin
            EQ <= 1'b0;
            LT <= op2[2];
        end else if (op1[1] ^ op2[1]) begin
            EQ <= 1'b0;
            LT <= op2[1];
        end else if (op1[0] ^ op2[0]) begin
            EQ <= 1'b0;
            LT <= op2[0];
        end else begin
            EQ <= 1'b1;
            LT <= 1'b0;
        end
    end

endmodule

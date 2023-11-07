`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/07 21:17:13
// Design Name: 
// Module Name: Forwarding_Unit
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


module Forwarding_Unit(
    input [4:0] EX_RS1,
    input [4:0] EX_RS2,
    input [4:0] EX_MEM_RD,
    input [4:0] MEM_WB_RD,
    input EX_MEM_RegWrite,
    input MEM_WB_RegWrite,
    output reg [1:0] ForwardA,
    output reg [1:0] ForwardB
    );

    always @(*) begin
        if (EX_RS1 == EX_MEM_RD && EX_MEM_RegWrite) begin
            ForwardA = 2'b10;
        end else if (EX_RS1 == MEM_WB_RD && MEM_WB_RegWrite) begin
            ForwardA = 2'b01;
        end else begin
            ForwardA = 2'b00;
        end
        
        if (EX_RS2 == EX_MEM_RD && EX_MEM_RegWrite) begin
            ForwardB = 2'b10;
        end else if (EX_RS2 == MEM_WB_RD && MEM_WB_RegWrite) begin
            ForwardB = 2'b01;
        end else begin
            ForwardB = 2'b00;
        end
    end

endmodule

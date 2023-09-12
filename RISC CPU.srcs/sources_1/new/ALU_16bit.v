`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/06 15:52:22
// Design Name: 
// Module Name: ALU_16bit
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

`include "ALU_16bit_func.vh"

module ALU_16bit(
    input rst,
    input [3:0] func,
    input [15:0] op1,
    input [15:0] op2,
    input extended,
    input carry_in,
    output reg [15:0] result,
    output reg carry_out
    );

    always @(negedge rst) begin
        result <= 16'h0000;
        carry_out <= 1'b0;
    end

    always @(*) begin
        case (func)
            `FUNC_ADD: begin
                if (extended) begin
                    {carry_out, result} <= op1 + op2 + carry_in;
                end else begin
                    {carry_out, result} <= op1 + op2;
                end
            end
            `FUNC_AND: begin
                result <= op1 & op2;
                carry_out <= carry_in;
            end
            `FUNC_OR: begin
                result <= op1 | op2;
                carry_out <= carry_in;
            end
            `FUNC_XOR: begin
                result <= op1 ^ op2;
                carry_out <= carry_in;
            end
            `FUNC_SUB:  begin
                if (extended) begin
                    {carry_out, result} <= op1 - op2 - carry_in;
                end else begin
                    {carry_out, result} <= op1 - op2;
                end
            end
            `FUNC_SLL: begin
                result <= op1 << op2[3:0];
                carry_out <= carry_in;
            end
            `FUNC_SRL: begin
                result <= op1 >> op2[3:0];
                carry_out <= carry_in;
            end
            `FUNC_SRA: begin
                result <= ($signed(op1)) >>> op2[3:0];
                carry_out <= carry_in;
            end
            `FUNC_EQ: begin
                if (op1 == op2) begin
                    result <= 16'h0001;
                    carry_out <= carry_in;
                end else begin
                    result <= 16'h0000;
                    carry_out <= carry_in;
                end
            end
            `FUNC_NE: begin
                if (op1 == op2) begin
                    result <= 16'h0000;
                    carry_out <= carry_in;
                end else begin
                    result <= 16'h0001;
                    carry_out <= carry_in;
                end
            end
            `FUNC_LT: begin
                if (($signed(op1)) < ($signed(op2))) begin
                    result <= 16'h0001;
                    carry_out <= carry_in;
                end else begin
                    result <= 16'h0000;
                    carry_out <= carry_in;
                end
            end
            `FUNC_GE: begin
                if (($signed(op1)) < ($signed(op2))) begin
                    result <= 16'h0000;
                    carry_out <= carry_in;
                end else begin
                    result <= 16'h0001;
                    carry_out <= carry_in;
                end
            end
            `FUNC_LTU: begin
                if (op1 < op2) begin
                    result <= 16'h0001;
                    carry_out <= carry_in;
                end else begin
                    result <= 16'h0000;
                    carry_out <= carry_in;
                end
            end
            `FUNC_GEU: begin
                if (op1 < op2) begin
                    result <= 16'h0000;
                    carry_out <= carry_in;
                end else begin
                    result <= 16'h0001;
                    carry_out <= carry_in;
                end
            end
            default: begin
                result <= op1;
                carry_out <= carry_in;
            end
        endcase
    end
endmodule

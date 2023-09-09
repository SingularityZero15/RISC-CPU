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
    //input clk,
    input [3:0] func,
    input [15:0] op1,
    input [15:0] op2,
    input extended,
    input carry_in,
    output reg [15:0] result,
    output reg carry_out
    );

    /*
    reg [15:0]result_add;
    reg [15:0]result_and;
    reg [15:0]result_or;
    reg [15:0]result_xor;
    reg [15:0]result_sll;
    reg [15:0]result_srl;
    reg [15:0]result_sra;
    reg carry;
    */

    //reg [16:0] midresult;

    always @(*) begin
        /*
        {carry, result_add} = op1 + op2;
        result_and = op1 && op2;
        result_or = op1 || op2;
        result_xor = op1 ^ op2;
        result_sll = op1 << op2[4:0];
        result_srl = op1 >> op2[4:0];
        result_sra = op1 >>> op2[4:0];
        */

        case (func)
            `FUNC_ADD: begin
                if (extended) begin
                    {carry_out, result} <= op1 + op2 + carry_in;
                end else begin
                    {carry_out, result} <= op1 + op2;
                end
                
                /*
                midresult = op1 + op2;
                if (extended) begin
                    {carry_out, result} <= midresult + carry_in;
                end else begin
                    {carry_out, result} <= midresult;
                end
                */
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

                /*
                midresult = op1 - op2;
                if (extended) begin
                    {carry_out, result} <= midresult - carry_in;
                end else begin
                    {carry_out, result} <= midresult;
                end
                */
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
                end
            end
            `FUNC_NE: begin
                if (op1 == op2) begin
                    result <= 16'h0000;
                    carry_out <= carry_in;
                end else begin
                    result <= 16'h0001;
                end
            end
            `FUNC_LT: begin
                if (($signed(op1)) < ($signed(op2))) begin
                    result <= 16'h0001;
                    carry_out <= carry_in;
                end else begin
                    result <= 16'h0000;
                end
            end
            `FUNC_GE: begin
                if (($signed(op1)) < ($signed(op2))) begin
                    result <= 16'h0000;
                    carry_out <= carry_in;
                end else begin
                    result <= 16'h0001;
                end
            end
            `FUNC_LTU: begin
                if (op1 < op2) begin
                    result <= 16'h0001;
                    carry_out <= carry_in;
                end else begin
                    result <= 16'h0000;
                end
            end
            `FUNC_GEU: begin
                if (op1 < op2) begin
                    result <= 16'h0000;
                    carry_out <= carry_in;
                end else begin
                    result <= 16'h0001;
                end
            end
            default: begin
                result <= op1;
                carry_out <= carry_in;
            end
        endcase
    end
endmodule

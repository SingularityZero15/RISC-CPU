`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/12 19:02:47
// Design Name: 
// Module Name: Arithmetic_Logic_Unit
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


module Arithmetic_Logic_Unit(
    input result_as_address_Enable,
    input result_Enable,
    input [2:0] funct3,
    input funct7,
    input [31:0] operand1,
    input [31:0] operand2,
    output [31:0] result,
    output [31:0] result_as_address,
    output reg result_logic
    );

    reg [31:0] __result;
    assign result = result_Enable ? __result : 32'bz;
    assign result_as_address = result_as_address_Enable ? __result : 32'bz;

    always @(*) begin
        case (funct3)
            3'b000: begin
                if (funct7) begin
                    __result = operand1 - operand2;
                end else begin
                    __result = operand1 + operand2;
                end
                if (operand1 == operand2) begin
                    result_logic = 1'b1;
                end else begin
                    result_logic = 1'b0;
                end
            end
            3'b001: begin
                __result = operand1 << operand2[4:0];
                if (operand1 != operand2) begin
                    result_logic = 1'b1;
                end else begin
                    result_logic = 1'b0;
                end
            end
            3'b010: begin
                result_logic = 0;
                if ($signed(operand1) < $signed(operand2)) begin
                    __result = 32'b1;
                end else begin
                    __result = 32'b0;
                end
            end
            3'b011: begin
                result_logic = 0;
                if (operand1 < operand2) begin
                    __result = 32'b1;
                end else begin
                    __result = 32'b0;
                end
            end
            3'b100: begin
                __result = operand1 ^ operand2;
                if ($signed(operand1) < $signed(operand2)) begin
                    result_logic = 1'b1;
                end else begin
                    result_logic = 1'b0;
                end
            end
            3'b101: begin
                if (funct7) begin
                    __result = $signed(operand1) >>> operand2[4:0];
                end else begin
                    __result = operand1 >> operand2[4:0];
                end
                if ($signed(operand1) >= $signed(operand2)) begin
                    result_logic = 1'b1;
                end else begin
                    result_logic = 1'b0;
                end
            end
            3'b110: begin
                __result = operand1 | operand2;
                if (operand1 < operand2) begin
                    result_logic = 1'b1;
                end else begin
                    result_logic = 1'b0;
                end
            end
            3'b111: begin
                __result = operand1 & operand2;
                if (operand1 >= operand2) begin
                    result_logic = 1'b1;
                end else begin
                    result_logic = 1'b0;
                end
            end
        endcase
    end
endmodule

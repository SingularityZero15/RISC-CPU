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
    input [2:0] funct3,
    input funct7,
    input [31:0] operand1,
    input [31:0] operand2,
    output reg [31:0] result,
    output reg Zero
    );

    always @(*) begin
        case (funct3)
            3'b000: begin
                if (funct7) begin
                    result = operand1 - operand2;
                end else begin
                    result = operand1 + operand2;
                end
                if (operand1 == operand2) begin
                    Zero = 1'b1;
                end else begin
                    Zero = 1'b0;
                end
            end
            3'b001: begin
                result = operand1 << operand2[4:0];
                if (operand1 != operand2) begin
                    Zero = 1'b1;
                end else begin
                    Zero = 1'b0;
                end
            end
            3'b010: begin
                Zero = 0;
                if ($signed(operand1) < $signed(operand2)) begin
                    result = 32'b1;
                end else begin
                    result = 32'b0;
                end
            end
            3'b011: begin
                Zero = 0;
                if (operand1 < operand2) begin
                    result = 32'b1;
                end else begin
                    result = 32'b0;
                end
            end
            3'b100: begin
                result = operand1 ^ operand2;
                if ($signed(operand1) < $signed(operand2)) begin
                    Zero = 1'b1;
                end else begin
                    Zero = 1'b0;
                end
            end
            3'b101: begin
                if (funct7) begin
                    result = $signed(operand1) >>> operand2[4:0];
                end else begin
                    result = operand1 >> operand2[4:0];
                end
                if ($signed(operand1) >= $signed(operand2)) begin
                    Zero = 1'b1;
                end else begin
                    Zero = 1'b0;
                end
            end
            3'b110: begin
                result = operand1 | operand2;
                if (operand1 < operand2) begin
                    Zero = 1'b1;
                end else begin
                    Zero = 1'b0;
                end
            end
            3'b111: begin
                result = operand1 & operand2;
                if (operand1 >= operand2) begin
                    Zero = 1'b1;
                end else begin
                    Zero = 1'b0;
                end
            end
        endcase
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/05 20:37:17
// Design Name: 
// Module Name: Immediate_Number_Generater
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


module Immediate_Number_Generater(
    input [31:0] Instruction,
    output reg [31:0] Immediate_Number
    );

    always @(*) begin
        case (Instruction[6:0])
            7'b0010011: begin
                Immediate_Number[11:0] = Instruction[31:20];
                Immediate_Number[31:12] = {20{Instruction[31]}};
            end 
            default: begin
                Immediate_Number = 0;
            end
        endcase
    end

endmodule

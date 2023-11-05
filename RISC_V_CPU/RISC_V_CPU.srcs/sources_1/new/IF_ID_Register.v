`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/05 19:40:16
// Design Name: 
// Module Name: IF_ID_Register
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


module IF_ID_Register(
    input clk,
    input [31:0] PC_Address_In,
    output reg [31:0] PC_Address_Out,
    input [31:0] Instruction_In,
    output reg [31:0] Instruction_Out
    );

    always @(posedge clk) begin
        PC_Address_Out = PC_Address_In;
        Instruction_Out = Instruction_In;
    end

endmodule

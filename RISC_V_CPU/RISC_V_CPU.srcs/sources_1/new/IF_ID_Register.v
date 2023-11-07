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
    input rst,

    input [31:0] PC_Address_In,
    input [31:0] Instruction_In,
    
    output reg [31:0] PC_Address_Out,
    output reg [31:0] Instruction_Out
    );

    always @(posedge clk) begin
        if (rst) begin
            PC_Address_Out = 0;
            Instruction_Out = 0;
        end else begin
            PC_Address_Out = PC_Address_In;
            Instruction_Out = Instruction_In;
        end
    end

endmodule

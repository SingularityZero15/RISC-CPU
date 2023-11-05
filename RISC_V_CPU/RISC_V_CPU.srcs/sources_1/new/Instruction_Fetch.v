`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/05 19:20:57
// Design Name: 
// Module Name: Instruction_Fetch
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


module Instruction_Fetch(
    input clk,
    input [31:0] Instruction_Address,
    input PCSrc,
    output [31:0] PC_Address,
    output [31:0] Instruction
    );

    reg [31:0] PC;
    assign PC_Address = PC;

    always @(posedge clk) begin
        if(PCSrc) begin
            PC = Instruction_Address;
        end else begin
            PC = PC + 4;
        end
    end

    rom_32x256 Instruction_Memory (
        .clka(clk),    // input wire clka
        .addra(PC[9:2]),  // input wire [7 : 0] addra
        .douta(Instruction)  // output wire [31 : 0] douta
    );

endmodule
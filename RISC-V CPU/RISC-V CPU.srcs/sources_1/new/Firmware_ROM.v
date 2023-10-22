`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/18 20:32:08
// Design Name: 
// Module Name: Firmware_ROM
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


module Firmware_ROM(
    input CLK,
    input Read_Enable,
    input [31:0] Address,
    output reg [31:0] Out_Data
    );

    wire [31:0] __Out_Data;

    always @(*) begin
        if (Read_Enable && Address[31:16] == 16'h0000) begin
            Out_Data = __Out_Data;
        end else begin
            Out_Data = 32'bz;
        end
    end

    ROM_32x256 inst (
    .clka(CLK),    // input wire clka
    .addra(Address[9:2]),  // input wire [7 : 0] addra
    .douta(__Out_Data)  // output wire [31 : 0] douta
);

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/08 11:08:05
// Design Name: 
// Module Name: Internal_rom
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


module Internal_rom(
    input clk,
    input rst,
    input Enable,
    input [15:0] Address_Bus,
    output [15:0] Data_bus
    );

    wire [15:0] Data_out;
    reg [15:0] Data_reg;
    assign Data_bus = Enable ? Data_reg : 16'bZ;

    always @(negedge rst) begin
        Data_reg <= 16'hzzzz;
    end

    always @(negedge clk) begin
        if (~Address_Bus[15]) begin
            Data_reg <= Data_out;
        end        
    end

    rom_256x16b rom_256x16b_Inst(
        .clka(clk),
        .addra(Address_Bus[7:0]),
        .douta(Data_out)
    );

endmodule

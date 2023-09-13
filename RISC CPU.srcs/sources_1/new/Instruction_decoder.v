`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/10 13:07:01
// Design Name: 
// Module Name: Instruction_decoder
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


module Instruction_decoder(
    input rst,
    input [15:0] Instruction,
    input Reset,
    output reg [1:0] Rd,
    output reg [1:0] Rs1,
    output reg [1:0] Rs2,
    output reg [3:0] ALU_Opcode,
    output reg Rd_EN,
    output reg Rs1_EN,
    output reg Rs2_EN,
    output reg Immediate_num_EN,
    output reg ALU_Extended,
    output reg [8:0] Immediate_num
    );

    always @(negedge rst) begin
        Rd <= 2'b00;
        Rs1 <= 2'b00;
        Rs2 <= 2'b00;
        ALU_Opcode<= 4'b0000;
        Rd_EN <= 1'b0;
        Rs1_EN <= 1'b0;
        Rs2_EN <= 1'b0;
        Immediate_num_EN <= 1'b0;
        ALU_Extended <= 1'b0;
        Immediate_num <= 9'b000000000;
    end

    always @(*) begin
        if (~Instruction[0]) begin
            ALU_Opcode <= Instruction[3:0];

            Rd <= Instruction[6:5];
            Rd_EN <= 1'b1;

            Rs1 <= Instruction[8:7];
            Rs1_EN <= 1'b1;

            Immediate_num_EN <= Instruction[4];
            if(Instruction[4]) begin
                Rs2 <= Instruction[10:9];
                Rs2_EN <= 1'b1;

                Immediate_num <= 9'b000000000;

                ALU_Extended <= Instruction[11]; 
            end else begin
                Rs2 <= 2'b00;
                Immediate_num <= {2'b00, Instruction[15:9]};
            end
        end
    end

    always @(posedge Reset) begin
        Rd_EN <= 1'b0;
        Rs1_EN <= 1'b0;
        Rs2_EN <= 1'b0;
    end

endmodule

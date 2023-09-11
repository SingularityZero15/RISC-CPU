`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/10 20:48:31
// Design Name: 
// Module Name: Runtime_register
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


module Runtime_register(
    input A_EN,
    input B_EN,
    input I_EN,
    input Flag_EN,
    input Flag_in,
    output Flag_out,
    input [1:0] Address_out_a,
    output reg [15:0] Data_out_a,
    input [1:0] Address_out_b,
    output reg [15:0] Data_out_b,
    input [1:0] Address_in,
    input [15:0] Data_in
    );

    reg [15:0] General_register [3:0];
    reg Flag_register; // 0: carry flag

    assign Flag_out = Flag_register;

    initial begin
        General_register[0] <= 16'hzzzz;
        General_register[1] <= 16'hzzzz;
        General_register[2] <= 16'hzzzz;
        General_register[3] <= 16'hzzzz;
        Data_out_a <= 16'hzzzz;
        Data_out_b <= 16'hzzzz;
    end

    always @(posedge A_EN) begin
        Data_out_a <= General_register[Address_out_a];
    end

    always @(posedge B_EN) begin
        Data_out_b <= General_register[Address_out_b];
    end

    always @(posedge I_EN) begin
        General_register[Address_in] <= Data_in;
    end
    
    always @(posedge Flag_EN) begin
        Flag_register <= Flag_in;
    end
endmodule

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
    input [1:0] Address_out_a,
    output reg [15:0] Data_out_a,
    input [1:0] Address_out_b,
    output reg [15:0] Data_out_b,
    input [1:0] Address_in,
    input [15:0] Data_in
    );

    reg [15:0] General_register [3:0];
endmodule

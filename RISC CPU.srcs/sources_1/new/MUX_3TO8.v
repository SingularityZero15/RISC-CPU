`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/12 20:19:04
// Design Name: 
// Module Name: MUX_3TO8
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


module MUX_3TO8(
    input [2:0] sig,
    output reg [7:0] bitselect
    );

    always @(sig) begin
        bitselect[0] <= ~sig[2] & ~sig[1] & ~sig[0];
        bitselect[1] <= ~sig[2] & ~sig[1] & sig[0];
        bitselect[2] <= ~sig[2] & sig[1] & ~sig[0];
        bitselect[3] <= ~sig[2] & sig[1] & sig[0];
        bitselect[4] <= sig[2] & ~sig[1] & ~sig[0];
        bitselect[5] <= sig[2] & ~sig[1] & sig[0];
        bitselect[6] <= sig[2] & sig[1] & ~sig[0];
        bitselect[7] <= sig[2] & sig[1] & sig[0];
    end

endmodule

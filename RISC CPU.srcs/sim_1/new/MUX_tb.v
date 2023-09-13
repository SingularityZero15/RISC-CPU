`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/12 20:24:32
// Design Name: 
// Module Name: MUX_tb
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


module MUX_tb(

    );

    reg [2:0] sig;
    wire [7:0] bitselect;

    always #1 sig = {$random} % 8;

    initial begin
        sig <= 3'b0;
    end

    MUX_3TO8 test(
        .sig(sig),
        .bitselect(bitselect)
    );

endmodule

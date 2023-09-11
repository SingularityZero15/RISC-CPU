`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/11 10:56:46
// Design Name: 
// Module Name: Counter_tb
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

`define PERIOD 10

module Counter_tb(

    );

    reg clk;
    reg Reset;
    wire [1:0] Count;

    always begin
        clk <= 1'b0;
        #(`PERIOD/2)
        clk <= 1'b1;
        #(`PERIOD/2);
    end

    initial begin
        Reset <= 1'b0;
        #(`PERIOD/2);
        Reset <= 1'b1;
    end

    Double_edge_counter_2bit Inst(
        .clk(clk),
        .Reset(Reset),
        .Count(Count)
    );

endmodule

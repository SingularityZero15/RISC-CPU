`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/23 23:13:31
// Design Name: 
// Module Name: tb_MPU
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

module tb_MPU(

    );

    reg Clock;
    reg Reset;

    always begin
        Clock <= 1'b1;
        #(`PERIOD/2)
        Clock <= 1'b0;
        #(`PERIOD/2);
    end

    initial begin
        Reset = 1;
        #500
        Reset = 0;
    end

    Micro_Processor_Unit inst(
        .Clock(Clock),
        .Reset(Reset)
    );

endmodule

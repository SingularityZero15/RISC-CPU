`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/19 18:12:40
// Design Name: 
// Module Name: Program_Counter_tb
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

module Program_Counter_tb(

    );

    reg clk, rst, Addr, Inc, Set;
    reg [15:0] Address_Bus_In;
    wire [15:0] Address_Bus_Out;

    always begin
        clk <= 1'b0;
        #(`PERIOD/2)
        clk <= 1'b1;
        #(`PERIOD/2);
    end

    initial begin
        rst = 1'b0;
        Addr = 1'b0;
        Inc = 1'b0;
        Set = 1'b0;
        #(`PERIOD/2)
        rst = 1'b1;
        #(`PERIOD/2)
        rst = 1'b0;
        Addr = 1'b0;
        #`PERIOD
        Addr = 1'b1;
        #`PERIOD
        Addr = 1'b0;
        #`PERIOD
        Inc = 1'b1;
        #`PERIOD
        Inc = 1'b0;
        #`PERIOD
        Addr = 1'b1;
        #`PERIOD
        Addr = 1'b0;
        #`PERIOD
        Inc = 1'b1;
        #`PERIOD
        Inc = 1'b0;
        #`PERIOD
        Addr = 1'b1;
        #`PERIOD
        Addr = 1'b0;
        Address_Bus_In = 16'hC567;
        #`PERIOD
        Set = 1'b1;
        #`PERIOD
        Set = 1'b0;
        #`PERIOD
        Addr = 1'b1;
        #`PERIOD
        Addr = 1'b0;
    end

    Program_Counter inst(
        .clk(clk),
        .rst(rst),
        .Addr_EN(Addr),
        .Inc_EN(Inc),
        .Set_EN(Set),
        .Address_Bus_In(Address_Bus_In),
        .Address_Bus_Out(Address_Bus_Out)
    );
endmodule

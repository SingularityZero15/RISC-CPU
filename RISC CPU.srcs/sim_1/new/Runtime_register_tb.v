`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/11 08:42:37
// Design Name: 
// Module Name: Runtime_register_tb
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

module Runtime_register_tb(

    );

    reg A_EN, B_EN, I_EN;
    reg [1:0] Address_out_a, Address_out_b, Address_in;
    reg [15:0] Data_in;
    wire [15:0] Data_out_a, Data_out_b;

    Runtime_register Runtime_register_test(
        .A_EN(A_EN),
        .B_EN(B_EN),
        .I_EN(I_EN),
        .Address_out_a(Address_out_a),
        .Address_out_b(Address_out_b),
        .Address_in(Address_in),
        .Data_out_a(Data_out_a),
        .Data_out_b(Data_out_b),
        .Data_in(Data_in)
    );

    initial begin
        I_EN <= 1'b0;
        A_EN <= 1'b0;
        B_EN <= 1'b0;
        Address_out_a <= 2'bzz;
        Address_out_b <= 2'bzz;
        Address_in <= 2'b00;
        Data_in <=16'hA09D;
        # (`PERIOD / 2)
        I_EN <= 1'b1;
        # (`PERIOD / 2)
        I_EN <= 1'b0;
        # (`PERIOD / 2)
        Address_in <= 2'b01;
        Data_in <=16'hC567;
        # (`PERIOD / 2)
        I_EN <= 1'b1;
        # (`PERIOD / 2)
        I_EN <= 1'b0;
        # (`PERIOD / 2)
        Address_in <= 2'b10;
        Data_in <=16'hAB19;
        # (`PERIOD / 2)
        I_EN <= 1'b1;
        # (`PERIOD / 2)
        I_EN <= 1'b0;
        # (`PERIOD / 2)
        Address_in <= 2'b11;
        Data_in <=16'hF09A;
        # (`PERIOD / 2)
        I_EN <= 1'b1;
        # (`PERIOD / 2)
        I_EN <= 1'b0;
        # (`PERIOD / 2)
        Address_out_a <= 2'b00;
        Address_out_b <= 2'b01;
        # (`PERIOD / 2)
        A_EN <= 1'b1;
        B_EN <= 1'b1;
        # (`PERIOD / 2)
        A_EN <= 1'b0;
        B_EN <= 1'b0;
        # (`PERIOD / 2)
        Address_out_a <= 2'b10;
        Address_out_b <= 2'b11;
        # (`PERIOD / 2)
        A_EN <= 1'b1;
        B_EN <= 1'b1;
        # (`PERIOD / 2)
        A_EN <= 1'b0;
        B_EN <= 1'b0;
    end

endmodule

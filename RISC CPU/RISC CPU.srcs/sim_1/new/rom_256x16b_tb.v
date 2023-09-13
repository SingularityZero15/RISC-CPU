`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/08 02:03:31
// Design Name: 
// Module Name: rom_256x16b_tb
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

module rom_256x16b_tb(

    );

    reg clk;
    reg [15:0] addra;
    wire [15:0] douta;
    reg ena;

    always begin
        clk <= 1'b0;
        #(`PERIOD/2)
        clk <= 1'b1;
        #(`PERIOD/2);
    end

    initial begin
        ena <= 1'b0;
        addra <= 8'h01;
        #10
        ena <= 1'b1;
        #10
        ena <= 1'b0;
    end

    // always @(negedge clk ) begin
    //     if (addra == 8'h1F) begin
    //         addra <= 8'h00;
    //     end else begin
    //         addra <= addra + 1;
    //     end

    //     # `PERIOD;
    // end

    Internal_rom Internal_rom_Inst (
        .clk(clk),
        .Address_Bus(addra),
        .Enable(ena),
        .Data_bus(douta)
        );

endmodule

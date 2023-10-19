`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/19 18:40:56
// Design Name: 
// Module Name: Return_Address_Stack
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


module Return_Address_Stack(
    input CLK,
    input pop_Enable,
    input push_Enable,
    input [31:0] In_Address,
    output reg [31:0] Out_Address
    );

    reg [31:0] Address_Stack[127:0];
    reg [6:0] Current_Pos;

    always @(posedge CLK) begin
        if (pop_Enable) begin
            Out_Address = Address_Stack[Current_Pos - 1];
        end else if (push_Enable) begin
            Address_Stack[Current_Pos] = In_Address;
        end
    end

    always @(negedge CLK) begin
        if (pop_Enable) begin
            Current_Pos = Current_Pos - 1;
        end else if (push_Enable) begin
            Current_Pos = Current_Pos + 1;
        end
    end

endmodule

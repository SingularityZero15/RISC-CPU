`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/15 19:16:41
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(
    input rst,
    input Instruction_Address_to_Bus_Enable,
    input Next_Instruction,
    input Jump_Enable,
    input [31:0] Offset_Address,
    output [31:0] Instruction_Address_to_Bus,
    output [31:0] Instruction_Address
    );

    reg [31:0] __Instruction_Address;
    assign Instruction_Address_to_Bus = Instruction_Address_to_Bus_Enable ? __Instruction_Address : 32'bz;
    assign Instruction_Address = __Instruction_Address;
    
    always @(posedge Next_Instruction or negedge rst) begin
        if(rst) begin
            __Instruction_Address <= 0;
        end
        case (Jump_Enable)
            1'b0: begin
                __Instruction_Address = __Instruction_Address + 4'd4;
            end 
            1'b1: begin
                __Instruction_Address = __Instruction_Address + Offset_Address;
            end 
        endcase
    end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/12 19:55:48
// Design Name: 
// Module Name: tb_Arithmetic_Logic_Unit
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


module tb_Arithmetic_Logic_Unit(

    );

    reg [2:0] funct3;
    reg funct7;
    reg [31:0] operand1;
    reg [31:0] operand2;
    wire [31:0] result;
    wire Zero;

    initial begin
        //test add EQ
        funct3 = 3'b000;
        funct7 = 0;
        operand1 = 32'hFFFF0000;
        operand2 = 32'h55555508;
        #5;
        operand1 = operand2;

        #5;
        
        //test sub EQ
        funct3 = 3'b000;
        funct7 = 1;
        operand1 = 32'hFFFF0000;
        operand2 = 32'h55555508;
        #5;
        operand1 = operand2;

        #5;

        //test left shift NEQ
        funct3 = 3'b001;
        funct7 = 0;
        operand1 = 32'hFFFF0000;
        operand2 = 32'h55555508;
        #5;
        operand1 = operand2;

        #5;

        //test set less than (signed)
        funct3 = 3'b010;
        funct7 = 0;
        operand1 = 32'hFFFF0000;
        operand2 = 32'h55555508;

        #5;

        //test set less than (unsigned)
        funct3 = 3'b011;
        funct7 = 0;

        #5;

        //test XOR LT
        funct3 = 3'b100;
        funct7 = 0;

        #5;

        //test right shift logical GE
        funct3 = 3'b101;
        funct7 = 0;

        #5;

        //test right shift arithmetic GE
        funct3 = 3'b101;
        funct7 = 1;

        #5;

        //test OR LTU
        funct3 = 3'b110;
        funct7 = 0;

        #5;

        //test AND GEU
        funct3 = 3'b111;
        funct7 = 0;
    end

    Arithmetic_Logic_Unit inst(
        .funct3(funct3),
        .funct7(funct7),
        .operand1(operand1),
        .operand2(operand2),
        .result(result),
        .Zero(Zero)
    );

endmodule

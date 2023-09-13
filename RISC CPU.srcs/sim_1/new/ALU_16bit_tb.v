`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/07 11:35:50
// Design Name: 
// Module Name: ALU_16bit_tb
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

`include "ALU_16bit_func.vh"

module ALU_16bit_tb(

    );

    reg [3:0] infunc;
    reg [15:0] inop1, inop2;
    reg incf;
    reg inextended;
    wire [15:0] outresult;
    wire outcf;

    initial begin

        //Test 8a29+c65b
        inop1 = 16'h8a29;
        inop2 = 16'hc65b;

        incf = 1'b0;
        inextended = 1'b0;

        infunc = `FUNC_ADD;
        
        //Test 8a29+c65b with carry flag, but no extended
        #5 incf = 1'b1;
        
        //Test 8a29+c65b with carry flag with extended
        #5 inextended = 1'b1;

        //Test 8a29-c65b
        #5 
        infunc = `FUNC_SUB;
        incf = 1'b0;
        inextended = 1'b0;

        //Test 8a29-c65b with borrow flag, but no extended
        #5 incf = 1'b1;

        //Test 8a29-c65b with borrow flag with extended
        #5 inextended = 1'b1;

        //Test 8a29 & c65b
        #5 infunc = `FUNC_AND;

        //Test 8a29 | c65b
        #5 infunc = `FUNC_OR;
        
        //Test 8a29 ^ c65b
        #5 infunc = `FUNC_XOR;
        
        //Test 8a29 << 4(FFF4)
        #5 
        inop2 = 16'hFFF4;
        infunc = `FUNC_SLL;

        //Test 8a29 >> 4(FFF4)
        #5 infunc = `FUNC_SRL;

        //Test 8a29 >>> 4(FFF4)
        #5 infunc = `FUNC_SRA;

        //Test 8a29 == 2c6b
        #5 
        inop2 = 16'h2C6B;
        infunc = `FUNC_EQ;
        
        //Test 8a29 != 2c6b
        #5 infunc = `FUNC_NE;
        
        //Test 8a29 < 2c6b
        #5 infunc = `FUNC_LT;

        //Test 8a29 < 2c6b (Unsigned)
        #5 infunc = `FUNC_LTU;
        
        //Test 8a29 >= 2c6b
        #5 infunc = `FUNC_GE;

        //Test 8a29 >= 2c6b (Unsigned)
        #5 infunc = `FUNC_GEU;
    end

    ALU_16bit ALU_16bit_test(
        .func(infunc),
        .op1(inop1),
        .op2(inop2),
        .extended(inextended),
        .carry_in(incf),
        .result(outresult),
        .carry_out(outcf)
    );

endmodule

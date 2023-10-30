`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/19 19:26:50
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input CLK,
    input RST,
    
    input ALU_Operate,
    input [2:0] ALU_Operate_funct3,
    input ALU_Operate_funct7,
    input ALU_Operate_result_Enable,
    input ALU_Operate_result_as_Address_Enable,
    input ALU_Operate_op1_Instruction_Address,
    input ALU_Operate_op2_Immediate_Num,

    input Register_to_dBus,

    input Immediate_Num_to_dBus,

    input RAS_Pop_to_Temp,

    input Store_to_Register,
    input Store_to_Register_Write_Address,
    
    input [1:0] External_W_R_Data_Width,

    input External_Read,
    input External_Read_Unsigned_Num,

    input External_Write,

    input RAS_Push_PC_add_4,

    input PC_Next_Jump,
    input PC_Next_Branch,

    input Reg_Store_Pop_Temp,

    output reg Immediate_Number_to_Bus_Enable,

    output reg Program_Counter_Instruction_Address_to_Bus_Enable,
    output reg Program_Counter_Next_Instruction,
    output reg Program_Counter_Jump_Enable,
    output reg Program_Counter_Branch_Enable,

    output reg [2:0] Arithmetic_Logic_Unit_funct3,
    output reg Arithmetic_Logic_Unit_funct7,
    output reg Arithmetic_Logic_Unit_result_as_address_Enable,
    output reg Arithmetic_Logic_Unit_result_Enable,
    output reg Arithmetic_Logic_Unit_operand1_Instruction_Address,
    output reg Arithmetic_Logic_Unit_operand2_Immediate_number,

    output reg General_Register_Read_Data_2_to_Bus_Enable,
    output reg General_Register_Write,
    output reg General_Register_Store_Address,
    output reg General_Register_Store_Pop_Temp,

    output reg Instruction_Register_Write_Enable,
    output Program_Counter_rst,
    output reg Return_Address_Stack_pop_Enable,
    output reg Return_Address_Stack_push_Enable,

    output reg External_Read_Enable,
    output reg External_Read_Unsigned,
    output reg External_Write_Enable,
    output reg [1:0] External_Data_Width
    );

    reg [2:0] current_state;
    wire [2:0] next_state;
    assign next_state = current_state + 1;
    assign Program_Counter_rst = RST;

    always @(posedge CLK) begin
        if (RST) begin
            current_state = 0;
        end else begin
            if (next_state == 3'b110) begin
                current_state = 3'b0;
            end else begin
                current_state = next_state;
            end
        end
    end
    
    always @(*) begin
        case (current_state)
            3'b001: begin
                Immediate_Number_to_Bus_Enable = 1'b0;

                Program_Counter_Instruction_Address_to_Bus_Enable = 1'b1;
                Program_Counter_Next_Instruction = 1'b0;
                Program_Counter_Jump_Enable = 1'b0;
                Program_Counter_Branch_Enable = 1'b0;

                Arithmetic_Logic_Unit_funct3 = 3'b0;
                Arithmetic_Logic_Unit_funct7 = 1'b0;
                Arithmetic_Logic_Unit_result_as_address_Enable = 1'b0;
                Arithmetic_Logic_Unit_result_Enable = 1'b0;
                Arithmetic_Logic_Unit_operand1_Instruction_Address = 1'b0;
                Arithmetic_Logic_Unit_operand2_Immediate_number = 1'b0;

                General_Register_Read_Data_2_to_Bus_Enable = 1'b0;
                General_Register_Write = 1'b0;
                General_Register_Store_Address = 1'b0;
                General_Register_Store_Pop_Temp = 1'b0;

                Instruction_Register_Write_Enable = 1'b0;
                Return_Address_Stack_pop_Enable = 1'b0;
                Return_Address_Stack_push_Enable = 1'b0;

                External_Read_Enable = 1'b1;
                External_Read_Unsigned = 1'b0;
                External_Write_Enable = 1'b0;
                External_Data_Width = 2'b10;
            end
            3'b010: begin
                Immediate_Number_to_Bus_Enable = 1'b0;

                Program_Counter_Instruction_Address_to_Bus_Enable = 1'b1;
                Program_Counter_Next_Instruction = 1'b0;
                Program_Counter_Jump_Enable = 1'b0;
                Program_Counter_Branch_Enable = 1'b0;

                Arithmetic_Logic_Unit_funct3 = 3'b0;
                Arithmetic_Logic_Unit_funct7 = 1'b0;
                Arithmetic_Logic_Unit_result_as_address_Enable = 1'b0;
                Arithmetic_Logic_Unit_result_Enable = 1'b0;
                Arithmetic_Logic_Unit_operand1_Instruction_Address = 1'b0;
                Arithmetic_Logic_Unit_operand2_Immediate_number = 1'b0;

                General_Register_Read_Data_2_to_Bus_Enable = 1'b0;
                General_Register_Write = 1'b0;
                General_Register_Store_Address = 1'b0;
                General_Register_Store_Pop_Temp = 1'b0;

                Instruction_Register_Write_Enable = 1'b1;
                Return_Address_Stack_pop_Enable = 1'b0;
                Return_Address_Stack_push_Enable = 1'b0;

                External_Read_Enable = 1'b1;
                External_Read_Unsigned = 1'b0;
                External_Write_Enable = 1'b0;
                External_Data_Width = 2'b10;
            end
            3'b011: begin
                Immediate_Number_to_Bus_Enable = Immediate_Num_to_dBus;

                Program_Counter_Instruction_Address_to_Bus_Enable = 1'b0;
                Program_Counter_Next_Instruction = 1'b0;
                Program_Counter_Jump_Enable = 1'b0;
                Program_Counter_Branch_Enable = 1'b0;

                if (ALU_Operate) begin
                    Arithmetic_Logic_Unit_funct3 = ALU_Operate_funct3;
                    Arithmetic_Logic_Unit_funct7 = ALU_Operate_funct7;
                    Arithmetic_Logic_Unit_result_as_address_Enable = ALU_Operate_result_as_Address_Enable;
                    Arithmetic_Logic_Unit_result_Enable = ALU_Operate_result_Enable;
                    Arithmetic_Logic_Unit_operand1_Instruction_Address = ALU_Operate_op1_Instruction_Address;
                    Arithmetic_Logic_Unit_operand2_Immediate_number = ALU_Operate_op2_Immediate_Num;
                end else begin
                    Arithmetic_Logic_Unit_funct3 = 3'b0;
                    Arithmetic_Logic_Unit_funct7 = 1'b0;
                    Arithmetic_Logic_Unit_result_as_address_Enable = 1'b0;
                    Arithmetic_Logic_Unit_result_Enable = 1'b0;
                    Arithmetic_Logic_Unit_operand1_Instruction_Address = 1'b0;
                    Arithmetic_Logic_Unit_operand2_Immediate_number = 1'b0;
                end

                General_Register_Read_Data_2_to_Bus_Enable = Register_to_dBus;
                General_Register_Write = 1'b0;
                General_Register_Store_Address = 1'b0;
                General_Register_Store_Pop_Temp = 1'b0;

                Instruction_Register_Write_Enable = 1'b0;
                Return_Address_Stack_pop_Enable = RAS_Pop_to_Temp;
                Return_Address_Stack_push_Enable = 1'b0;

                External_Read_Enable = 1'b0;
                External_Read_Unsigned = 1'b0;
                External_Write_Enable = 1'b0;
                External_Data_Width = 2'b0;
            end
            3'b100: begin
                Immediate_Number_to_Bus_Enable = 1'b0;

                Program_Counter_Instruction_Address_to_Bus_Enable = 1'b0;
                Program_Counter_Next_Instruction = 1'b0;
                Program_Counter_Jump_Enable = 1'b0;
                Program_Counter_Branch_Enable = 1'b0;

                Arithmetic_Logic_Unit_funct3 = 3'b0;
                Arithmetic_Logic_Unit_funct7 = 1'b0;
                Arithmetic_Logic_Unit_result_as_address_Enable = 1'b0;
                Arithmetic_Logic_Unit_result_Enable = 1'b0;
                Arithmetic_Logic_Unit_operand1_Instruction_Address = 1'b0;
                Arithmetic_Logic_Unit_operand2_Immediate_number = 1'b0;

                General_Register_Read_Data_2_to_Bus_Enable = 1'b0;
                General_Register_Write = Store_to_Register;
                General_Register_Store_Address = Store_to_Register_Write_Address;
                General_Register_Store_Pop_Temp = 1'b0;

                Instruction_Register_Write_Enable = 1'b0;
                Return_Address_Stack_pop_Enable = 1'b0;
                Return_Address_Stack_push_Enable = RAS_Push_PC_add_4;

                External_Read_Enable = External_Read;
                External_Read_Unsigned = External_Read_Unsigned_Num;
                External_Write_Enable = External_Write;
                External_Data_Width = External_W_R_Data_Width;
            end
            3'b101: begin
                Immediate_Number_to_Bus_Enable = 1'b0;

                Program_Counter_Instruction_Address_to_Bus_Enable = 1'b0;
                Program_Counter_Next_Instruction = 1'b1;
                Program_Counter_Jump_Enable = PC_Next_Jump;
                Program_Counter_Branch_Enable = PC_Next_Branch;

                Arithmetic_Logic_Unit_funct3 = 3'b0;
                Arithmetic_Logic_Unit_funct7 = 1'b0;
                Arithmetic_Logic_Unit_result_as_address_Enable = 1'b0;
                Arithmetic_Logic_Unit_result_Enable = 1'b0;
                Arithmetic_Logic_Unit_operand1_Instruction_Address = 1'b0;
                Arithmetic_Logic_Unit_operand2_Immediate_number = 1'b0;

                General_Register_Read_Data_2_to_Bus_Enable = 1'b0;
                General_Register_Write = 1'b0;
                General_Register_Store_Address = 1'b0;
                General_Register_Store_Pop_Temp = 1'b0;

                Instruction_Register_Write_Enable = 1'b0;
                Return_Address_Stack_pop_Enable = 1'b0;
                Return_Address_Stack_push_Enable = 1'b0;

                External_Read_Enable = 1'b0;
                External_Read_Unsigned = 1'b0;
                External_Write_Enable = 1'b0;
                External_Data_Width = 2'b0;
            end
            3'b000: begin
                Immediate_Number_to_Bus_Enable = 1'b0;

                Program_Counter_Instruction_Address_to_Bus_Enable = 1'b0;
                Program_Counter_Next_Instruction = 1'b0;
                Program_Counter_Jump_Enable = 1'b0;
                Program_Counter_Branch_Enable = 1'b0;

                Arithmetic_Logic_Unit_funct3 = 3'b0;
                Arithmetic_Logic_Unit_funct7 = 1'b0;
                Arithmetic_Logic_Unit_result_as_address_Enable = 1'b0;
                Arithmetic_Logic_Unit_result_Enable = 1'b0;
                Arithmetic_Logic_Unit_operand1_Instruction_Address = 1'b0;
                Arithmetic_Logic_Unit_operand2_Immediate_number = 1'b0;

                General_Register_Read_Data_2_to_Bus_Enable = 1'b0;
                General_Register_Write = 1'b0;
                General_Register_Store_Address = 1'b0;
                General_Register_Store_Pop_Temp = 1'b0;

                Instruction_Register_Write_Enable = 1'b0;
                Return_Address_Stack_pop_Enable = 1'b0;
                Return_Address_Stack_push_Enable = 1'b0;

                External_Read_Enable = 1'b0;
                External_Read_Unsigned = 1'b0;
                External_Write_Enable = 1'b0;
                External_Data_Width = 2'b0;
            end
        endcase
    end

endmodule
/*
            3'b000: begin
                Immediate_Number_to_Bus_Enable = 1'b0;

                Program_Counter_Instruction_Address_to_Bus_Enable = 1'b0;
                Program_Counter_Next_Instruction = 1'b0;
                Program_Counter_Jump_Enable = 1'b0;
                Program_Counter_Branch_Enable = 1'b0;

                Arithmetic_Logic_Unit_funct3 = 3'b0;
                Arithmetic_Logic_Unit_funct7 = 1'b0;
                Arithmetic_Logic_Unit_result_as_address_Enable = 1'b0;
                Arithmetic_Logic_Unit_result_Enable = 1'b0;
                Arithmetic_Logic_Unit_operand1_Instruction_Address = 1'b0;
                Arithmetic_Logic_Unit_operand2_Immediate_number = 1'b0;

                General_Register_Read_Data_2_to_Bus_Enable = 1'b0;
                General_Register_Write = 1'b0;
                General_Register_Store_Address = 1'b0;
                General_Register_Store_Pop_Temp = 1'b0;

                Instruction_Register_Write_Enable = 1'b0;
                Return_Address_Stack_pop_Enable = 1'b0;
                Return_Address_Stack_push_Enable = 1'b0;

                External_Read_Enable = 1'b0;
                External_Read_Unsigned = 1'b0;
                External_Write_Enable = 1'b0;
                External_Data_Width = 2'b0;
            end
*/
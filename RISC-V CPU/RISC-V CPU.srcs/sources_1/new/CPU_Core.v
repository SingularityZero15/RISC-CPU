`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/22 13:01:40
// Design Name: 
// Module Name: CPU_Core
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


module CPU_Core(
    input External_Clock,
    input External_Reset,
    inout [31:0] Address_Bus,
    inout [31:0] Data_Bus,
    inout [4:0] Control_Bus
    );

    wire Doubled_Clock;

    wire ALU_Operate;
    wire [2:0] ALU_Operate_funct3;
    wire ALU_Operate_funct7;
    wire ALU_Operate_result_Enable;
    wire ALU_Operate_result_as_Address_Enable;
    wire ALU_Operate_op1_Instruction_Address;
    wire ALU_Operate_op2_Immediate_Num;

    wire Register_to_dBus;

    wire Immediate_Num_to_dBus;

    wire RAS_Pop_to_Temp;

    wire Store_to_Register;
    wire Store_to_Register_Write_Address;
    
    wire [1:0] External_W_R_Data_Width;

    wire External_Read;
    wire External_Read_Unsigned_Num;

    wire External_Write;

    wire RAS_Push_PC_add_4;

    wire PC_Next_Jump;
    wire PC_Next_Branch;

    wire Reg_Store_Pop_Temp;

    wire Immediate_Number_to_Bus_Enable;

    wire Program_Counter_Instruction_Address_to_Bus_Enable;
    wire Program_Counter_Next_Instruction;
    wire Program_Counter_Jump_Enable;
    wire Program_Counter_Branch_Enable;

    wire [2:0] Arithmetic_Logic_Unit_funct3;
    wire Arithmetic_Logic_Unit_funct7;
    wire Arithmetic_Logic_Unit_result_as_address_Enable;
    wire Arithmetic_Logic_Unit_result_Enable;
    wire Arithmetic_Logic_Unit_operand1_Instruction_Address;
    wire Arithmetic_Logic_Unit_operand2_Immediate_number;

    wire General_Register_Read_Data_2_to_Bus_Enable;
    wire General_Register_Write;
    wire General_Register_Store_Address;
    wire General_Register_Store_Pop_Temp;

    wire Instruction_Register_Write_Enable;
    wire Program_Counter_rst;
    wire Return_Address_Stack_pop_Enable;
    wire Return_Address_Stack_push_Enable;

    wire [31:0] Instruction_Register_Out_Instruction;

    wire Program_Counter_Branch_Enable_With_Logic;
    wire [31:0] Program_Counter_Instruction_Address;
    wire [31:0] Program_Counter_Instruction_Address_add_4;
    assign Program_Counter_Instruction_Address_add_4 = Program_Counter_Instruction_Address + 3'd4;

    wire [31:0] Return_Address_Stack_Out_Address;

    wire [31:0] General_Registers_Read_Data_1;
    wire [31:0] General_Registers_Read_Data_2;
    wire [4:0] General_Register_Write_Address;
    assign General_Register_Write_Address = General_Register_Store_Pop_Temp ? Instruction_Register_Out_Instruction[19:15] : Instruction_Register_Out_Instruction[11:7];
    wire [31:0] General_Registers_Write_Data;
    wire [31:0] General_Registers_Write_Data_Store_Address;
    assign General_Registers_Write_Data = General_Register_Store_Address ? General_Registers_Write_Data_Store_Address : Data_Bus;
    assign General_Registers_Write_Data_Store_Address = General_Register_Store_Pop_Temp ? Return_Address_Stack_Out_Address : Program_Counter_Instruction_Address_add_4;

    wire [31:0] Immediate_Number_Generater_Immediate_Number;

    wire [31:0] Arithmetic_Logic_Unit_operand1;
    wire [31:0] Arithmetic_Logic_Unit_operand2;
    assign Arithmetic_Logic_Unit_operand1 = Arithmetic_Logic_Unit_operand1_Instruction_Address ? Instruction_Register_Out_Instruction : General_Registers_Read_Data_1;
    assign Arithmetic_Logic_Unit_operand2 = Arithmetic_Logic_Unit_operand2_Immediate_number ? Immediate_Number_Generater_Immediate_Number : General_Registers_Read_Data_2;
    wire Arithmetic_Logic_Unit_result_logic;
    
    assign Program_Counter_Branch_Enable_With_Logic = Program_Counter_Branch_Enable & Arithmetic_Logic_Unit_result_logic;

    Clock_Doubler Clock_Doubler_inst(
        .clk_100m(External_Clock),
        .rst(External_Reset),
        .clk_200m(Doubled_Clock)
    );

    Control_Unit Control_Unit_inst(
        .CLK(Doubled_Clock),
        .RST(External_Reset),

        .ALU_Operate(ALU_Operate),
        .ALU_Operate_funct3(ALU_Operate_funct3),
        .ALU_Operate_funct7(ALU_Operate_funct7),
        .ALU_Operate_result_Enable(ALU_Operate_result_Enable),
        .ALU_Operate_result_as_Address_Enable(ALU_Operate_result_as_Address_Enable),
        .ALU_Operate_op1_Instruction_Address(ALU_Operate_op1_Instruction_Address),
        .ALU_Operate_op2_Immediate_Num(ALU_Operate_op2_Immediate_Num),

        .Register_to_dBus(Register_to_dBus),

        .Immediate_Num_to_dBus(Immediate_Num_to_dBus),

        .RAS_Pop_to_Temp(RAS_Pop_to_Temp),

        .Store_to_Register(Store_to_Register),
        .Store_to_Register_Write_Address(Store_to_Register_Write_Address),

        .External_W_R_Data_Width(External_W_R_Data_Width),

        .External_Read(External_Read),
        .External_Read_Unsigned_Num(External_Read_Unsigned_Num),

        .External_Write(External_Write),

        .RAS_Push_PC_add_4(RAS_Push_PC_add_4),

        .PC_Next_Jump(PC_Next_Jump),
        .PC_Next_Branch(PC_Next_Branch),

        .Reg_Store_Pop_Temp(Reg_Store_Pop_Temp),

        .Immediate_Number_to_Bus_Enable(Immediate_Number_to_Bus_Enable),

        .Program_Counter_Instruction_Address_to_Bus_Enable(Program_Counter_Instruction_Address_to_Bus_Enable),
        .Program_Counter_Next_Instruction(Program_Counter_Next_Instruction),
        .Program_Counter_Jump_Enable(Program_Counter_Jump_Enable),
        .Program_Counter_Branch_Enable(Program_Counter_Branch_Enable),

        .Arithmetic_Logic_Unit_funct3(Arithmetic_Logic_Unit_funct3),
        .Arithmetic_Logic_Unit_funct7(Arithmetic_Logic_Unit_funct7),
        .Arithmetic_Logic_Unit_result_as_address_Enable(Arithmetic_Logic_Unit_result_as_address_Enable),
        .Arithmetic_Logic_Unit_result_Enable(Arithmetic_Logic_Unit_result_Enable),
        .Arithmetic_Logic_Unit_operand1_Instruction_Address(Arithmetic_Logic_Unit_operand1_Instruction_Address),
        .Arithmetic_Logic_Unit_operand2_Immediate_number(Arithmetic_Logic_Unit_operand2_Immediate_number),

        .General_Register_Read_Data_2_to_Bus_Enable(General_Register_Read_Data_2_to_Bus_Enable),
        .General_Register_Write(General_Register_Write),
        .General_Register_Store_Address(General_Register_Store_Address),
        .General_Register_Store_Pop_Temp(General_Register_Store_Pop_Temp),

        .Instruction_Register_Write_Enable(Instruction_Register_Write_Enable),
        .Program_Counter_rst(Program_Counter_rst),
        .Return_Address_Stack_pop_Enable(Return_Address_Stack_pop_Enable),
        .Return_Address_Stack_push_Enable(Return_Address_Stack_push_Enable),

        .External_Read_Enable(Control_Bus[0]),
        .External_Read_Unsigned(Control_Bus[1]),
        .External_Write_Enable(Control_Bus[2]),
        .External_Data_Width(Control_Bus[4:3])
    );

    Instruction_Decoder Instruction_Decoder_inst(
        .Instruction(Instruction_Register_Out_Instruction),

        .ALU_Operate(ALU_Operate),
        .ALU_Operate_funct3(ALU_Operate_funct3),
        .ALU_Operate_funct7(ALU_Operate_funct7),
        .ALU_Operate_result_Enable(ALU_Operate_result_Enable),
        .ALU_Operate_result_as_Address_Enable(ALU_Operate_result_as_Address_Enable),
        .ALU_Operate_op1_Instruction_Address(External_DALU_Operate_op1_Instruction_Addressata_Width),
        .ALU_Operate_op2_Immediate_Num(ALU_Operate_op2_Immediate_Num),

        .Register_to_dBus(Register_to_dBus),

        .Immediate_Num_to_dBus(Immediate_Num_to_dBus),

        .RAS_Pop_to_Temp(RAS_Pop_to_Temp),

        .Store_to_Register(Store_to_Register),
        .Store_to_Register_Write_Address(Store_to_Register_Write_Address),

        .External_W_R_Data_Width(External_W_R_Data_Width),

        .External_Read(External_Read),
        .External_Read_Unsigned_Num(External_Read_Unsigned_Num),

        .External_Write(External_Write),

        .RAS_Push_PC_add_4(RAS_Push_PC_add_4),

        .PC_Next_Jump(PC_Next_Jump),
        .PC_Next_Branch(PC_Next_Branch),

        .Reg_Store_Pop_Temp(Reg_Store_Pop_Temp)
    );

    Instruction_Register Instruction_Register_inst(
        .Write_Enable(Instruction_Register_Write_Enable),
        .In_Instruction(Data_Bus),
        .Out_Instruction(Instruction_Register_Out_Instruction)
    );

    Program_Counter Program_Counter_inst(
        .rst(Program_Counter_rst),
        .Instruction_Address_to_Bus_Enable(Program_Counter_Instruction_Address_to_Bus_Enable),
        .Next_Instruction(Program_Counter_Next_Instruction),
        .Jump_Enable(Program_Counter_Jump_Enable),
        .Branch_Enable(Program_Counter_Branch_Enable_With_Logic),
        .In_Address(Data_Bus),
        .Instruction_Address_to_Bus(Address_Bus),
        .Instruction_Address(Program_Counter_Instruction_Address)
    );

    Return_Address_Stack Return_Address_Stack_inst(
        .CLK(Doubled_Clock),
        .pop_Enable(Return_Address_Stack_pop_Enable),
        .push_Enable(Return_Address_Stack_push_Enable),
        .In_Address(Program_Counter_Instruction_Address_add_4),
        .Out_Address(Return_Address_Stack_Out_Address)
    );

    General_Registers General_Registers_inst(
        .Read_Address_1(Instruction_Register_Out_Instruction[19:15]),
        .Read_Data_1(General_Registers_Read_Data_1),
        .Read_Address_2(Instruction_Register_Out_Instruction[24:20]),
        .Read_Data_2(General_Registers_Read_Data_2),
        .Read_Data_2_to_Bus_Enable(General_Register_Read_Data_2_to_Bus_Enable),
        .Read_Data_2_to_Bus(Data_Bus),
        .Write_Address(General_Register_Write_Address),
        .Write_Data(General_Registers_Write_Data),
        .Register_Write(General_Register_Write)
    );

    Immediate_Number_Generater Immediate_Number_Generater_inst(
        .Instruction(Instruction_Register_Out_Instruction),
        .Immediate_Number_to_Bus_Enable(Immediate_Number_to_Bus_Enable),
        .Immediate_Number_to_Bus(Data_Bus),
        .Immediate_Number(Immediate_Number_Generater_Immediate_Number)
    );

    Arithmetic_Logic_Unit Arithmetic_Logic_Unit_inst(
        .result_as_address_Enable(Arithmetic_Logic_Unit_result_as_address_Enable),
        .result_Enable(Arithmetic_Logic_Unit_result_Enable),
        .funct3(Arithmetic_Logic_Unit_funct3),
        .funct7(Arithmetic_Logic_Unit_funct7),
        .operand1(Arithmetic_Logic_Unit_operand1),
        .operand2(Arithmetic_Logic_Unit_operand2),
        .result(Data_Bus),
        .result_as_address(Address_Bus),
        .result_logic(Arithmetic_Logic_Unit_result_logic)
    );

endmodule

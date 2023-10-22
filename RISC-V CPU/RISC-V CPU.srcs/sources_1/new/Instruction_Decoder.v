`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/21 18:57:51
// Design Name: 
// Module Name: Instruction_Decoder
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


module Instruction_Decoder(
    input [31:0] Instruction,

    output reg ALU_Operate,
    output reg [2:0] ALU_Operate_funct3,
    output reg ALU_Operate_funct7,
    output reg ALU_Operate_result_Enable,
    output reg ALU_Operate_result_as_Address_Enable,
    output reg ALU_Operate_op1_Instruction_Address,
    output reg ALU_Operate_op2_Immediate_Num,

    output reg Register_to_dBus,

    output reg Immediate_Num_to_dBus,

    output reg RAS_Pop_to_Temp,

    output reg Store_to_Register,
    output reg Store_to_Register_Write_Address,
    
    output reg [1:0] External_W_R_Data_Width,

    output reg External_Read,
    output reg External_Read_Unsigned_Num,

    output reg External_Write,

    output reg RAS_Push_PC_add_4,

    output reg PC_Next_Jump,
    output reg PC_Next_Branch,

    output reg Reg_Store_Pop_Temp
    );

    always @(*) begin
        case (Instruction[6:0])
            7'b0110111: begin
                ALU_Operate = 1'b0;
                ALU_Operate_funct3 = 3'b0;
                ALU_Operate_funct7 = 1'b0;
                ALU_Operate_result_Enable = 1'b0;
                ALU_Operate_result_as_Address_Enable = 1'b0;
                ALU_Operate_op1_Instruction_Address = 1'b0;
                ALU_Operate_op2_Immediate_Num = 1'b0;

                Register_to_dBus = 1'b0;
                Immediate_Num_to_dBus = 1'b1;
                RAS_Pop_to_Temp = 1'b0;

                Store_to_Register = 1'b1;
                Store_to_Register_Write_Address = 1'b0;

                External_W_R_Data_Width = 2'b0;
                External_Read = 1'b0;
                External_Read_Unsigned_Num = 1'b0;
                External_Write = 1'b0;

                RAS_Push_PC_add_4 = 1'b0;

                PC_Next_Jump = 1'b0;
                PC_Next_Branch = 1'b0;

                Reg_Store_Pop_Temp = 1'b0;
            end
            7'b010111: begin
                ALU_Operate = 1'b1;
                ALU_Operate_funct3 = 3'b0;
                ALU_Operate_funct7 = 1'b0;
                ALU_Operate_result_Enable = 1'b1;
                ALU_Operate_result_as_Address_Enable = 1'b0;
                ALU_Operate_op1_Instruction_Address = 1'b1;
                ALU_Operate_op2_Immediate_Num = 1'b1;

                Register_to_dBus = 1'b0;
                Immediate_Num_to_dBus = 1'b0;
                RAS_Pop_to_Temp = 1'b0;

                Store_to_Register = 1'b1;
                Store_to_Register_Write_Address = 1'b0;

                External_W_R_Data_Width = 2'b0;
                External_Read = 1'b0;
                External_Read_Unsigned_Num = 1'b0;
                External_Write = 1'b0;

                RAS_Push_PC_add_4 = 1'b0;

                PC_Next_Jump = 1'b0;
                PC_Next_Branch = 1'b0;

                Reg_Store_Pop_Temp = 1'b0;
            end
            7'b1101111: begin
                ALU_Operate = 1'b0;
                ALU_Operate_funct3 = 3'b0;
                ALU_Operate_funct7 = 1'b0;
                ALU_Operate_result_Enable = 1'b0;
                ALU_Operate_result_as_Address_Enable = 1'b0;
                ALU_Operate_op1_Instruction_Address = 1'b0;
                ALU_Operate_op2_Immediate_Num = 1'b0;

                Register_to_dBus = 1'b0;
                Immediate_Num_to_dBus = 1'b1;
                RAS_Pop_to_Temp = 1'b0;

                Store_to_Register = 1'b1;
                Store_to_Register_Write_Address = 1'b1;

                External_W_R_Data_Width = 2'b0;
                External_Read = 1'b0;
                External_Read_Unsigned_Num = 1'b0;
                External_Write = 1'b0;

                RAS_Push_PC_add_4 = 1'b0;

                PC_Next_Jump = 1'b1;
                PC_Next_Branch = 1'b0;

                Reg_Store_Pop_Temp = 1'b0;
            end
            7'b1100111: begin
                ALU_Operate = 1'b1;
                ALU_Operate_funct3 = 3'b0;
                ALU_Operate_funct7 = 1'b0;
                ALU_Operate_result_Enable = 1'b1;
                ALU_Operate_result_as_Address_Enable = 1'b0;
                ALU_Operate_op1_Instruction_Address = 1'b0;
                ALU_Operate_op2_Immediate_Num = 1'b1;

                Register_to_dBus = 1'b0;
                Immediate_Num_to_dBus = 1'b0;
                if (Instruction[19:18] == 2'b0 && Instruction[16:15] == 2'b01) begin
                    if (Instruction[11:10] == 2'b0 && Instruction[8:7] == 2'b01) begin
                        if(Instruction[17] == Instruction[9]) begin
                            RAS_Pop_to_Temp = 1'b0;
                            Reg_Store_Pop_Temp = 1'b0;

                            RAS_Push_PC_add_4 = 1'b1;
                        end else begin
                            RAS_Pop_to_Temp = 1'b1;
                            Reg_Store_Pop_Temp = 1'b1;

                            RAS_Push_PC_add_4 = 1'b1;
                        end
                    end else begin
                        RAS_Pop_to_Temp = 1'b1;
                        Reg_Store_Pop_Temp = 1'b1;

                        RAS_Push_PC_add_4 = 1'b0;
                    end
                end else begin
                    if (Instruction[11:10] == 2'b0 && Instruction[8:7] == 2'b01) begin
                        RAS_Pop_to_Temp = 1'b0;
                        Reg_Store_Pop_Temp = 1'b0;

                        RAS_Push_PC_add_4 = 1'b1;
                    end else begin
                        RAS_Pop_to_Temp = 1'b0;
                        Reg_Store_Pop_Temp = 1'b0;

                        RAS_Push_PC_add_4 = 1'b0;
                    end
                end

                Store_to_Register = 1'b1;
                Store_to_Register_Write_Address = 1'b1;

                External_W_R_Data_Width = 2'b0;
                External_Read = 1'b0;
                External_Read_Unsigned_Num = 1'b0;
                External_Write = 1'b0;

                PC_Next_Jump = 1'b1;
                PC_Next_Branch = 1'b0;
            end
            7'b1100011: begin
                ALU_Operate = 1'b1;
                ALU_Operate_funct3 = Instruction[14:12];
                ALU_Operate_funct7 = 1'b0;
                ALU_Operate_result_Enable = 1'b0;
                ALU_Operate_result_as_Address_Enable = 1'b0;
                ALU_Operate_op1_Instruction_Address = 1'b0;
                ALU_Operate_op2_Immediate_Num = 1'b0;

                Register_to_dBus = 1'b0;
                Immediate_Num_to_dBus = 1'b1;
                RAS_Pop_to_Temp = 1'b0;

                Store_to_Register = 1'b0;
                Store_to_Register_Write_Address = 1'b0;

                External_W_R_Data_Width = 2'b0;
                External_Read = 1'b0;
                External_Read_Unsigned_Num = 1'b0;
                External_Write = 1'b0;

                RAS_Push_PC_add_4 = 1'b0;

                PC_Next_Jump = 1'b0;
                PC_Next_Branch = 1'b1;

                Reg_Store_Pop_Temp = 1'b0;
            end
            7'b0011: begin
                ALU_Operate = 1'b1;
                ALU_Operate_funct3 = 3'b0;
                ALU_Operate_funct7 = 1'b0;
                ALU_Operate_result_Enable = 1'b0;
                ALU_Operate_result_as_Address_Enable = 1'b1;
                ALU_Operate_op1_Instruction_Address = 1'b0;
                ALU_Operate_op2_Immediate_Num = 1'b1;

                Register_to_dBus = 1'b0;
                Immediate_Num_to_dBus = 1'b0;
                RAS_Pop_to_Temp = 1'b0;

                Store_to_Register = 1'b1;
                Store_to_Register_Write_Address = 1'b0;

                External_W_R_Data_Width = Instruction[13:12];
                External_Read = 1'b1;
                External_Read_Unsigned_Num = Instruction[14];
                External_Write = 1'b0;

                RAS_Push_PC_add_4 = 1'b0;

                PC_Next_Jump = 1'b0;
                PC_Next_Branch = 1'b0;

                Reg_Store_Pop_Temp = 1'b0;
            end
            7'b0100011: begin
                ALU_Operate = 1'b1;
                ALU_Operate_funct3 = 3'b0;
                ALU_Operate_funct7 = 1'b0;
                ALU_Operate_result_Enable = 1'b0;
                ALU_Operate_result_as_Address_Enable = 1'b1;
                ALU_Operate_op1_Instruction_Address = 1'b0;
                ALU_Operate_op2_Immediate_Num = 1'b1;

                Register_to_dBus = 1'b1;
                Immediate_Num_to_dBus = 1'b0;
                RAS_Pop_to_Temp = 1'b0;

                Store_to_Register = 1'b0;
                Store_to_Register_Write_Address = 1'b0;

                External_W_R_Data_Width = Instruction[13:12];
                External_Read = 1'b0;
                External_Read_Unsigned_Num = 1'b0;
                External_Write = 1'b1;

                RAS_Push_PC_add_4 = 1'b0;

                PC_Next_Jump = 1'b0;
                PC_Next_Branch = 1'b0;

                Reg_Store_Pop_Temp = 1'b0;
            end
            7'b010011: begin
                ALU_Operate = 1'b1;
                ALU_Operate_funct3 = Instruction[14:12];
                if (Instruction[14:12] == 3'b101) begin
                    ALU_Operate_funct7 = Instruction[30];
                end else begin
                    ALU_Operate_funct7 = 1'b0;
                end
                ALU_Operate_result_Enable = 1'b1;
                ALU_Operate_result_as_Address_Enable = 1'b0;
                ALU_Operate_op1_Instruction_Address = 1'b0;
                ALU_Operate_op2_Immediate_Num = 1'b1;

                Register_to_dBus = 1'b0;
                Immediate_Num_to_dBus = 1'b0;
                RAS_Pop_to_Temp = 1'b0;

                Store_to_Register = 1'b1;
                Store_to_Register_Write_Address = 1'b0;

                External_W_R_Data_Width = 2'b0;
                External_Read = 1'b0;
                External_Read_Unsigned_Num = 1'b0;
                External_Write = 1'b0;

                RAS_Push_PC_add_4 = 1'b0;

                PC_Next_Jump = 1'b0;
                PC_Next_Branch = 1'b0;

                Reg_Store_Pop_Temp = 1'b0;
            end
            7'b0110011: begin
                ALU_Operate = 1'b0;
                ALU_Operate_funct3 = 3'b0;
                if (Instruction[14:12] == 3'b101 || Instruction[14:12] == 3'b0) begin
                    ALU_Operate_funct7 = Instruction[30];
                end else begin
                    ALU_Operate_funct7 = 1'b0;
                end
                ALU_Operate_result_Enable = 1'b0;
                ALU_Operate_result_as_Address_Enable = 1'b0;
                ALU_Operate_op1_Instruction_Address = 1'b0;
                ALU_Operate_op2_Immediate_Num = 1'b0;

                Register_to_dBus = 1'b0;
                Immediate_Num_to_dBus = 1'b0;
                RAS_Pop_to_Temp = 1'b0;

                Store_to_Register = 1'b0;
                Store_to_Register_Write_Address = 1'b0;

                External_W_R_Data_Width = 2'b0;
                External_Read = 1'b0;
                External_Read_Unsigned_Num = 1'b0;
                External_Write = 1'b0;

                RAS_Push_PC_add_4 = 1'b0;

                PC_Next_Jump = 1'b0;
                PC_Next_Branch = 1'b0;

                Reg_Store_Pop_Temp = 1'b0;
            end
            default: begin
                ALU_Operate = 1'b0;
                ALU_Operate_funct3 = 3'b0;
                ALU_Operate_funct7 = 1'b0;
                ALU_Operate_result_Enable = 1'b0;
                ALU_Operate_result_as_Address_Enable = 1'b0;
                ALU_Operate_op1_Instruction_Address = 1'b0;
                ALU_Operate_op2_Immediate_Num = 1'b0;

                Register_to_dBus = 1'b0;
                Immediate_Num_to_dBus = 1'b0;
                RAS_Pop_to_Temp = 1'b0;

                Store_to_Register = 1'b0;
                Store_to_Register_Write_Address = 1'b0;

                External_W_R_Data_Width = 2'b0;
                External_Read = 1'b0;
                External_Read_Unsigned_Num = 1'b0;
                External_Write = 1'b0;

                RAS_Push_PC_add_4 = 1'b0;

                PC_Next_Jump = 1'b0;
                PC_Next_Branch = 1'b0;

                Reg_Store_Pop_Temp = 1'b0;
            end
        endcase
    end

endmodule

/*
            7'b0011: begin
                ALU_Operate = 1'b0;
                ALU_Operate_funct3 = 3'b0;
                ALU_Operate_funct7 = 1'b0;
                ALU_Operate_result_Enable = 1'b0;
                ALU_Operate_result_as_Address_Enable = 1'b0;
                ALU_Operate_op1_Instruction_Address = 1'b0;
                ALU_Operate_op2_Immediate_Num = 1'b0;

                Register_to_dBus = 1'b0;
                Immediate_Num_to_dBus = 1'b0;
                RAS_Pop_to_Temp = 1'b0;

                Store_to_Register = 1'b0;
                Store_to_Register_Write_Address = 1'b0;

                External_W_R_Data_Width = 2'b0;
                External_Read = 1'b0;
                External_Read_Unsigned_Num = 1'b0;
                External_Write = 1'b0;

                RAS_Push_PC_add_4 = 1'b0;

                PC_Next_Jump = 1'b0;
                PC_Next_Branch = 1'b0;

                Reg_Store_Pop_Temp = 1'b0;
            end
*/
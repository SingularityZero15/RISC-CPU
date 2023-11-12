`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/06 20:55:30
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    input clk,
    input Read_Unsigned,
    input Write_Enable,
    input [1:0] Data_Width,
    input [31:0] Address,
    input [31:0] In_Data,
    output [31:0] Out_Data
    );

    reg Write_Enable_0, Write_Enable_1, Write_Enable_2, Write_Enable_3;
    reg [7:0] Address_0, Address_1, Address_2, Address_3;
    reg [7:0] In_Data_0, In_Data_1, In_Data_2, In_Data_3;
    wire [7:0] Out_Data_0, Out_Data_1, Out_Data_2, Out_Data_3;
    reg [31:0] Arranged_Data;

    assign Out_Data = Arranged_Data;

    always @(*) begin

        //Set address for each memory chip
        case (Address[1:0])
            2'b00: begin
                Address_0 = Address[9:2];
                Address_1 = Address[9:2];
                Address_2 = Address[9:2];
                Address_3 = Address[9:2];
            end
            2'b01: begin
                Address_0 = Address[9:2] + 1;
                Address_1 = Address[9:2];
                Address_2 = Address[9:2];
                Address_3 = Address[9:2];
            end
            2'b10: begin
                Address_0 = Address[9:2] + 1;
                Address_1 = Address[9:2] + 1;
                Address_2 = Address[9:2];
                Address_3 = Address[9:2];
            end
            2'b11: begin
                Address_0 = Address[9:2] + 1;
                Address_1 = Address[9:2] + 1;
                Address_2 = Address[9:2] + 1;
                Address_3 = Address[9:2];
            end
        endcase
        
        //Set write signal for each memory chip
        //if (Address[31:16] == 16'h0001) begin
            case (Data_Width)
                2'b00: begin
                    case (Address[1:0])
                        2'b00: begin
                            Write_Enable_0 = Write_Enable;
                            Write_Enable_1 = 0;
                            Write_Enable_2 = 0;
                            Write_Enable_3 = 0;
                        end
                        2'b01: begin
                            Write_Enable_1 = Write_Enable;
                            Write_Enable_2 = 0;
                            Write_Enable_3 = 0;
                            Write_Enable_0 = 0;
                        end
                        2'b10: begin
                            Write_Enable_2 = Write_Enable;
                            Write_Enable_3 = 0;
                            Write_Enable_0 = 0;
                            Write_Enable_1 = 0;
                        end
                        2'b11: begin
                            Write_Enable_3 = Write_Enable;
                            Write_Enable_0 = 0;
                            Write_Enable_1 = 0;
                            Write_Enable_2 = 0;
                        end
                    endcase
                end
                2'b01: begin
                    case (Address[1:0])
                        2'b00: begin
                            Write_Enable_0 = Write_Enable;
                            Write_Enable_1 = Write_Enable;
                            Write_Enable_2 = 0;
                            Write_Enable_3 = 0;
                        end
                        2'b01: begin
                            Write_Enable_1 = Write_Enable;
                            Write_Enable_2 = Write_Enable;
                            Write_Enable_3 = 0;
                            Write_Enable_0 = 0;
                        end
                        2'b10: begin
                            Write_Enable_2 = Write_Enable;
                            Write_Enable_3 = Write_Enable;
                            Write_Enable_0 = 0;
                            Write_Enable_1 = 0;
                        end
                        2'b11: begin
                            Write_Enable_3 = Write_Enable;
                            Write_Enable_0 = Write_Enable;
                            Write_Enable_1 = 0;
                            Write_Enable_2 = 0;
                        end
                    endcase
                end
                2'b10: begin
                    Write_Enable_0 = Write_Enable;
                    Write_Enable_1 = Write_Enable;
                    Write_Enable_2 = Write_Enable;
                    Write_Enable_3 = Write_Enable;
                end
                2'b11: begin
                    Write_Enable_0 = Write_Enable;
                    Write_Enable_1 = Write_Enable;
                    Write_Enable_2 = Write_Enable;
                    Write_Enable_3 = Write_Enable;
                end
            endcase
        // end else begin
        //     Write_Enable_0 = 0;
        //     Write_Enable_1 = 0;
        //     Write_Enable_2 = 0;
        //     Write_Enable_3 = 0;
        // end

        //Arrange Output Data
        case (Data_Width)
            2'b00: begin
                case (Address[1:0])
                    2'b00: begin
                        Arranged_Data[7:0] = Out_Data_0;
                    end
                    2'b01: begin
                        Arranged_Data[7:0] = Out_Data_1;
                    end
                    2'b10: begin
                        Arranged_Data[7:0] = Out_Data_2;
                    end
                    2'b11: begin
                        Arranged_Data[7:0] = Out_Data_3;
                    end
                endcase
                if (Read_Unsigned) begin
                    Arranged_Data[31:8] = 0;
                end else begin
                    Arranged_Data[31:8] = Arranged_Data[7];
                end
            end
            2'b01: begin
                case (Address[1:0])
                    2'b00: begin
                        Arranged_Data[7:0] = Out_Data_0;
                        Arranged_Data[15:8] = Out_Data_1;
                    end
                    2'b01: begin
                        Arranged_Data[7:0] = Out_Data_1;
                        Arranged_Data[15:8] = Out_Data_2;
                    end
                    2'b10: begin
                        Arranged_Data[7:0] = Out_Data_2;
                        Arranged_Data[15:8] = Out_Data_3;
                    end
                    2'b11: begin
                        Arranged_Data[7:0] = Out_Data_3;
                        Arranged_Data[15:8] = Out_Data_0;
                    end
                endcase
                if (Read_Unsigned) begin
                    Arranged_Data[31:16] = 0;
                end else begin
                    Arranged_Data[31:16] = Arranged_Data[15];
                end
            end
            2'b10: begin
                case (Address[1:0])
                    2'b00: begin
                        Arranged_Data[7:0] = Out_Data_0;
                        Arranged_Data[15:8] = Out_Data_1;
                        Arranged_Data[23:16] = Out_Data_2;
                        Arranged_Data[31:24] = Out_Data_3;
                    end
                    2'b01: begin
                        Arranged_Data[7:0] = Out_Data_1;
                        Arranged_Data[15:8] = Out_Data_2;
                        Arranged_Data[23:16] = Out_Data_3;
                        Arranged_Data[31:24] = Out_Data_0;
                    end
                    2'b10: begin
                        Arranged_Data[7:0] = Out_Data_2;
                        Arranged_Data[15:8] = Out_Data_3;
                        Arranged_Data[23:16] = Out_Data_0;
                        Arranged_Data[31:24] = Out_Data_1;
                    end
                    2'b11: begin
                        Arranged_Data[7:0] = Out_Data_3;
                        Arranged_Data[15:8] = Out_Data_0;
                        Arranged_Data[23:16] = Out_Data_1;
                        Arranged_Data[31:24] = Out_Data_2;
                    end
                endcase
            end
            2'b11: begin
                case (Address[1:0])
                    2'b00: begin
                        Arranged_Data[7:0] = Out_Data_0;
                        Arranged_Data[15:8] = Out_Data_1;
                        Arranged_Data[23:16] = Out_Data_2;
                        Arranged_Data[31:24] = Out_Data_3;
                    end
                    2'b01: begin
                        Arranged_Data[7:0] = Out_Data_1;
                        Arranged_Data[15:8] = Out_Data_2;
                        Arranged_Data[23:16] = Out_Data_3;
                        Arranged_Data[31:24] = Out_Data_0;
                    end
                    2'b10: begin
                        Arranged_Data[7:0] = Out_Data_2;
                        Arranged_Data[15:8] = Out_Data_3;
                        Arranged_Data[23:16] = Out_Data_0;
                        Arranged_Data[31:24] = Out_Data_1;
                    end
                    2'b11: begin
                        Arranged_Data[7:0] = Out_Data_3;
                        Arranged_Data[15:8] = Out_Data_0;
                        Arranged_Data[23:16] = Out_Data_1;
                        Arranged_Data[31:24] = Out_Data_2;
                    end
                endcase
            end
        endcase

        //Arrange Input Data
        case (Data_Width)
            2'b00: begin
                case (Address[1:0])
                    2'b00: begin
                        In_Data_0 = In_Data[7:0];
                        In_Data_1 = 0;
                        In_Data_2 = 0;
                        In_Data_3 = 0;
                    end
                    2'b01: begin
                        In_Data_1 = In_Data[7:0];
                        In_Data_2 = 0;
                        In_Data_3 = 0;
                        In_Data_0 = 0;
                    end
                    2'b10: begin
                        In_Data_2 = In_Data[7:0];
                        In_Data_3 = 0;
                        In_Data_0 = 0;
                        In_Data_1 = 0;
                    end
                    2'b11: begin
                        In_Data_3 = In_Data[7:0];
                        In_Data_0 = 0;
                        In_Data_1 = 0;
                        In_Data_2 = 0;
                    end
                endcase
            end
            2'b01: begin
                case (Address[1:0])
                    2'b00: begin
                        In_Data_0 = In_Data[7:0];
                        In_Data_1 = In_Data[15:8];
                        In_Data_2 = 0;
                        In_Data_3 = 0;
                    end
                    2'b01: begin
                        In_Data_1 = In_Data[7:0];
                        In_Data_2 = In_Data[15:8];
                        In_Data_3 = 0;
                        In_Data_0 = 0;
                    end
                    2'b10: begin
                        In_Data_2 = In_Data[7:0];
                        In_Data_3 = In_Data[15:8];
                        In_Data_0 = 0;
                        In_Data_1 = 0;
                    end
                    2'b11: begin
                        In_Data_3 = In_Data[7:0];
                        In_Data_0 = In_Data[15:8];
                        In_Data_1 = 0;
                        In_Data_2 = 0;
                    end
                endcase
            end
            2'b10: begin
                case (Address[1:0])
                    2'b00: begin
                        In_Data_0 = In_Data[7:0];
                        In_Data_1 = In_Data[15:8];
                        In_Data_2 = In_Data[23:16];
                        In_Data_3 = In_Data[31:24];
                    end
                    2'b01: begin
                        In_Data_1 = In_Data[7:0];
                        In_Data_2 = In_Data[15:8];
                        In_Data_3 = In_Data[23:16];
                        In_Data_0 = In_Data[31:24];
                    end
                    2'b10: begin
                        In_Data_2 = In_Data[7:0];
                        In_Data_3 = In_Data[15:8];
                        In_Data_0 = In_Data[23:16];
                        In_Data_1 = In_Data[31:24];
                    end
                    2'b11: begin
                        In_Data_3 = In_Data[7:0];
                        In_Data_0 = In_Data[15:8];
                        In_Data_1 = In_Data[23:16];
                        In_Data_2 = In_Data[31:24];
                    end
                endcase
            end
            2'b11: begin
                case (Address[1:0])
                    2'b00: begin
                        In_Data_0 = In_Data[7:0];
                        In_Data_1 = In_Data[15:8];
                        In_Data_2 = In_Data[23:16];
                        In_Data_3 = In_Data[31:24];
                    end
                    2'b01: begin
                        In_Data_1 = In_Data[7:0];
                        In_Data_2 = In_Data[15:8];
                        In_Data_3 = In_Data[23:16];
                        In_Data_0 = In_Data[31:24];
                    end
                    2'b10: begin
                        In_Data_2 = In_Data[7:0];
                        In_Data_3 = In_Data[15:8];
                        In_Data_0 = In_Data[23:16];
                        In_Data_1 = In_Data[31:24];
                    end
                    2'b11: begin
                        In_Data_3 = In_Data[7:0];
                        In_Data_0 = In_Data[15:8];
                        In_Data_1 = In_Data[23:16];
                        In_Data_2 = In_Data[31:24];
                    end
                endcase
            end
        endcase
    end

    ram_8x256 RAM_blk0 (
        .clka(clk),    // input wire clka
        .wea(Write_Enable_0),      // input wire [0 : 0] wea
        .addra(Address_0),  // input wire [7 : 0] addra
        .dina(In_Data_0),    // input wire [7 : 0] dina
        .douta(Out_Data_0)  // output wire [7 : 0] douta
    );
    ram_8x256 RAM_blk1 (
        .clka(clk),    // input wire clka
        .wea(Write_Enable_1),      // input wire [0 : 0] wea
        .addra(Address_1),  // input wire [7 : 0] addra
        .dina(In_Data_1),    // input wire [7 : 0] dina
        .douta(Out_Data_1)  // output wire [7 : 0] douta
    );
    ram_8x256 RAM_blk2 (
        .clka(clk),    // input wire clka
        .wea(Write_Enable_2),      // input wire [0 : 0] wea
        .addra(Address_2),  // input wire [7 : 0] addra
        .dina(In_Data_2),    // input wire [7 : 0] dina
        .douta(Out_Data_2)  // output wire [7 : 0] douta
    );
    ram_8x256 RAM_blk3 (
        .clka(clk),    // input wire clka
        .wea(Write_Enable_3),      // input wire [0 : 0] wea
        .addra(Address_3),  // input wire [7 : 0] addra
        .dina(In_Data_3),    // input wire [7 : 0] dina
        .douta(Out_Data_3)  // output wire [7 : 0] douta
    );
endmodule

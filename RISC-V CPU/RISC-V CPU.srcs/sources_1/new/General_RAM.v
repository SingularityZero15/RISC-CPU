`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/12 21:32:27
// Design Name: 
// Module Name: General_RAM
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

module General_RAM(
    input clk,
    input [31:0] Address,
    input Write_Enable,
    input [1:0] Operate_Mode,
    input [31:0] In_Data,
    output [31:0] Out_Data
    );

    reg Write_Enable_0, Write_Enable_1, Write_Enable_2, Write_Enable_3;
    reg [7:0] Address_0, Address_1, Address_2, Address_3;
    reg [7:0] In_Data_0, In_Data_1, In_Data_2, In_Data_3;
    wire [7:0] Out_Data_0, Out_Data_1, Out_Data_2, Out_Data_3;
    reg [31:0] Arranged_Data;
    assign Out_Data = Write_Enable ? 32'bz : Arranged_Data;
    
    always @(*) begin
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
        case (Operate_Mode)
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
        case (Operate_Mode)
            2'b00: begin
                case (Address[1:0])
                    2'b00: begin
                        Arranged_Data[7:0] = Out_Data_0;
                        Arranged_Data[31:8] = 0;
                    end
                    2'b01: begin
                        Arranged_Data[7:0] = Out_Data_1;
                        Arranged_Data[31:8] = 0;
                    end
                    2'b10: begin
                        Arranged_Data[7:0] = Out_Data_2;
                        Arranged_Data[31:8] = 0;
                    end
                    2'b11: begin
                        Arranged_Data[7:0] = Out_Data_3;
                        Arranged_Data[31:8] = 0;
                    end
                endcase
            end
            2'b01: begin
                case (Address[1:0])
                    2'b00: begin
                        Arranged_Data[7:0] = Out_Data_0;
                        Arranged_Data[15:8] = Out_Data_1;
                        Arranged_Data[31:16] = 0;
                    end
                    2'b01: begin
                        Arranged_Data[7:0] = Out_Data_1;
                        Arranged_Data[15:8] = Out_Data_2;
                        Arranged_Data[31:16] = 0;
                    end
                    2'b10: begin
                        Arranged_Data[7:0] = Out_Data_2;
                        Arranged_Data[15:8] = Out_Data_3;
                        Arranged_Data[31:16] = 0;
                    end
                    2'b11: begin
                        Arranged_Data[7:0] = Out_Data_3;
                        Arranged_Data[15:8] = Out_Data_0;
                        Arranged_Data[31:16] = 0;
                    end
                endcase
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
        case (Operate_Mode)
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

    RAM_8x256_blk0 RAM_blk0 (
        .clka(clk),    // input wire clka
        .wea(Write_Enable_0),      // input wire [0 : 0] wea
        .addra(Address_0),  // input wire [7 : 0] addra
        .dina(In_Data_0),    // input wire [7 : 0] dina
        .douta(Out_Data_0)  // output wire [7 : 0] douta
    );
    RAM_8x256_blk1 RAM_blk1 (
        .clka(clk),    // input wire clka
        .wea(Write_Enable_1),      // input wire [0 : 0] wea
        .addra(Address_1),  // input wire [7 : 0] addra
        .dina(In_Data_1),    // input wire [7 : 0] dina
        .douta(Out_Data_1)  // output wire [7 : 0] douta
    );
    RAM_8x256_blk2 RAM_blk2 (
        .clka(clk),    // input wire clka
        .wea(Write_Enable_2),      // input wire [0 : 0] wea
        .addra(Address_2),  // input wire [7 : 0] addra
        .dina(In_Data_2),    // input wire [7 : 0] dina
        .douta(Out_Data_2)  // output wire [7 : 0] douta
    );
    RAM_8x256_blk3 RAM_blk3 (
        .clka(clk),    // input wire clka
        .wea(Write_Enable_3),      // input wire [0 : 0] wea
        .addra(Address_3),  // input wire [7 : 0] addra
        .dina(In_Data_3),    // input wire [7 : 0] dina
        .douta(Out_Data_3)  // output wire [7 : 0] douta
    );

endmodule

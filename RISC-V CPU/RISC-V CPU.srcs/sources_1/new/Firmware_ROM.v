`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/18 20:32:08
// Design Name: 
// Module Name: Firmware_ROM
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


module Firmware_ROM(
    input CLK,
    input Read_Enable,
    input Read_Unsigned,
    input [1:0] Data_Width,
    input [31:0] Address,
    output [31:0] Out_Data
    );

    wire [31:0] __Out_Data_1;
    wire [31:0] __Out_Data_2;
    reg [31:0] Arranged_Data;

    assign Out_Data = (Read_Enable && Address[31:16] == 16'h0000) ? Arranged_Data : 32'bz;

    always @(*) begin
        case (Data_Width)
            2'b00: begin
                case (Address[1:0])
                    2'b00: begin
                        Arranged_Data[7:0] = __Out_Data_1[7:0];
                    end
                    2'b01: begin
                        Arranged_Data[7:0] = __Out_Data_1[15:8];
                    end
                    2'b10: begin
                        Arranged_Data[7:0] = __Out_Data_1[23:16];
                    end
                    2'b11: begin
                        Arranged_Data[7:0] = __Out_Data_1[31:24];
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
                        Arranged_Data[7:0] = __Out_Data_1[7:0];
                        Arranged_Data[15:8] = __Out_Data_1[15:8];
                    end
                    2'b01: begin
                        Arranged_Data[7:0] = __Out_Data_1[15:8];
                        Arranged_Data[15:8] = __Out_Data_1[23:16];
                    end
                    2'b10: begin
                        Arranged_Data[7:0] = __Out_Data_1[23:16];
                        Arranged_Data[15:8] = __Out_Data_1[31:24];
                    end
                    2'b11: begin
                        Arranged_Data[7:0] = __Out_Data_1[31:24];
                        Arranged_Data[15:8] = __Out_Data_2[7:0];
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
                        Arranged_Data[7:0] = __Out_Data_1[7:0];
                        Arranged_Data[15:8] = __Out_Data_1[15:8];
                        Arranged_Data[23:16] = __Out_Data_1[23:16];
                        Arranged_Data[31:24] = __Out_Data_1[31:24];
                    end
                    2'b01: begin
                        Arranged_Data[7:0] = __Out_Data_1[15:8];
                        Arranged_Data[15:8] = __Out_Data_1[23:16];
                        Arranged_Data[23:16] = __Out_Data_1[31:24];
                        Arranged_Data[31:24] = __Out_Data_2[7:0];
                    end
                    2'b10: begin
                        Arranged_Data[7:0] = __Out_Data_1[23:16];
                        Arranged_Data[15:8] = __Out_Data_1[31:24];
                        Arranged_Data[23:16] = __Out_Data_2[7:0];
                        Arranged_Data[31:24] = __Out_Data_2[15:8];
                    end
                    2'b11: begin
                        Arranged_Data[7:0] = __Out_Data_1[31:24];
                        Arranged_Data[15:8] = __Out_Data_2[7:0];
                        Arranged_Data[23:16] = __Out_Data_2[15:8];
                        Arranged_Data[31:24] = __Out_Data_2[23:16];
                    end
                endcase
            end
            2'b11: begin
                case (Address[1:0])
                    2'b00: begin
                        Arranged_Data[7:0] = __Out_Data_1[7:0];
                        Arranged_Data[15:8] = __Out_Data_1[15:8];
                        Arranged_Data[23:16] = __Out_Data_1[23:16];
                        Arranged_Data[31:24] = __Out_Data_1[31:24];
                    end
                    2'b01: begin
                        Arranged_Data[7:0] = __Out_Data_1[15:8];
                        Arranged_Data[15:8] = __Out_Data_1[23:16];
                        Arranged_Data[23:16] = __Out_Data_1[31:24];
                        Arranged_Data[31:24] = __Out_Data_2[7:0];
                    end
                    2'b10: begin
                        Arranged_Data[7:0] = __Out_Data_1[23:16];
                        Arranged_Data[15:8] = __Out_Data_1[31:24];
                        Arranged_Data[23:16] = __Out_Data_2[7:0];
                        Arranged_Data[31:24] = __Out_Data_2[15:8];
                    end
                    2'b11: begin
                        Arranged_Data[7:0] = __Out_Data_1[31:24];
                        Arranged_Data[15:8] = __Out_Data_2[7:0];
                        Arranged_Data[23:16] = __Out_Data_2[15:8];
                        Arranged_Data[31:24] = __Out_Data_2[23:16];
                    end
                endcase
            end
        endcase
    end

    ROM_32x256 inst (
        .clka(CLK),    // input wire clka
        .addra(Address[9:2]),  // input wire [7 : 0] addra
        .douta(__Out_Data_1),  // output wire [31 : 0] douta
        .clkb(CLK),    // input wire clkb
        .addrb(Address[9:2] + 1),  // input wire [7 : 0] addrb
        .doutb(__Out_Data_2)  // output wire [31 : 0] doutb
    );

endmodule

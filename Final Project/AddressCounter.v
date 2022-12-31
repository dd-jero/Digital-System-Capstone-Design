`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/13 02:37:45
// Design Name: 
// Module Name: AddressCounter
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


module AddressCounter(ReadEn, Start, clk, rst_n, ReadReg1, ReadReg2, ReadReg3, WriteReg);
    input ReadEn, Start, clk, rst_n;
    output [3:0] ReadReg1, ReadReg2, ReadReg3, WriteReg;

    ReadAddressCounter #(.set1(14)) RAC_0 (.ReadEn(ReadEn), .clk(clk), .rst_n(rst_n), .ReadReg(ReadReg1));  // 3개의 ReadAddressCounter와
    ReadAddressCounter #(.set1(0)) RAC_1 (.ReadEn(ReadEn), .clk(clk), .rst_n(rst_n), .ReadReg(ReadReg2)); // 1개의 WriteAddressCounter를 연결
    ReadAddressCounter #(.set1(1)) RAC_2 (.ReadEn(ReadEn), .clk(clk), .rst_n(rst_n), .ReadReg(ReadReg3));
    WriteAddressCounter WAC (.Start(Start), .clk(clk), .rst_n(rst_n), .WriteReg(WriteReg));
endmodule

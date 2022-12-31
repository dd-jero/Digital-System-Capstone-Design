`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/02 03:17:38
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

    ReadAddressCounter RAC_0 (.ReadEn(ReadEn), .clk(clk), .rst_n(rst_n), .ReadReg(ReadReg1));  // 3개의 ReadAddressCounter와
    ReadAddressCounter_1 RAC_1 (.ReadEn(ReadEn), .clk(clk), .rst_n(rst_n), .ReadReg(ReadReg2)); // 1개의 WriteAddressCounter를 연결
    ReadAddressCounter_2 RAC_2 (.ReadEn(ReadEn), .clk(clk), .rst_n(rst_n), .ReadReg(ReadReg3));
    WriteAddressCounter WAC (.Start(Start), .clk(clk), .rst_n(rst_n), .WriteReg(WriteReg));

endmodule

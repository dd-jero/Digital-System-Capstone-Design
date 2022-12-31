`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/13 02:36:44
// Design Name: 
// Module Name: CNN_Single_Layer
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


module CNN_Single_Layer(clk, rst_n, Start, Image, Filter, ReadEn, ConvResult);
    parameter D = 4;
    parameter C = 10;
    parameter F = 4;
    parameter MO = 8;
    parameter RD = 8;
    parameter DIN = 10;
    input clk;
    input rst_n;
    input Start;
    input [D-1:0] Image;
    input signed [F-1:0] Filter;
    input ReadEn;
    output signed [C-1:0] ConvResult;

    wire signed [MO-1:0] MultValue; // Multiplicator의 output
    wire [3:0] WriteReg;
    wire signed [3:0] ReadReg1, ReadReg2, ReadReg3;
    wire signed  [RD-1:0] ReadData1, ReadData2, ReadData3; // RegisterFile의 output
    wire signed [DIN-1:0] d_in; // ADDER와 ReLU의 연결

    Multiplicator Multiplicator (.Start(Start), .din0(Image), .din1(Filter), .dout(MultValue));   
   
    AddressCounter AddressCounter (.clk(clk), .rst_n(rst_n), .Start(Start), .WriteReg(WriteReg), .ReadEn(ReadEn),
        .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .ReadReg3(ReadReg3));
    
    RegisterFile RegisterFile (.clk(clk), .rst_n(rst_n), .WriteEn(Start), .WriteReg(WriteReg), .WriteData(MultValue),
        .ReadEn(ReadEn), .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .ReadReg3(ReadReg3),
        .ReadData1(ReadData1), .ReadData2(ReadData2), .ReadData3(ReadData3));
    
    ADDER ADDER(.clk(clk), .rst_n(rst_n), .data1(ReadData1), .data2(ReadData2), .data3(ReadData3), .out(d_in)); 
    
    ReLU relu (.d_in(d_in), .d_out(ConvResult)); // ADDER와 ReLU module 연결 
endmodule

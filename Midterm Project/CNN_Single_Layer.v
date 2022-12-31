`timescale 1ns / 1ps

module CNN_Single_Layer(clk, rst_n, Start, Image, Filter, ReadEn, ConvResult);
    
    input clk;
    input rst_n;
    input Start;
    input [3:0] Image;
    input [3:0] Filter;
    input ReadEn;
    output [9:0] ConvResult;

    wire [7:0] MultValue;
    wire [3:0] WriteReg;
    wire [3:0] ReadReg1, ReadReg2, ReadReg3;
    wire [7:0] ReadData1, ReadData2, ReadData3;

    Multiplicator Multiplicator (.Start(Start), .din0(Image), .din1(Filter), .dout(MultValue));   
   
     AddressCounter AddressCounter (.clk(clk), .rst_n(rst_n), .Start(Start), .WriteReg(WriteReg), .ReadEn(ReadEn),
        .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .ReadReg3(ReadReg3));
    
    RegisterFile #(.M(4), .N(15), .W(8))
        RegisterFile (.clk(clk), .rst_n(rst_n), .WriteEn(Start), .WriteReg(WriteReg), .WriteData(MultValue),
        .ReadEn(ReadEn), .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .ReadReg3(ReadReg3),
        .ReadData1(ReadData1), .ReadData2(ReadData2), .ReadData3(ReadData3));
    
    ADDER ADDER(.clk(clk), .rst_n(rst_n), .data1(ReadData1), .data2(ReadData2), .data3(ReadData3), .out(ConvResult));
    
endmodule

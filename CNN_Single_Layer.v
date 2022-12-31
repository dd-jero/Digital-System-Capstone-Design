`timescale 1ns / 1ps

module CNN_Single_Layer(
clk, rst_n, Start, Image, Filter, ReadEn, ConvResult
    );
    
    
    input clk;
    input rst_n;
    input Start;
    input [3:0] Image;
    input [3:0] Filter;
    input ReadEn;
    output [9:0] ConvResult;

    wire [7:0] MultValue;
    
    wire [14:0] WriteRegCnt;
    wire [3:0] WriteReg;
    
    wire [14:0] ReadRegCnt1, ReadRegCnt2, ReadRegCnt3;
    wire [3:0] ReadReg1, ReadReg2, ReadReg3;
    wire [7:0] ReadData1, ReadData2, ReadData3;

    
    // ���� ���, ��� bit�� ����
    // MultValue = Image * Filter
    Multiplicator Multiplicator (.Start(Start), .din0(Image), .din1(Filter), .dout(MultValue));   // ���� ��� = Partial Sum (PSum)
   
   // Register File Read/Write �ּ� ��� 
   /*
    1. WriteReg : 0, 1, 2, ..., 14�� ���
    2. ReadReg1 : 0, 3, 6, 9, 12, 0, 3, ...�� ���
    3. ReadReg2 : 1, 4, 7, 10, 13, 1, 4, ...�� ���
    4. ReadReg3 : 2, 5, 8, 11, 14, 2, 5, ...�� ���
   */
     AddressCounter AddressCounter (.clk(clk), .rst_n(rst_n), .Start(Start), .WriteReg(WriteReg), .ReadEn(ReadEn),
        .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .ReadReg3(ReadReg3));
    
    // ������� ���� �� ���� Partial Sum���� �����ϱ� ���� Register File
    /*
    1.  Register File ���� (Write) ����     
        1) WriteReg : Partial Sum�� Register File�� ������ �� �ּҰ� 
        2) MultValue : Partial Sum�� Register File�� ������ �� ������ ��
        3) Start : Start = 1�� ���� Register File�� ������ ����
    
    2.  Register File �б� (Read) ����
        1) ReadReg1, ReadReg2, ReadReg3 : Register File���� �����͸� �о�� �� �ּҰ� (���ÿ� 3�� �����͸� �о��)
        2) ReadData1, ReadData2, ReadData3 : Register File���� �����͸� �о�� �� �������� �� (���ÿ� 3�� �����͸� �о��)
        3) ReadEn : ReadEn = 1�� ���� �����͸� �о��

    3.  Register File�� ����
        1) Number of address bits = 4
        2) Number of words = 15
        3) Number of bits in a word = 8
    */
    RegisterFile #(.M(4), .N(15), .W(8))
        RegisterFile (.clk(clk), .rst_n(rst_n), .WriteEn(Start), .WriteReg(WriteReg), .WriteData(MultValue),
        .ReadEn(ReadEn), .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .ReadReg3(ReadReg3),
        .ReadData1(ReadData1), .ReadData2(ReadData2), .ReadData3(ReadData3));
    
    // ���� ���, ��� bit�� ����
    // ConvResult = ReadData1 + ReadData2 + ReadData3
    ADDER ADDER(.clk(clk), .rst_n(rst_n), .data1(ReadData1), .data2(ReadData2), .data3(ReadData3), .out(ConvResult));
    
endmodule

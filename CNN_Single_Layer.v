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

    
    // 곱셈 계산, 출력 bit수 유의
    // MultValue = Image * Filter
    Multiplicator Multiplicator (.Start(Start), .din0(Image), .din1(Filter), .dout(MultValue));   // 곱셈 결과 = Partial Sum (PSum)
   
   // Register File Read/Write 주소 계산 
   /*
    1. WriteReg : 0, 1, 2, ..., 14를 출력
    2. ReadReg1 : 0, 3, 6, 9, 12, 0, 3, ...을 출력
    3. ReadReg2 : 1, 4, 7, 10, 13, 1, 4, ...을 출력
    4. ReadReg3 : 2, 5, 8, 11, 14, 2, 5, ...을 출력
   */
     AddressCounter AddressCounter (.clk(clk), .rst_n(rst_n), .Start(Start), .WriteReg(WriteReg), .ReadEn(ReadEn),
        .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .ReadReg3(ReadReg3));
    
    // 컨볼루션 연산 중 계산된 Partial Sum들을 저장하기 위한 Register File
    /*
    1.  Register File 쓰기 (Write) 동작     
        1) WriteReg : Partial Sum을 Register File에 저장할 때 주소값 
        2) MultValue : Partial Sum을 Register File에 저장할 때 저장할 값
        3) Start : Start = 1일 때만 Register File에 데이터 저장
    
    2.  Register File 읽기 (Read) 동작
        1) ReadReg1, ReadReg2, ReadReg3 : Register File에서 데이터를 읽어올 때 주소값 (동시에 3개 데이터를 읽어옴)
        2) ReadData1, ReadData2, ReadData3 : Register File에서 데이터를 읽어올 때 데이터의 값 (동시에 3개 데이터를 읽어옴)
        3) ReadEn : ReadEn = 1일 때만 데이터를 읽어옴

    3.  Register File의 스펙
        1) Number of address bits = 4
        2) Number of words = 15
        3) Number of bits in a word = 8
    */
    RegisterFile #(.M(4), .N(15), .W(8))
        RegisterFile (.clk(clk), .rst_n(rst_n), .WriteEn(Start), .WriteReg(WriteReg), .WriteData(MultValue),
        .ReadEn(ReadEn), .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .ReadReg3(ReadReg3),
        .ReadData1(ReadData1), .ReadData2(ReadData2), .ReadData3(ReadData3));
    
    // 덧셈 계산, 출력 bit수 유의
    // ConvResult = ReadData1 + ReadData2 + ReadData3
    ADDER ADDER(.clk(clk), .rst_n(rst_n), .data1(ReadData1), .data2(ReadData2), .data3(ReadData3), .out(ConvResult));
    
endmodule

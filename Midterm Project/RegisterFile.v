`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/02 18:50:28
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(ReadEn, ReadReg1, ReadReg2, ReadReg3, WriteData, WriteEn, WriteReg, clk, rst_n,
ReadData1, ReadData2, ReadData3);

    parameter M = 4; // number of address bits
    parameter N = 15; // number of words
    parameter W = 8; // number of bits in a word
     
    input ReadEn, WriteEn, clk, rst_n;
    input [M-1:0] ReadReg1, ReadReg2, ReadReg3;
    input [M-1:0] WriteReg;
    input [W-1:0] WriteData;
    output reg [W-1:0] ReadData1, ReadData2, ReadData3;
    
    integer i; // for문을 위한 변수를 integer로 선언
    reg [W-1:0] reg_file [0:N-1]; // Register file을 reg 타입 선언
    
    always@(posedge clk or negedge rst_n) begin // 출력에 따라 always문을 구문하여 작성
        if(!rst_n) begin  // reset 시
            for ( i = 0; i < N; i=i+1) begin // 0 ~ 단어 수 범위 for문 이용
                reg_file[i] <= {W{1'b0}};    // reg_file의 words 초기화 
            end 
        end
    end
    
    always@(posedge clk) begin
        if(WriteEn) reg_file[WriteReg] <= WriteData; // WriteEn = 1 이면 WriteReg 주소에 WriteData 입력
    end
    
    always@(posedge clk) begin
        if(ReadEn) begin // ReadEm = 1 이면
            ReadData1 <= reg_file[ReadReg1];  // ReadReg1 주소에 해당하는 데이터를 ReadData1에 입력
            ReadData2 <= reg_file[ReadReg2];  // ReadReg2 주소에 해당하는 데이터를 ReadData2에 입력
            ReadData3 <= reg_file[ReadReg3];  // ReadReg3 주소에 해당하는 데이터를 ReadData3에 입력
        end
    end

endmodule

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
    
    integer i; // for���� ���� ������ integer�� ����
    reg [W-1:0] reg_file [0:N-1]; // Register file�� reg Ÿ�� ����
    
    always@(posedge clk or negedge rst_n) begin // ��¿� ���� always���� �����Ͽ� �ۼ�
        if(!rst_n) begin  // reset ��
            for ( i = 0; i < N; i=i+1) begin // 0 ~ �ܾ� �� ���� for�� �̿�
                reg_file[i] <= {W{1'b0}};    // reg_file�� words �ʱ�ȭ 
            end 
        end
    end
    
    always@(posedge clk) begin
        if(WriteEn) reg_file[WriteReg] <= WriteData; // WriteEn = 1 �̸� WriteReg �ּҿ� WriteData �Է�
    end
    
    always@(posedge clk) begin
        if(ReadEn) begin // ReadEm = 1 �̸�
            ReadData1 <= reg_file[ReadReg1];  // ReadReg1 �ּҿ� �ش��ϴ� �����͸� ReadData1�� �Է�
            ReadData2 <= reg_file[ReadReg2];  // ReadReg2 �ּҿ� �ش��ϴ� �����͸� ReadData2�� �Է�
            ReadData3 <= reg_file[ReadReg3];  // ReadReg3 �ּҿ� �ش��ϴ� �����͸� ReadData3�� �Է�
        end
    end

endmodule

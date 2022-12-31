`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 03:31:19
// Design Name: 
// Module Name: RingCounterX3_1
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


module RingCounterX3_1(en, clk, rst_n, count);
    input en, clk, rst_n;
    output reg [14:0] count;
    
    always@(posedge clk) begin
        if(!rst_n) begin // reset ��
            count <= 15'b000_0000_0000_0001; // count �ʱ�ȭ
        end
        else begin // reset ���� ��
            if(en) begin // en = 1 �̸�
                count[3] <= count[0]; // RingCounter ����
                count[6] <= count[3]; // �ʱ� 1�� ��ġ�� count[0]����
                count[9] <= count[6]; // 1�� �������� 3bit�� �̵� �ݺ�
                count[12] <= count[9];
                count[0] <= count[12];  
            end
        end
    end
endmodule

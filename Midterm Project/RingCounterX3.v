`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 02:38:10
// Design Name: 
// Module Name: RingCounterX3
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


module RingCounterX3(en, clk, rst_n, count);

    input en, clk, rst_n;
    output reg [14:0] count;

    always@(posedge clk) begin
        if(!rst_n) begin // reset �� 
            count <= 15'b100_0000_0000_0000; // count �ʱ�ȭ 
        end
        else begin // reset ���� �� 
            if(en) begin // en = 1 �̸� 
                count[2] <= count [14]; // Ringcounter ���� 
                count[5] <= count[2];   // �ʱ� 1�� ��ġ�� count[14]�� 
                count[8] <= count[5];   // 1�� �������� 3bit�� �̵� �ݺ�
                count[11] <= count[8];  
                count[14] <= count[11];      
            end
        end
    end
endmodule

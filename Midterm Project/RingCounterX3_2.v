`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 03:33:00
// Design Name: 
// Module Name: RingCounterX3_2
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


module RingCounterX3_2(en, clk, rst_n, count);
    input en, clk, rst_n;
    output reg [14:0] count;
 
    
    always@(posedge clk) begin
        if(!rst_n) begin // reset ��
            count <= 15'b000_0000_0000_0010; // count �ʱ�ȭ
        end
        else begin // reset �ƴ� ��
            if(en) begin // en = 1 �̸� 
                count[4] <= count[1];  // RingCounter ����
                count[7] <= count[4];  // �ʱ� 1�� ��ġ�� count[1]��
                count[10] <= count[7]; // 1�� �������� �̵��� �ݺ�
                count[13] <= count[10];
                count[1] <= count[13];
            end
        end
    end
endmodule

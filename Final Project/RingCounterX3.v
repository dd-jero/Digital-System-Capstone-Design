`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/13 01:53:55
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

    parameter set2 = 14;
    parameter W = 15;
    input en, clk, rst_n;
    output reg [W-1:0] count;
    
    always@(posedge clk) begin
    
        if(!rst_n) count <= (1 << set2); // count �ʱ�ȭ

        else begin // reset ���� �� RingCounter ����
            if(en) count <= {count[11:0],count[14:12]}; // concatenation�� shift �̿��Ͽ� ���� 3bit �̵�
        end
    end
endmodule

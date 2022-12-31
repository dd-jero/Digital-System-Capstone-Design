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
        if(!rst_n) begin // reset 시
            count <= 15'b000_0000_0000_0010; // count 초기화
        end
        else begin // reset 아닐 시
            if(en) begin // en = 1 이면 
                count[4] <= count[1];  // RingCounter 진행
                count[7] <= count[4];  // 초기 1의 위치는 count[1]로
                count[10] <= count[7]; // 1이 좌측으로 이동을 반복
                count[13] <= count[10];
                count[1] <= count[13];
            end
        end
    end
endmodule

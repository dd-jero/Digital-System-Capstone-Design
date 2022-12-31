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
        if(!rst_n) begin // reset 시
            count <= 15'b000_0000_0000_0001; // count 초기화
        end
        else begin // reset 안할 시
            if(en) begin // en = 1 이면
                count[3] <= count[0]; // RingCounter 진행
                count[6] <= count[3]; // 초기 1의 위치는 count[0]으로
                count[9] <= count[6]; // 1이 좌측으로 3bit씩 이동 반복
                count[12] <= count[9];
                count[0] <= count[12];  
            end
        end
    end
endmodule

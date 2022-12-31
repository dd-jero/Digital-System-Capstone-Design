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
        if(!rst_n) begin // reset 시 
            count <= 15'b100_0000_0000_0000; // count 초기화 
        end
        else begin // reset 안할 시 
            if(en) begin // en = 1 이면 
                count[2] <= count [14]; // Ringcounter 진행 
                count[5] <= count[2];   // 초기 1의 위치는 count[14]로 
                count[8] <= count[5];   // 1이 좌측으로 3bit씩 이동 반복
                count[11] <= count[8];  
                count[14] <= count[11];      
            end
        end
    end
endmodule

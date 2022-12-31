`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/02 03:25:08
// Design Name: 
// Module Name: RingCounter
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


module RingCounter(en, clk, rst_n, count);

    input en, clk, rst_n;
    output reg [14:0] count;
    
    always@(posedge clk) begin
        if(!rst_n) begin  // reset 시
            count <= 15'b100_0000_0000_0000; // count 초기화
        end
        else begin // reset 아닐 시
            if(en) begin // en = 1 이면 
                count[0] <= count[14]; //  RingCounter 진행
                count[1] <= count[0];  // 초기의 1의 위치는 counter[14]로
                count[2] <= count[1];  // 1이 1bit씩 이동 반복
                count[3] <= count[2];
                count[4] <= count[3];
                count[5] <= count[4];
                count[6] <= count[5];
                count[7] <= count[6];
                count[8] <= count[7];
                count[9] <= count[8];
                count[10] <= count[9];
                count[11] <= count[10];
                count[12] <= count[11];
                count[13] <= count[12];
                count[14] <= count[13];
            end
        end
    end
endmodule

 
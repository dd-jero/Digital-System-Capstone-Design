`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/13 00:52:04
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
    parameter W = 15;
    input en, clk, rst_n;
    output reg [W-1:0] count;

    always@(posedge clk) begin
    
        if(!rst_n)  count <= {1, {W-1{1'b0}}}; // count �ʱ�ȭ 
      
        else begin // reset ���� �� 
            if(en)  count <= {count[W-2:0], count[W-1]}; // concatenation �̿�, 1�� �������� 1bit�� �̵�
        end
    end

endmodule

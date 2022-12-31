`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/13 02:35:50
// Design Name: 
// Module Name: ADDER
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


module ADDER(clk, data1, data2, data3, rst_n, out);
    parameter SD = 8;
    parameter SO = 10;
    input clk, rst_n;
    input signed [SD-1:0] data1, data2, data3;
    output reg signed [SO-1:0] out;
    
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) out <=0; // reset �� out �ʱ�ȭ 
        else out <= data1 + data2 + data3; // reset �� �ƴ� �� ���� ���� out�� �Է�
    end
    
endmodule

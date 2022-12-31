`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/02 20:32:12
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
    input clk, rst_n;
    input [7:0] data1, data2, data3;
    output reg [9:0] out;
    
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) out <=0; // reset �� out �ʱ�ȭ 
        else out <= data1 + data2 + data3; // reset �� �ƴ� �� ���� ���� out�� �Է�
    end
endmodule

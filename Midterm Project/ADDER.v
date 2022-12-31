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
        if(!rst_n) out <=0; // reset 시 out 초기화 
        else out <= data1 + data2 + data3; // reset 이 아닐 시 더한 값을 out에 입력
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/02 03:00:57
// Design Name: 
// Module Name: Multiplicator
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


module Multiplicator(Start, din0, din1, dout);

    input Start;
    input [3:0] din0, din1;
    output reg [7:0] dout;

    always@(*) begin
        if(Start) dout = (din0 * din1); // Start = 1 이면 Image * Fliter
        else dout = 0; // Latch 발생을 막기 위해 
    end
endmodule

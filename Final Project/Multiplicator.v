`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/13 02:34:05
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
    parameter DI = 4;
    parameter DO = 8;
    input Start;
    input [DI-1:0] din0;
    input signed  [DI-1:0] din1;
    output signed [DO-1:0] dout;

assign dout = Start ? $signed({1'b0,din0}) * $signed(din1) : 0;

endmodule

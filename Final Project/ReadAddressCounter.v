`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/13 01:40:38
// Design Name: 
// Module Name: ReadAddressCounter
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


module ReadAddressCounter(ReadEn, clk, rst_n, ReadReg);

    parameter set1 = 14;
    input ReadEn, clk, rst_n;
    output [3:0] ReadReg;
    wire [14:0] count;

    // parameter를 이용하여 각각의 RingCounter를 이용한 ReadAddressCounter 
    RingCounterX3 #(.set2(set1)) RCX3 (.en(ReadEn), .clk(clk), .rst_n(rst_n), .count(count));
    AddressEncoder ReadAddress (.AddrIn(count), .AddrOut(ReadReg));
endmodule

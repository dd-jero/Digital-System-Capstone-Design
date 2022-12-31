`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 03:29:01
// Design Name: 
// Module Name: ReadAddressCounter_2
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


module ReadAddressCounter_2(ReadEn, clk, rst_n, ReadReg);
    input ReadEn, clk, rst_n;
    output [3:0] ReadReg;
    
    wire [14:0] count;
    
    RingCounterX3_2 RC_3 (.en(ReadEn), .clk(clk), .rst_n(rst_n), .count(count));
    AddressEncoder ReadAddress (.AddrIn(count), .AddrOut(ReadReg));
endmodule

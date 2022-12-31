`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/13 02:31:16
// Design Name: 
// Module Name: WriteAddressCounter
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


module WriteAddressCounter(Start, clk, rst_n, WriteReg);

    input Start, clk, rst_n;
    output [3:0] WriteReg;
    
    wire [14:0] count;
    
    RingCounter WC(.en(Start), .clk(clk), .rst_n(rst_n), .count(count));
    AddressEncoder WriteAddress (.AddrIn(count), .AddrOut(WriteReg));
endmodule

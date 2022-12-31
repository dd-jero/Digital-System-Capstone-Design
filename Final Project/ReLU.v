`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/13 03:08:18
// Design Name: 
// Module Name: ReLU
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


module ReLU(d_in, d_out);
    parameter di = 10;
    parameter do = 10;
    input signed [di-1:0] d_in;
    output [do-1:0] d_out;
    
    assign d_out = (d_in[di-1] == 0) ? d_in : 0;
endmodule

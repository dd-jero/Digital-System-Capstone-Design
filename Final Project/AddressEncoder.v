`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/13 01:37:22
// Design Name: 
// Module Name: AddressEncoder
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


module AddressEncoder(AddrIn, AddrOut);

    input [14:0] AddrIn;
    output reg [3:0] AddrOut;
    
    always@(*) begin
        case(AddrIn)  // case문을 이용하여 병렬적으로 AddrOut 설정
            15'b100_0000_0000_0000: AddrOut = 4'd0;
            15'b000_0000_0000_0001: AddrOut = 4'd1;
            15'b000_0000_0000_0010: AddrOut = 4'd2;
            15'b000_0000_0000_0100: AddrOut = 4'd3;
            15'b000_0000_0000_1000: AddrOut = 4'd4;
            15'b000_0000_0001_0000: AddrOut = 4'd5;
            15'b000_0000_0010_0000: AddrOut = 4'd6;
            15'b000_0000_0100_0000: AddrOut = 4'd7;
            15'b000_0000_1000_0000: AddrOut = 4'd8;
            15'b000_0001_0000_0000: AddrOut = 4'd9;
            15'b000_0010_0000_0000: AddrOut = 4'd10;
            15'b000_0100_0000_0000: AddrOut = 4'd11;
            15'b000_1000_0000_0000: AddrOut = 4'd12;
            15'b001_0000_0000_0000: AddrOut = 4'd13;
            15'b010_0000_0000_0000: AddrOut = 4'd14;
            default: AddrOut = 4'd0; // AddrIn의 모든 경우가 작성되지 않아 default 설정
         endcase
    end
endmodule

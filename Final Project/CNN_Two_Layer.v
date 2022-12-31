`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/02 10:48:20
// Design Name: 
// Module Name: CNN_Two_Layer
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


module CNN_Two_Layer(clk, rst_n, Start1, Image, Filter1, ReadEn1, Start2, Filter2, ReadEn2, ConvResult);
    input clk;
    input rst_n;
    // Layer 1 input signals
    input Start1;
    input [3:0] Image;
    input signed [3:0] Filter1;
    input ReadEn1;
    // Layer 2 input signals
    input Start2;
    input signed [9:0] Filter2;
    input ReadEn2;
    // Layer 2 output signal
    output signed [21:0] ConvResult;
    
    wire [9:0] ConvResult1; // layer1의 결과 
    
    defparam layer1.D = 4, layer1.C = 10, layer1.F = 4, layer2.D = 10, layer2.C = 22, layer2.F = 10, // Image, Filter, result
    layer1.MO = 8, layer2.MO = 20, layer1.RD = 8, layer2.RD = 20, layer1.DIN = 10, layer2.DIN = 22, // 각 layer 속에서 연결되는 wire
    layer1.Multiplicator.DI = 4, layer1.Multiplicator.DO = 8, layer2.Multiplicator.DI = 10, layer2.Multiplicator.DO = 20, // Miltiplicator
    layer1.RegisterFile.W = 8, layer2.RegisterFile.W = 20, // RegisteFile
    layer1.ADDER.SD = 8, layer1.ADDER.SO = 10, layer2.ADDER.SD = 20, layer2.ADDER.SO = 22, // ADDER
    layer1.relu.di = 10, layer1.relu.do = 10, layer2.relu.di = 22, layer2.relu.do = 22; // ReLU 
  
    CNN_Single_Layer layer1  (.clk(clk), .rst_n(rst_n), .Start(Start1), .Image(Image), .Filter(Filter1), .ReadEn(ReadEn1), .ConvResult(ConvResult1));
    CNN_Single_Layer layer2 (.clk(clk), .rst_n(rst_n), .Start(Start2), .Image(ConvResult1), .Filter(Filter2), .ReadEn(ReadEn2), .ConvResult(ConvResult));

endmodule

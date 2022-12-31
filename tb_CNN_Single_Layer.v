`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/14 23:59:12
// Design Name: 
// Module Name: tb_CNN_Single_Layer
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


module tb_CNN_Single_Layer(

    );
    
    reg clk;
    reg rst_n;
    reg Start;
    reg [3:0] Image;
    reg [3:0] Filter;
    reg ReadEn;
    wire [9:0] ConvResult;
    
    initial begin
    clk = 0; rst_n = 1; Start = 0;  ReadEn = 0;  Image = 0; Filter = 0;   
    #10; rst_n = 0;
    #10; rst_n = 1;
        // Convolution Operation Start  
   #10; Image = 4'd1;     Filter = 4'd1;  Start = 1;
   #10; Image = 4'd2;     Filter = 4'd2;
   #10; Image = 4'd3;     Filter = 4'd3;
                                 
   #10; Image = 4'd2;     Filter = 4'd1;
   #10; Image = 4'd3;     Filter = 4'd2;
   #10; Image = 4'd4;     Filter = 4'd3;
                                 
   #10; Image = 4'd3;     Filter = 4'd1;
   #10; Image = 4'd4;     Filter = 4'd2;
   #10; Image = 4'd5;     Filter = 4'd3;
                                 
   #10; Image = 4'd4;     Filter = 4'd1;
   #10; Image = 4'd5;     Filter = 4'd2;
   #10; Image = 4'd6;     Filter = 4'd3;
                                 
   #10; Image = 4'd5;     Filter = 4'd1;
   #10; Image = 4'd6;     Filter = 4'd2;
   #10; Image = 4'd7;     Filter = 4'd3;
   
    // Convolution Operation Finish
   #10; Image = 4'd0;     Filter = 4'd0;  Start = 0;
   #10; ReadEn = 1;
   #70; $finish;
    end
    
    always #5 clk = ~clk;
    
    CNN_Single_Layer uut(
    .clk(clk),
    .rst_n(rst_n),
    .Start(Start),
    .Image(Image),
    .Filter(Filter),
    .ReadEn(ReadEn),
    .ConvResult(ConvResult)
    );

endmodule

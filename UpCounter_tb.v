`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/29 14:51:50
// Design Name: 
// Module Name: UpCounter_tb
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


module UpCounter_tb;
reg clk, reset;
wire [0:11] count;

UpCounter uut2(.clk(clk),.reset(reset),.count(count));

always 
begin
    #1 clk = ~clk;
end

initial begin
    clk = 0;
    #10 reset = 1;
    #10 reset = 0;
    #500
    #100 reset = 1;
    #100 reset = 0;
    #1000
    $stop;


end
endmodule

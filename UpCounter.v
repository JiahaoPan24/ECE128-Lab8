`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/29 14:00:46
// Design Name: 
// Module Name: UpCounter
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


module UpCounter(input clk, reset, output reg [0:11] count);

wire out_clk;

clk_divider uut1(clk,out_clk);

always @(posedge out_clk)
begin
    if(count == 12'b111111111111 || reset)
        count = 12'b000000000000;
    else
        count = count + 1;
end
endmodule

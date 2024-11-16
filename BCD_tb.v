`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/29 14:50:57
// Design Name: 
// Module Name: BCD_tb
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


module BCD_tb;
reg clk;
reg en;
reg [11:0] bin_d_in;
wire [15:0] bcd_d_out;
wire rdy;

BCD uut3(.clk(clk),.en(en),.bin_d_in(bin_d_in),.bcd_d_out(bcd_d_out),.rdy(rdy));

always 
begin
    #1 clk = ~clk;
end

initial begin
    clk = 0;
    #10 en = 1;
     bin_d_in = 12'b000000001111;
     #200 en = 0;
     #100
    $stop;


end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/15 20:15:24
// Design Name: 
// Module Name: Final_Module_tb
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


module Final_Module_tb();
reg clk;
reg reset;
reg en;
wire [3:0] sseg_a_o;
wire [6:0] sseg_c_o;
Final_Module uut(clk,reset,en,sseg_a_o,sseg_c_o);

always 
begin
    #1 clk = ~clk;
end

initial begin
    clk = 0;
    reset = 0;
    en = 1;
    #500 
    reset = 1;
    #100
    $stop;


end
endmodule
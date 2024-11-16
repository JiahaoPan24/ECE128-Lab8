`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/12 14:06:52
// Design Name: 
// Module Name: Final_Module
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


module Final_Module(
    input clk,
    input reset,
    input en,
    output [3:0] sseg_a_o,
    output [6:0] sseg_c_o
    );
    wire [0:11] count;
    wire [15:0] bcd_d_out;
    reg [15:0] bcd_in;
    wire rdy;
    
    UpCounter uut1(clk, reset, count);
    BCD uut2(clk, en, count, bcd_d_out, rdy);
    multi_display uut3(clk,bcd_in, sseg_a_o, sseg_c_o);
    
    always @(posedge clk)
     begin
        if(rdy)
            bcd_in <= bcd_d_out;
     end 
endmodule

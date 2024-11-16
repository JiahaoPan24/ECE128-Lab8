`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/12 14:12:50
// Design Name: 
// Module Name: Seven_Decoder
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


module Seven_Decoder(clk, bcd, seg); 
input clk; 
input [3:0] bcd; 
output reg[6:0] seg;

always @(posedge clk)    
begin        
case (bcd) //case statement                   
    0 : seg = 7'b1000000;
    1 : seg = 7'b1111001;
    2 : seg = 7'b0100100;
    3 : seg = 7'b0110000;
    4 : seg = 7'b0011001;
    5 : seg = 7'b0010010;
    6 : seg = 7'b0000010;
    7 : seg = 7'b1111000;
    8 : seg = 7'b0000000;
    9 : seg = 7'b0010000;
default : seg = 7'b1111111;   
                  
endcase               
end                
endmodule


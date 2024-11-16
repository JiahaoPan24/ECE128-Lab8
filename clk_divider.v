`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/29 14:08:15
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(clock_in,clock_out);

input clock_in; 
output reg clock_out = 1'b0; 

reg[7:0] counter=8'd0;

    always @(posedge clock_in) 
    begin
        counter <= counter + 1;
        if (counter == 8'b111) begin
            clock_out <= ~clock_out;
            counter <= 0;
            end
        end
  endmodule

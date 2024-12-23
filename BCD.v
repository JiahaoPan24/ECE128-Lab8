`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/29 14:48:12
// Design Name: 
// Module Name: BCD
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


module BCD(
    input clk,
    input en,
    input [11:0] bin_d_in,
    output [15:0] bcd_d_out,
    output rdy
);
parameter IDLE = 3'b000;
parameter SETUP = 3'b001;
parameter ADD = 3'b010;
parameter SHIFT = 3'b011;
parameter DONE = 3'b100;
reg [3:0] sh_counter = 0;
reg [1:0] add_counter;
reg [11:0] bin_data = 0;
reg [27:0] bcd_data;
reg busy;
reg [2:0] state;
reg result_rdy;

always @(posedge clk)
        begin
        if(en)
            begin
                if(~busy)
                    begin
                    bcd_data <= {16'b0, bin_d_in};
                    state <= SETUP;
                    end
            end
        
        case(state)
        
            IDLE:
                begin
                    result_rdy  <= 0;
                    busy <= 0;
                end
                
            SETUP:
                begin
                busy <= 1;
                add_counter <= 0;
                state <= ADD;
                end
                    
            ADD:
                begin
				//please check the confition for each BCD and add 3 if needed
				 case(add_counter)
                    0:
                        begin
                        if(bcd_data[15:12] > 4)
                                bcd_data[27:12] <= bcd_data[27:12] + 3;
                        add_counter <= add_counter + 1;
                        end
                    1:
                        begin
                        if(bcd_data[19:16] > 4)
                                bcd_data[27:16] <= bcd_data[27:16] + 3;
                        add_counter <= add_counter + 1;
                        end
                    2:
                        begin
                        if((add_counter == 2) && (bcd_data[23:20] > 4))
                                bcd_data[27:20] <= bcd_data[27:20] + 3;
                        add_counter <= add_counter + 1;
                        end
                    3:
                        begin
                        if((add_counter == 3) && (bcd_data[27:24] > 4))
                                bcd_data[27:24] <= bcd_data[27:24] + 3;
                                add_counter <= 0;
                                state   <= SHIFT;
                        end
                    endcase
                end
            SHIFT:
                begin
                sh_counter  <= sh_counter + 1;
                bcd_data    <= bcd_data << 1;
                
                if(sh_counter == 11)
                    begin
                    sh_counter  <= 0;
                    state       <= DONE;
                    end
                else
                    begin
                    state   <= ADD;
                    end

                end
 
            
            DONE:
                begin
				//result_rdy should be and next state should be IDLE
                result_rdy  <= 1;
                state <= IDLE;
                end
            default:
                begin
                state <= IDLE;
                end
            
            endcase
            
        end
		//Final output declaration and it will be bcd_data[27:12] and rdy will b1 
        assign rdy = result_rdy;
        assign bcd_d_out = bcd_data[27:12];
endmodule


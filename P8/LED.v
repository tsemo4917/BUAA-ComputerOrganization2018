`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:50:11 12/23/2018 
// Design Name: 
// Module Name:    LED 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module LED(
    input           clk,
    input           reset, 
    input [31:0]    din,
    input           WE,
    // output
    output reg [31:0] led_light,
    output [31:0]   RD
    );
    
    assign RD = led_light;
    
    initial begin
        led_light <= 0;
    end
    
    always @(posedge clk) begin
        if (reset) begin
            led_light <= 0;
        end
        else if (WE) begin
            led_light <= din;
        end 
//        else begin
//            led_light <= 0;
//        end
    end


endmodule

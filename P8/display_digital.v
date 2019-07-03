`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:09:25 12/24/2018 
// Design Name: 
// Module Name:    display_digital 
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
`include "head_def.v"
module display_digital(
    input [3:0] din,
    input       reset,
    output [7:0] dout
    );
    
    assign dout =   reset           ? `ZERO :
                    (din === 4'hF)  ? `FH   :
                    (din === 4'hE)  ? `EH   :
                    (din === 4'hD)  ? `DH   :
                    (din === 4'hC)  ? `CH   :
                    (din === 4'hB)  ? `BH   :
                    (din === 4'hA)  ? `AH   :
                    (din === 4'h9)  ? `NINE :
                    (din === 4'h8)  ? `EIGHT:
                    (din === 4'h7)  ? `SEVEN:
                    (din === 4'h6)  ? `SIX  :
                    (din === 4'h5)  ? `FIVE :
                    (din === 4'h4)  ? `FOUR :
                    (din === 4'h3)  ? `THREE:
                    (din === 4'h2)  ? `TWO  :
                    (din === 4'h1)  ? `ONE  :
                                      `ZERO ;


endmodule

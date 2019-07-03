`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:52:39 12/23/2018 
// Design Name: 
// Module Name:    user_key 
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
module user_key(
    input [7:0]     user_key,
    // output
    output [31:0]   RD
    );
        
    assign RD = {24'b0, ~user_key};


endmodule

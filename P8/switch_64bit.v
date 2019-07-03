`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:35:32 12/23/2018 
// Design Name: 
// Module Name:    switch_64bit 
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
module switch_64bit(
    input           reset,
    input           addr,
    input [7:0]     dip_switch0,
    input [7:0]     dip_switch1,
    input [7:0]     dip_switch2,
    input [7:0]     dip_switch3,
    input [7:0]     dip_switch4,
    input [7:0]     dip_switch5,
    input [7:0]     dip_switch6,
    input [7:0]     dip_switch7,
    // output
    output [31:0]   RD
    );
    
    assign RD = reset   ?   0 :
                addr    ?   ~{dip_switch3, dip_switch2, dip_switch1, dip_switch0} :
                            ~{dip_switch7, dip_switch6, dip_switch5, dip_switch4} ;


endmodule

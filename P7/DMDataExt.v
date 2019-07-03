`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:00:31 12/05/2018 
// Design Name: 
// Module Name:    DMDataExt 
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
//`define lb  3'b000
//`define lbu 3'b001
//`define lh  3'b010
//`define lhu 3'b011
//`define lw  3'b100
module DMDataEXT(
    input [31:0]    DMData,
    input [2:0]     loadType,
    input [1:0]     addr,
    // output 
    output [31:0]   ext32
    );

    wire [7:0] ByteS [3:0];
    wire [15:0] HalfWord [1:0];
    assign {ByteS[3], ByteS[2], ByteS[1], ByteS[0]} = DMData;
    assign {HalfWord[1], HalfWord[0]} = DMData;

    assign ext32 =  loadType == 3'b000  ?   { { 24{ ByteS[addr][7] } }, ByteS[addr]} :
                    loadType == 3'b001  ?   { 24'b0, ByteS[addr]} :
                    loadType == 3'b010  ?   { { 16{ HalfWord[ addr[1] ][15] } }, HalfWord[ addr[1] ]} :
                    loadType == 3'b011  ?   { 16'b0, HalfWord[ addr[1] ]} :
                    loadType == 3'b100  ?   DMData :
                                            32'bx ;

    /*
    assign ext32 =  loadType == `lb     ?   (
                                            addr == 2'b00 ?     { { 24{DMData[7]} }, DMData[7:0]} :
                                            addr == 2'b01 ?     { { 24{DMData[15]} }, DMData[15:8]} :
                                            addr == 2'b10 ?     { { 24{DMData[23]} }, DMData[23:16]} :
                                                                { { 24{DMData[31]} }, DMData[31:24]}
                                        ) :
                                        
                    loadType == `lbu    ?   (
                                            addr == 2'b00 ?     {24'b0, DMData[7:0]} :
                                            addr == 2'b01 ?     {24'b0, DMData[15:8]} :
                                            addr == 2'b10 ?     {24'b0, DMData[23:16]} :
                                                                {24'b0, DMData[31:24]}
                                        ) :
                                        
                    loadType == `lh     ?   (
                                            addr[1] == 1'b0 ?   { { 16{DMData[15]} }, DMData[15:0]} :
                                                                { { 16{DMData[31]} }, DMData[31:16]}
                                        ) :
                                        
                    loadType == `lhu    ?   (
                                            addr[1] == 1'b0 ?   {16'b0, DMData[15:0]} :
                                                                {16'b0, DMData[31:16]}
                                        ) :
                                        
                    loadType == `lw     ?   DMData :
                                            32'bx ;*/

endmodule

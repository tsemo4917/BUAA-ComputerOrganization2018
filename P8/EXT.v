`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:22:04 11/17/2018 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
    input [15:0]    imm16,
    input [1:0]     ExtOp,
    // output
    output [31:0]   imm32
    );
    
    assign imm32 = ExtOp == 2'b00 ? {16'b0, imm16} :                    // zero
                   ExtOp == 2'b01 ? { { 16{imm16[15]} }, imm16} :       // signed
                   ExtOp == 2'b10 ? {imm16, 16'b0} :                    // low zero
                                    0 ;

endmodule

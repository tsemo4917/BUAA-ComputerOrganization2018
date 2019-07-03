`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:58:08 11/17/2018 
// Design Name: 
// Module Name:    PC 
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
module NPC(
    input [31:0] pc4,
    input [25:0] imm26,
    input [31:0] Reg32,
    input [2:0] nPC_sel,
    input [2:0] CMPrst,
    // output
    output [31:0] nextPC
    );
        
    wire [31:0] imm32;
    
    assign imm32 = { { 14{imm26[15]} }, imm26[15:0], 2'b00};
    
    assign equal = CMPrst[0];
    
    assign nextPC = nPC_sel == 3'b000 ?     Reg32 :
                    nPC_sel == 3'b001 ?     {pc4[31:28], imm26, 2'b00} :        // jump26 = jal || j
                    nPC_sel == 3'b010 ?     pc4 + (equal ? imm32 : 4) :         // beq
                                            0 ;

endmodule

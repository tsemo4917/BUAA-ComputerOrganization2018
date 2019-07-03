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
    input [31:0] pc,
    input [25:0] imm26,
    input [31:0] Reg32,
    input [2:0] nPC_sel,
    input zero,
    // output
    output [31:0] nextPC,
    output [31:0] pc4
    );
    
    assign pc4 = pc + 4;
    
    wire [31:0] ext32;
    
    assign ext32 = { { 16{imm26[15]} }, imm26[15:0]};
    
    assign nextPC = nPC_sel == 3'b000 ?                 pc4 :                   
                    nPC_sel == 3'b001 ?                 {pc[31:28], imm26, 2'b00} :     // jump26 = jal || j
                    nPC_sel == 3'b010 ?                 Reg32 :                         // jumpReg = jr || jalr
                    (nPC_sel == 3'b011 && zero) ?       pc4 + {ext32[29:0], 2'b00} :    // beq
                                                        pc4 ;
    
    /*
    assign nextPC = jumpReg ?       Reg32 : 
                    jump26 ?        {pc[31:28], imm26, 2'b00} :
                    (zero && beq) ? pc4 + {ext32[29:0], 2'b00} :
                                    pc4 ;
    */

endmodule

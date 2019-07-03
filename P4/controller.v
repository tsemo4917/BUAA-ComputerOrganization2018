`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:55:18 11/16/2018 
// Design Name: 
// Module Name:    controller 
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
// addu, subu, ori, lw, sw, beq, lui, jal, jr, nop
module controller(
    input [5:0] Op,
    input [5:0] func,
    // output
    output [1:0] RegDst,
    output ALU_Asrc,
    output ALU_Bsrc,
    output Mem2Reg,
    output RegWrite,
    output MemWrite,
    output LinkPC,
    output [2:0] nPC_sel,
    output [1:0] ExtOp,
    output [2:0] ALUctrl
    );
    
    /* ============ AND logic ================== */
    //wire Rtype, addu, subu, ori, lw, sw, lui, nop, beq, jal, jr, j;
    
    assign Rtype =  (Op == 6'b000000);
    assign ori =    (Op == 6'b001101);
    assign lw =     (Op == 6'b100011);
    assign sw =     (Op == 6'b101011);
    assign beq =    (Op == 6'b000100);
    assign lui =    (Op == 6'b001111);
    assign jal =    (Op == 6'b000011);
    assign j =      (Op == 6'b000010);
    assign addiu =  (Op == 6'b001001);
    
    // R type
    assign jr =     (Rtype && func == 6'b001000);
    assign jalr =   (Rtype && func == 6'b001001);
    assign addu =   (Rtype && func == 6'b100001);
    assign subu =   (Rtype && func == 6'b100011);
    assign sll =    (Rtype && func == 6'b000000);
    /* ======================================= */
    
    /* ============ OR logic ================== */
    assign ALU_Asrc =   sll;
    assign ALU_Bsrc =   (ori || lw || sw || lui || addiu);
    assign Mem2Reg =    lw;
    assign RegWrite =   (Rtype || ori || lw || lui || jal || addiu);
    assign MemWrite =   sw;
    
    assign LinkPC =     (jal || jalr);
    
    assign RegDst =     Rtype ? 2'b01 :                     // rd
                        jal ?   2'b10 :                     // $ra 5'b11111
                                2'b00 ;                     // rt
                                
    assign signed_ext = (lw || sw || addiu);
    
    assign ExtOp =      lui ?           2'b10 :         // extend to high
                        signed_ext ?    2'b01 :         // signed extension
                        ori ?           2'b00 :         // zero extension
                                        2'b00 ;
        
    assign nPC_sel =    jal || j    ?   3'b001 :            // jump26
                        jr || jalr  ?   3'b010 :            // jumpReg
                        beq         ?   3'b011 :            // ext32
                                        3'b000 ;            // pc+4
    
    assign ALUadd = (addu || addiu || lw || sw);
    assign ALUsub = (subu || beq);
    assign ALUor = (ori || lui);
    assign ALUSL = sll;
    
    assign ALUctrl = ALUadd ?   3'b000 :
                     ALUsub ?   3'b001 :
                     ALUor ?    3'b010 :
                     ALUSL ?    3'b011 :
                                3'b100 ;
    /* ======================================= */

endmodule

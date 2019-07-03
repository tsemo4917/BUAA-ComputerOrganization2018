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
// addu, subu, ori, lw, sw, beq, lui, j, jal, jr, nop
module controller(
    input [31:0] instr,
    // output
    output [1:0] RegDst,
    output ALU_Asel,
    output ALU_Bsel,
    output [1:0] Data2Reg,
    output RegWrite,
    output MemWrite,
    output [2:0] NPCsel,
    output [1:0] PCsrc,
    output [1:0] ExtOp,
    output [3:0] ALUctrl
    );
    
    wire [5:0] Op, func;
    assign Op = instr[31:26];
    assign func = instr[5:0];
    
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
    assign sll =    (Rtype && func == 6'b000000);       // nop
    /* ======================================= */
    
    /* ============ OR logic ================== */
    assign ALU_Asel =   sll;
    assign ALU_Bsel =   (ori || lw || sw || lui || addiu);

    assign load =       lw;
    assign store =      sw;
    
    assign Mem2Reg =    load;
    assign MemWrite =   store;
    assign RegWrite =   (Rtype || ori || load || lui || jal || addiu);
    
    assign signed_ext = (lw || sw || addiu);
    
    assign ExtOp =      lui ?           2'b10 :             // extend to high
                        signed_ext ?    2'b01 :             // signed extension
                        ori ?           2'b00 :             // zero extension
                                        2'b00 ;
    
    assign LinkPC =     (jal || jalr);
    
    assign Data2Reg =   LinkPC  ?       2'b10 :             // PC8
                        Mem2Reg ?       2'b01 :             // DMData
                                        2'b00 ;             // AO_W
    
    assign RegDst =     Rtype ?         2'b01 :             // rd
                        jal ?           2'b10 :             // $ra 5'b11111
                                        2'b00 ;             // rt
    
    assign NPCsel =     jalr || jr  ?   3'b000 :
                        jal || j    ?   3'b001 :            // jump26
                        beq         ?   3'b010 :
                                        3'b011 ;

    //assign jumpReg =    jalr || jr;
    assign bORj =       (j || jal || beq || jalr || jr);
    
    assign PCsrc =      bORj        ?   2'b01 :
                                        2'b00 ;
    
    // ALU control
    assign ALUadd = (addu || addiu || load || store);
    assign ALUsub = (subu);
    assign ALUor =  (ori || lui);
    assign ALUsl =  (sll);
    assign ALUctrl = ALUadd ?   4'b0000 :
                     ALUsub ?   4'b0001 :
                     ALUor ?    4'b0010 :
                     ALUsl ?    4'b0011 :
                                4'b0100 ;
    /* ======================================= */

endmodule

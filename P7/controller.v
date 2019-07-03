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
/*
MIPS-C3={//LB, LBU, LH, LHU, LW, 
//SB, SH, SW, 
//ADD, ADDU, SUB, SUBU,  
//SLL, SRL,  SRA,  SLLV, SRLV, SRAV, 
//AND, OR, XOR, NOR, 
//ADDI, ADDIU, ANDI, ORI, XORI, LUI, 
//SLT, SLTI, SLTIU, SLTU, 
//BEQ, BNE, BLEZ, BGTZ, BLTZ, BGEZ, 
//J, JAL, JALR, JR, 
MULT,  MULTU,  DIV,  DIVU,
MFHI, MFLO, MTHI, MTLO}
*/
/*
P7:
eret, mfc0, mtc0
*/
module controller(
    input [31:0]    instr,
    // output
    output [1:0]    RegDst,
    output          ALU_Asel,
    output          ALU_Bsel,
    output [2:0]    Data2Reg,
    output          RegWrite,
    output          MemWrite,
    output [3:0]    NPCsel,
    output [1:0]    PCsrc,
    output [1:0]    ExtOp,
    output [3:0]    ALUctrl,
//    output [2:0]    storeType,
    output [2:0]    loadType,
    output [2:0]    MDctrl,
    output          HILOsel,
    // P7
    output          cp0WE,
    output          eret_flush_D,
    output          IntEN,
    output          legal
    );
    
    wire [5:0] Op, func;
    wire [4:0] rt;
    assign Op = instr[31:26];
    assign rt = instr[20:16];
    assign func = instr[5:0];
    
    /* ================== AND logic =========================== */
    // load LB, LBU, LH, LHU, LW
    assign lw =     (Op === 6'b100011);
    assign lb =     (Op === 6'b100000);
    assign lbu =    (Op === 6'b100100);
    assign lh =     (Op === 6'b100001);
    assign lhu =    (Op === 6'b100101);
    
    // store SB, SH, SW
    assign sb =     (Op === 6'b101000);
    assign sh =     (Op === 6'b101001);
    assign sw =     (Op === 6'b101011);
    
    // cal_i ADDI, ADDIU, ANDI, ORI, XORI, LUI
    assign addi =   (Op === 6'b001000);
    assign addiu =  (Op === 6'b001001);
    assign andi =   (Op === 6'b001100);
    assign ori =    (Op === 6'b001101);
    assign xori =   (Op === 6'b001110);
    assign lui =    (Op === 6'b001111);
    
    // branch BEQ, BNE, BLEZ, BGTZ, BLTZ, BGEZ
    assign beq =    (Op === 6'b000100);
    assign bne =    (Op === 6'b000101);
    assign blez =   (Op === 6'b000110 && rt === 5'b00000);
    assign bgtz =   (Op === 6'b000111 && rt === 5'b00000);
    assign bltz =   (Op === 6'b000001 && rt === 5'b00000);
    assign bgez =   (Op === 6'b000001 && rt === 5'b00001);
    
    // jump26
    assign jal =    (Op === 6'b000011);
    assign j =      (Op === 6'b000010);
    
    // Rtype ADD, ADDU, SUB, SUBU, AND, OR, XOR, NOR
    assign Rtype =  (Op === 6'b000000);
    assign add =    (Rtype && func === 6'b100000);
    assign addu =   (Rtype && func === 6'b100001);
    assign sub =    (Rtype && func === 6'b100010);
    assign subu =   (Rtype && func === 6'b100011);
    assign _and =   (Rtype && func === 6'b100100);
    assign _or =    (Rtype && func === 6'b100101);
    assign _xor =   (Rtype && func === 6'b100110);
    assign _nor =   (Rtype && func === 6'b100111);
    
    assign jr =     (Rtype && func === 6'b001000);
    assign jalr =   (Rtype && func === 6'b001001);
    
    // slt
    assign slt =    (Rtype && func === 6'b101010);
    assign sltu =   (Rtype && func === 6'b101011);
    assign slti =   (Op === 6'b001010);
    assign sltiu =  (Op === 6'b001011);
        
    // shift SLL, SRL, SRA, SLLV, SRLV, SRAV
    assign sll =    (Rtype && func === 6'b000000);       // nop
    assign srl =    (Rtype && func === 6'b000010);
    assign sra =    (Rtype && func === 6'b000011);
    assign sllv =   (Rtype && func === 6'b000100);
    assign srlv =   (Rtype && func === 6'b000110);
    assign srav =   (Rtype && func === 6'b000111);    
    
    //MULT, MULTU, DIV,  DIVU
    assign mult =   (Rtype && func === 6'b011000);
    assign multu =  (Rtype && func === 6'b011001);
    assign div =    (Rtype && func === 6'b011010);
    assign divu =   (Rtype && func === 6'b011011);
    //MFHI, MFLO, MTHI, MTLO
    assign mfhi =   (Rtype && func === 6'b010000);
    assign mflo =   (Rtype && func === 6'b010010);
    assign mthi =   (Rtype && func === 6'b010001);
    assign mtlo =   (Rtype && func === 6'b010011);
    
    // P7
//    assign eret =   (Op === 6'b010000 && func === 6'b011000 && instr[25:6] === 20'h80000);
    assign eret =   (instr === 32'h4200_0018);
    assign mfc0 =   (Op === 6'b010000 && instr[25:21] === 5'b00000 && instr[10:0] === 11'b0);
    assign mtc0 =   (Op === 6'b010000 && instr[25:21] === 5'b00100 && instr[10:0] === 11'b0);
    
    /* ========================================================== */
    
    /* ================== OR logic =========================== */
    assign load =       (lw || lh || lhu || lb || lbu);
    assign store =      (sw || sh || sb);
    
    assign Mem2Reg =    load;
    
    assign MemWrite =   store;
    
    assign loadType =   lb ?    3'b000 :
                        lbu ?   3'b001 :
                        lh ?    3'b010 :
                        lhu ?   3'b011 :
                        lw ?    3'b100 :
                                3'b111 ;   
    /*
    assign storeType =  sb ?    3'b000 :
                        sh ?    3'b001 :
                        sw ?    3'b011 :
                                3'b111 ;*/
    
    assign RegWrite =   (
                        load || 
                        add || addu || sub || subu || 
                        sll || srl || sra || sllv || srlv || srav || 
                        _and || _or || _xor || _nor ||
                        slt || sltu || slti || sltiu || 
                        addi || addiu || andi || ori || xori || lui || 
                        jal || jalr ||
                        mfhi || mflo ||
                        mfc0
                        );
    
    assign signed_ext = (load || store || (addi || addiu) || (slti || sltiu));
    assign zero_ext =   (ori || xori || andi);
    assign ExtOp =      lui ?           2'b10 :             // extend to high
                        signed_ext ?    2'b01 :             // signed extension
                        zero_ext ?      2'b00 :             // zero extension
                                        2'b11 ;
    
    assign LinkPC =     (jal || jalr);
    
    assign Data2Reg =   LinkPC          ?   3'b010 :
                        Mem2Reg         ?   3'b001 :
                        (mfhi || mflo)  ?   3'b011 :
                        mfc0            ?   3'b100 :
                                            3'b000 ;
    
    assign WriteRt =    (load || store || (lui || ori || xori || andi) || (addi || addiu) || (slti || sltiu) || mfc0);
    assign RegDst =     WriteRt ?       2'b00 :             // rt
                        Rtype   ?       2'b01 :             // rd
                        jal ?           2'b10 :             // $ra 5'b11111
                                        2'b11 ;             
    
    assign NPCsel =     jalr || jr  ?   4'b0000 :
                        jal || j    ?   4'b0001 :            // jump26
                        beq         ?   4'b0010 :
                        bne         ?   4'b0011 :
                        bltz        ?   4'b0100 :
                        blez        ?   4'b0101 :
                        bgtz        ?   4'b0110 :
                        bgez        ?   4'b0111 :
                                        4'b1111 ;

    //assign jumpReg =    jalr || jr;
    assign bORj =       (
                        j || jal || jalr || jr || 
                        beq || bne || blez || bgtz || bltz || bgez
                        );
    
    assign PCsrc =      bORj        ?   2'b01 :
                        eret        ?   2'b10 :
                                        2'b00 ;
    // mult and div control
    assign HILOsel =    mfhi;
    assign MDctrl =     mult    ?   3'b001 :
                        multu   ?   3'b010 :
                        div     ?   3'b011 :
                        divu    ?   3'b100 : 
                        mthi    ?   3'b101 :
                        mtlo    ?   3'b110 :
                                    3'b000 ;
    
    //assign Cal_i =      (addi || addiu || andi || ori || lui || xori || slti || sltiu);
    assign ALU_Asel =   (sll || srl || sra);
    assign ALU_Bsel =   (load || store || (addi || addiu || andi || ori || lui || xori || slti || sltiu));
    // ALU control
    assign ALUadd =     (add || addi || addu || addiu || load || store);
    assign ALUsub =     (sub || subu);
    assign ALUor =      (_or || ori) || lui;
    assign ALUand =     (_and || andi);
    assign ALUxor =     (_xor || xori);
    assign ALUnor =     (_nor);
    assign ALUsll =     (sll || sllv);
    assign ALUsrl =     (srl || srlv);
    assign ALUsra =     (sra || srav);
    assign ALUslt =     (slt || slti);
    assign ALUsltu =    (sltu || sltiu);
    
    assign ALUctrl =    ALUadd ?    4'b0000 :
                        ALUsub ?    4'b0001 :
                        ALUor ?     4'b0010 :
                        ALUand ?    4'b0011 :
                        ALUxor ?    4'b0100 :
                        ALUnor ?    4'b0101 :
                        ALUsll ?    4'b0110 :
                        ALUsrl ?    4'b0111 :
                        ALUsra ?    4'b1000 :
                        ALUslt ?    4'b1001 :
                        ALUsltu ?   4'b1010 :
                                    4'b1111 ;
    /* ========================================================== */
    // P7
    assign cp0WE = mtc0;
    assign IntEN = eret;
    assign eret_flush_D = eret;
    
    assign legal =  (
                    load || store ||    // 8
                    add || addu || sub || subu || _and || _nor || _or || _xor || //8
                    (lui || ori || xori || andi) || (addi || addiu) || //6
                    (slti || sltiu) || slt || sltu || // 4
                    sll || srl || sra || sllv || srlv || srav || // 6
                    j || jal || jalr || jr || // 4
                    beq || bne || blez || bgtz || bltz || bgez || // 6
                    eret || mtc0 || mfc0 || // 3
                    mult || multu || div || divu || mfhi || mflo || mthi || mtlo // 8
                    );

endmodule

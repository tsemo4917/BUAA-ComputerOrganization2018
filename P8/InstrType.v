`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:41:59 11/27/2018 
// Design Name: 
// Module Name:    InstrType 
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
module InstrType(
    input [31:0] instr,
    // output 
    output Cal_r,
	output Cal_i,
    output branch,
    output load,
    output store,
    output jr,
    output linkRa,
    output jalr,
    output mfc0,
    output mtc0,
    output eret
    );

    wire [5:0] Op, func;
    wire [4:0] rt;
    assign rt = instr[20:16];
    assign Op = instr[31:26];
    assign func = instr[5:0];
    
    /* ================== AND logic =========================== */
    // load LB, LBU, LH, LHU, LW
    assign lw =     (Op === 6'b100011);
    assign lb =     (Op === 6'b100000);
    assign lbu =    (Op === 6'b100100);
    assign lh =     (Op === 6'b100001);
    assign lhu =    (Op === 6'b100101);
    
    // store SB, SH, SW, 
    assign sw =     (Op === 6'b101011);
    assign sh =     (Op === 6'b101001);
    assign sb =     (Op === 6'b101000);
    
    // cal_i ADDI, ADDIU, ANDI, ORI, XORI, LUI
    assign ori =    (Op === 6'b001101);
    assign lui =    (Op === 6'b001111);
    assign addiu =  (Op === 6'b001001);
    assign addi =   (Op === 6'b001000);
    assign andi =   (Op === 6'b001100);
    assign xori =   (Op === 6'b001110);
    
    // branch BEQ, BNE, BLEZ, BGTZ, BLTZ, BGEZ
    assign beq =    (Op === 6'b000100);
    assign bne =    (Op === 6'b000101);
    assign blez =   (Op === 6'b000110 && rt === 5'b00000);
    assign bgtz =   (Op === 6'b000111 && rt === 5'b00000);
    assign bltz =   (Op === 6'b000001 && rt === 5'b00000);
    assign bgez =   (Op === 6'b000001 && rt === 5'b00001);
    
    // jump26
    assign jal =    (Op === 6'b000011);
//    assign j =      (Op === 6'b000010);
    
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
    assign sll =    (Rtype && func === 6'b000000);
    assign srl =    (Rtype && func === 6'b000010);
    assign sra =    (Rtype && func === 6'b000011);
    assign sllv =   (Rtype && func === 6'b000100);
    assign srlv =   (Rtype && func === 6'b000110);
    assign srav =   (Rtype && func === 6'b000111);
    
    // P7
    assign eret =   (instr === 32'h4200_0018);
    assign mfc0 =   (Op === 6'b010000 && instr[25:21] === 5'b0 && instr[10:0] === 11'b0);
    assign mtc0 =   (Op === 6'b010000 && instr[25:21] === 5'b00100 && instr[10:0] === 11'b0);
    /* ========================================================== */
    
    /* ================== OR logic =========================== */
    // set output
    assign Cal_r =      (
                        add || addu || sub || subu || 
                        sll || srl || sra || sllv || srlv || srav || 
                        _and || _or || _xor || _nor ||
                        slt || sltu
                        );
    assign Cal_i =      (
                        addi || addiu || 
                        andi || ori || lui || xori || 
                        slti || sltiu
                        );
    assign branch =     (beq || bne || blez || bgtz || bltz || bgez);
    assign load =       (lw || lb || lbu || lh || lhu);
    assign store =      (sw || sh || sb);
    assign linkRa =     jal;

endmodule

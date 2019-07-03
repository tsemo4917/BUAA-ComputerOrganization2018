`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:26 12/18/2018 
// Design Name: 
// Module Name:    defInstr 
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
`define Int     5'd0
`define AdEL    5'd4
`define AdES    5'd5
`define RI      5'd10
`define Ov      5'd12

`define Op 		instr[31:26]
`define func	instr[5:0]
`define Rtype 	(`Op === 6'b000000)
`define addu	(`Rtype && `func === 6'b100001)
`define subu	(`Rtype && `func === 6'b100011)
`define ori     (`Op === 6'b001101)
`define beq     (`Op === 6'b000100)
`define lui     (`Op === 6'b001111)
`define j	    (`Op === 6'b000010)
`define jal     (`Op === 6'b000011)
`define jalr	(`Rtype && `func === 6'b001001)
`define jr      (`Rtype && `func === 6'b001000)
//`define movz	(`Rtype && `func === 6'b001010)
`define add		(`Rtype && `func === 6'b100000)
`define addi	(`Op === 6'b001000)
`define addiu	(`Op === 6'b001001)
`define sub		(`Rtype && `func === 6'b100010)
`define sll		(`Rtype && `func === 6'b000000)
`define srl		(`Rtype && `func === 6'b000010)
`define sra		(`Rtype && `func === 6'b000011)
`define sllv	(`Rtype && `func === 6'b000100)
`define srlv	(`Rtype && `func === 6'b000110)
`define srav	(`Rtype && `func === 6'b000111)
`define _and	(`Rtype && `func === 6'b100100)
`define _or		(`Rtype && `func === 6'b100101)
`define _nor	(`Rtype && `func === 6'b100111)
`define _xor	(`Rtype && `func === 6'b100110)
`define andi	(`Op === 6'b001100)
`define xori	(`Op === 6'b001110)
`define slt		(`Rtype && `func === 6'b101010)
`define slti	(`Op === 6'b001010)
`define sltu	(`Rtype && `func === 6'b101011)
`define sltiu	(`Op === 6'b001011)
`define bne		(`Op === 6'b000101)
`define blez	(`Op === 6'b000110)
`define bgez	(`Op === 6'b000001 && instr[20:16] === 5'b00001)
`define bgtz	(`Op === 6'b000111)
`define bltz	(`Op === 6'b000001 && instr[20:16] === 5'b00000)
`define sw      (`Op === 6'b101011)
`define sh		(`Op === 6'b101001)
`define sb		(`Op === 6'b101000)
`define lw      (`Op === 6'b100011)
`define lh		(`Op === 6'b100001)
`define lhu		(`Op === 6'b100101)
`define lb		(`Op === 6'b100000)
`define lbu		(`Op === 6'b100100)
`define mult	(`Rtype && `func === 6'b011000)
`define multu	(`Rtype && `func === 6'b011001)
`define div		(`Rtype && `func === 6'b011010)
`define divu	(`Rtype && `func === 6'b011011)
`define mfhi	(`Rtype && `func === 6'b010000)
`define mflo	(`Rtype && `func === 6'b010010)
`define mthi	(`Rtype && `func === 6'b010001)
`define mtlo	(`Rtype && `func === 6'b010011)
// P7
`define mfc0    (`Op === 6'b010000 && instr[25:21] === 5'b00000)
`define mtc0    (`Op === 6'b010000 && instr[25:21] === 5'b00100)
`define eret    (instr === 32'h4200_0018)

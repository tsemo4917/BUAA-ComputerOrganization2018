`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:55:49 11/16/2018 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );
    //wire RegDst, ALUSrc, Mem2Reg, RegWrite, MemWrite, nPC_sel, jr, jal;
    wire [1:0] ExtOp, RegDst;
    wire [2:0] ALUctrl;
    wire [2:0] nPC_sel;
    
    wire [31:0] instr;
    wire [4:0] rs, rt, rd, shamt;
    wire [5:0] Op, func;
    wire [15:0] imm16;
    wire [25:0] imm26;
    wire [31:0] ext32;
    
    assign Op =     instr[31:26];
    assign rs =     instr[25:21];
    assign rt =     instr[20:16];
    assign rd =     instr[15:11];
    assign shamt =  instr[10:6];
    assign func =   instr[5:0];
    assign imm16 =  instr[15:0];
    assign imm26 =  instr[25:0];
    
    wire [31:0] pc, npc, pc4, Instr;
    
    wire [31:0] MemOut;
    
    wire [31:0] RWData, RD1, RD2;
    wire [4:0] RegAddr;
    
    wire [31:0] DA, DB, ALUout;

    controller _ctrl(
        .Op(Op),
        .func(func),
        // output
        .RegDst(RegDst),
        .ALU_Asrc(ALU_Asrc),
        .ALU_Bsrc(ALU_Bsrc),
        .Mem2Reg(Mem2Reg),
        .RegWrite(RegWrite),
        .MemWrite(MemWrite),
        .LinkPC(LinkPC),
        .nPC_sel(nPC_sel),
        .ExtOp(ExtOp),
        .ALUctrl(ALUctrl)
    );
    
    PC _pc(
        .clk(clk),
        .reset(reset),
        // output
        .nextPC(npc),
        .outPC(pc)
    );
    
    NPC _npc(
        .pc(pc),
        .nPC_sel(nPC_sel),
        .zero(zero),
        .imm26(imm26),
        .Reg32(RD1),
        // output
        .nextPC(npc),
        .pc4(pc4)
    );
    
    IM _im(
        .addr(pc[11:2]),
        // output
        .Instr(instr)
    );
    
    /*
    assign RegAddr =    RegDst == 2'b00 ?   rt :
                        RegDst == 2'b01 ?   rd :            // Rtype
                                            5'b11111 ;      // jal
    */
    mux_4 #(.width(5)) 
    mux_RegAddr(
        .data0(rt),
        .data1(rd),
        .data2(5'b11111),
        .data3(5'b0),
        .sel(RegDst),
        // output
        .dataOut(RegAddr)
    );
    
    assign RWData =     Mem2Reg ?           MemOut :
                        LinkPC ?            pc4 :           // LinkPC = (jal || jalr)
                                            ALUout ;

    GRF _grf(
        .clk(clk),
        .reset(reset),
        .RegWrite(RegWrite),
        .WPC(pc),
        .RA(rs),
        .RB(rt),
        .Waddr(RegAddr),
        .WData(RWData),
        // output
        .DataA(RD1),
        .DataB(RD2)
    );
    
    assign DA = ALU_Asrc ? {27'b0, shamt} : RD1;
    assign DB = ALU_Bsrc ? ext32 : RD2;
    
    ALU _alu(
        .A(DA),
        .B(DB),
        .ALUOp(ALUctrl),
        // output
        .ALUout(ALUout),
        .zero(zero)
    );
    
    DM _dm(
        .pc(pc),
        .clk(clk),
        .reset(reset),
        .MemWrite(MemWrite),
        .addr(ALUout),
        .din(RD2),
        // output
        .dout(MemOut)
    );
    
    EXT _ext(
        .imm16(imm16),
        .ExtOp(ExtOp),
        // output
        .imm32(ext32)
    );


endmodule

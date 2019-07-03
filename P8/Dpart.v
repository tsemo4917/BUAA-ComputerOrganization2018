`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:38 11/24/2018 
// Design Name: 
// Module Name:    Dpart 
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
`include "head_def.v"
module Dpart(
    input [3:0]     NPCsel,
    input [1:0]     ExtOp,
    input           legalIR,
    input           clk,
    input           reset,
    input [31:0]    PC_D,
    input [31:0]    instr,
    input [4:0]     ExcCode_D,
    // for write back part
    input           RegWrite_W,
    input [31:0]    Result_W,
    input [4:0]     WriteAddr_W,
//    input [31:0]    WPC8_W,
    // forward data and select signal
    input [31:0]    AO_regM,
    input [31:0]    PC8_regM,
    input [1:0]     rs_Dforward,
	input [1:0]     rt_Dforward,
    // output
    output [31:0]   RS_E,
    output [31:0]   RT_E,
    output [31:0]   EXT_E,
    // to F part
    output [31:0]   npc,    
    output [4:0]    ExcCode_E
    );
        
    wire [4:0] rs, rt;
    wire [15:0] imm16;
    wire [25:0] imm26;
    
    assign rs =     instr[25:21];
    assign rt =     instr[20:16];
    assign imm16 =  instr[15:0];
    assign imm26 =  instr[25:0];

    assign ExcCode_E = (!legalIR && ExcCode_D == 5'b0) ? `RI : ExcCode_D;
    
    GRF grf(
//        .WPC8(WPC8_W),
        .clk(clk),
        .reset(reset),
        .RegWrite(RegWrite_W),
        .RA(rs),
        .RB(rt),
        .Waddr(WriteAddr_W),
        .WData(Result_W),
        // output
        .DataA(RS_E),
        .DataB(RT_E)
    );

    EXT ext(
        .imm16(imm16),
        .ExtOp(ExtOp),
        // output
        .imm32(EXT_E)
    );

    wire [31:0] CMP_A, CMP_B;
            
    mux_4 #(32)
    mux_rs_D_forward(
        .data0(RS_E), 
        .data1(AO_regM), 
        .data2(PC8_regM), 
        .data3(0),
        .sel(rs_Dforward), 
        .dataOut(CMP_A)
    );

    mux_4 #(32)
    mux_rt_D_forward(
        .data0(RT_E), 
        .data1(AO_regM), 
        .data2(PC8_regM), 
        .data3(0),
        .sel(rt_Dforward), 
        .dataOut(CMP_B)
    );
    
    wire [2:0] CMPrst;
    CMP cmp(
        .DataA(CMP_A),
        .DataB(CMP_B),
        // output
        .CMPrst(CMPrst)
    );
    
    NPC _npc(
        .pc4(PC_D + 4),
        .RegRS(CMP_A),
        .imm26(imm26),
        .CMPrst(CMPrst),
        .nPC_sel(NPCsel),
        // output
        .nextPC(npc)        // Dpart output
    );
    
    
endmodule

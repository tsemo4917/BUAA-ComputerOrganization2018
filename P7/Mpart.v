`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:16:43 11/24/2018 
// Design Name: 
// Module Name:    Mpart 
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
module Mpart(
    input           clk,
    input           reset,
    input [31:0]    instr,
    input [31:0]    AO_M,
    input [31:0]    RT_M,
    input [31:0]    PC_M,
    input [31:0]    HILO_M,
    // P7
    input [4:0]     ExcCode_M,
    input [31:0]    PrRD,
    input           IntReq,
    // forward data and select signal
    input [31:0]    Result_W,
    input [1:0]     rt_Mforward,
    // output
    output [31:0]   instr_W,
    output [31:0]   PC_W,
    output [31:0]   DMData_W,
    output [31:0]   AO_W,
    output [31:0]   HILO_W,
    // for cp0
    output          cp0WE,
    output [31:0]   cp0DataIN,
    output          IntEN,
    output [4:0]    ExcCode_cp0,
    // bridge
    output          PrWE
    );
    
    assign HILO_W = HILO_M;
    assign AO_W = AO_M;
    assign PC_W = PC_M;
    assign instr_W = instr;
    
    wire [2:0] storeType;
    wire MemWrite;
    
    controller ctrl_M(
        .instr(instr),
        // output
        .MemWrite(MemWrite),
//        .storeType(storeType),
        .cp0WE(cp0WE_ctrl), 
        .IntEN(IntEN)
    );
    /*
    `define sb 3'b000
    `define sh 3'b001
    `define sw 3'b011*/
    wire [3:0] BE;
    assign BE = `sb ?  (
                AO_M[1:0] == 2'b00  ?   4'b0001 :
                AO_M[1:0] == 2'b01  ?   4'b0010 :
                AO_M[1:0] == 2'b10  ?   4'b0100 :
                                        4'b1000 
                ) :
                (`sh && !AO_M[0]) ?  (
                    AO_M[1] == 1'b0 ?   4'b0011 : 
                                        4'b1100
                ) :
                (`sw && AO_M[1:0] == 2'b0) ? 4'b1111 :
                                        4'b0000 ;
    /*
    assign BE = storeType == `sb ?  (
                AO_M[1:0] == 2'b00  ?   4'b0001 :
                AO_M[1:0] == 2'b01  ?   4'b0010 :
                AO_M[1:0] == 2'b10  ?   4'b0100 :
                                        4'b1000 
                ) :
                storeType == `sh ?  (
                    AO_M[1] == 1'b0 ?   4'b0011 :
                                        4'b1100 
                ) :
                storeType == `sw ?      4'b1111 :
                                        4'b0000 ;*/
    
    wire [31:0] din;

    mux_4 #(32)
    mux_rt_M_forward(
        .data0(RT_M),
        .data1(Result_W), 
        .data2(0), 
        .data3(0), 
        .sel(rt_Mforward),
        .dataOut(din)
    );
    
    wire [31:0] DMOut;
    DM _dm(
        .pc(PC_M),
        .clk(clk),
        .reset(reset),
        .BE(BE),
        .MemWrite(MemWrite & ~IntReq),
        .din(din),
        .addr(AO_M),
        // output
        .dout(DMOut)
    );
    // P7
    assign DMData_W = (AO_M >= 0 && AO_M <= 32'h2ffc) ? DMOut : PrRD;
    assign cp0WE = cp0WE_ctrl & ~IntReq;
    assign PrWE = MemWrite & ~IntReq;
    assign cp0DataIN = din;
    
    `define addrInDEV0 (32'h7f00 <= AO_M && AO_M <= 32'h7f0b)
    `define addrInDEV1 (32'h7f10 <= AO_M && AO_M <= 32'h7f1b)
    assign ExcCode_cp0 =    (ExcCode_M == 5'b0) && (
                                (`sh && AO_M[0]) || (`sw && AO_M[1:0] != 2'b0) || 
                                ((`sh || `sb) && (`addrInDEV0 || `addrInDEV1)) ||
                                (MemWrite && ( !(AO_M >= 0 && AO_M <= 32'h2fffc) && !`addrInDEV0 && !`addrInDEV1) )
                            ) ? `AdES : 
                            (ExcCode_M == 5'b0) && (
                                ((`lh || `lhu) && AO_M[0]) || (`lw && AO_M[1:0] != 2'b0) ||
                                ((`lh || `lhu || `lb || `lbu) && (`addrInDEV0 || `addrInDEV1)) || 
                                ((`lw || `lh || `lhu || `lb || `lbu) && (!(AO_M >= 0 && AO_M <= 32'h2fffc) && !`addrInDEV0 && !`addrInDEV1))
                            ) ? `AdEL :
                                ExcCode_M;

endmodule

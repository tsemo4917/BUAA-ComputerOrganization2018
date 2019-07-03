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
    input           MemWrite,
    input           clk,
    input           reset,
    input [31:0]    instr,
    input [31:0]    AO_M,
    input [31:0]    RT_M,
    // P7
    input [4:0]     ExcCode_M,
    input [31:0]    PrRD,
    input           IntReq,
    // forward data and select signal
    input [31:0]    Result_W,
    input           rt_Mforward,
    // output
    output [31:0]   DMData_W,
    // for cp0
    output [31:0]   cp0DataIN,
    output          IntEN,
    output [4:0]    ExcCode_cp0,
    // bridge
//    output [3:0]    PrBE,
    output          PrWE
    );

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
                                        
    // forward
    wire [31:0] din, DMOut;
    assign din = rt_Mforward ? Result_W : RT_M;
    
    BlockRAM_DM dm (
          .clka(clk), // input clka
          .wea(BE), // input [3 : 0] wea
          .addra(AO_M[12:2]), // input [10 : 0] addra
          .dina(din), // input [31 : 0] dina
          .douta(DMOut) // output [31 : 0] douta
    );
//    DM dm(
//        .pc(PC_M),
//        .clk(clk),
//        .reset(reset),
//        .BE(BE),
//        .MemWrite(MemWrite & ~IntReq),
//        .din(din),
//        .addr(AO_M),
//        // output
//        .dout(DMOut)
//    );
    
    // P7
    assign DMData_W =   (AO_M >= 0 && AO_M <= 32'h2ffc) ? DMOut : PrRD;
    assign PrWE =       MemWrite & ~IntReq;
    assign cp0DataIN =  din;
//    assign PrBE =       BE;
    assign IntEN =      `eret;//32'h4200_0018;
    
    assign addrInDEV =  (32'h7f00 <= AO_M && AO_M <= 32'h7f43);
    assign ExcCode_cp0 =    (ExcCode_M == 5'b0) && (
                                (`sh && AO_M[0]) || (`sw && AO_M[1:0] != 2'b0) || 
                                ((`sh || `sb) && (addrInDEV)) ||
                                (MemWrite && ( !(AO_M >= 0 && AO_M <= 32'h2ffc) && !addrInDEV) )
                            ) ? `AdES : 
                            (ExcCode_M == 5'b0) && (
                                ((`lh || `lhu) && AO_M[0]) || (`lw && AO_M[1:0] != 2'b0) ||
                                ((`lh || `lhu || `lb || `lbu) && (addrInDEV)) || 
                                ((`lw || `lh || `lhu || `lb || `lbu) && (!(AO_M >= 0 && AO_M <= 32'h2ffc) && !addrInDEV))
                            ) ? `AdEL :
                                ExcCode_M;

endmodule

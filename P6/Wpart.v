`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:14 11/24/2018 
// Design Name: 
// Module Name:    Wpart 
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
module Wpart(
    input [31:0] PC_W,
    input [31:0] instr,
    input [31:0] AO_W,
    input [31:0] DMData_W,
    input [31:0] HILO_W,
    // output
    output [31:0] DMDataEXT_W,
    output [31:0] Result_W,
    output [4:0] WriteAddr_W,
    output RegWrite_W
    );
    
    wire [4:0] rt, rd;
    assign rt =     instr[20:16];
    assign rd =     instr[15:11];
    
    wire [1:0] RegDst;
    wire [1:0] Data2Reg;
    wire [2:0] loadType;
    controller ctrl_W(
        .instr(instr),
        // output
        .RegWrite(RegWrite_W),
        .Data2Reg(Data2Reg),
        .RegDst(RegDst),
        .loadType(loadType)
    );
    
    DMDataEXT doutEXT(
        .loadType(loadType),
        .DMData(DMData_W),
        .addr(AO_W[1:0]),
        // output
        .ext32(DMDataEXT_W)
    );
    
    mux_4 #(5) 
    MUX_WriteAddr_W(
        .data0(rt),
        .data1(rd),
        .data2(5'b11111),
        .data3(5'b0),
        .sel(RegDst),
        // output
        .dataOut(WriteAddr_W)
    );
    
    mux_4 #(32)
    MUX_Result_W (
        .data0(AO_W),
        .data1(DMDataEXT_W),
        .data2(PC_W + 8),
        .data3(HILO_W),
        .sel(Data2Reg),
        // output
        .dataOut(Result_W)
    );

endmodule

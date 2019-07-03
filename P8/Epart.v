`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:16:11 11/24/2018 
// Design Name: 
// Module Name:    Epart 
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
module Epart(
    // ctrl signal
    input           ALU_Asel,
    input           ALU_Bsel,
    input [3:0]     ALUOp,
    // 
    input [31:0]    instr,
//    input [31:0]    PC_E,
    input [31:0]    EXT_E,
    input [31:0]    RT_E,
    input [31:0]    RS_E,
    
    input [4:0]     ExcCode_E,
    // forward data and select signal
    input [31:0]    AO_regM,
    input [31:0]    PC8_regM,
    input [31:0]    Result_W,
    input [1:0]     rs_Eforward,
    input [1:0]     rt_Eforward,
    // output
    output [31:0]   AO_M,
    output [31:0]   RT_M,
    
    output [4:0]    ExcCode_M
    );

    wire [31:0] RS, RT;
    
    mux_4 #(32) 
    mux_rs_E_forward (
        .data0(RS_E), 
        .data1(AO_regM), 
        .data2(PC8_regM), 
        .data3(Result_W), 
        .sel(rs_Eforward), 
        .dataOut(RS)
    );
    mux_4 #(32)
    mux_rt_E_forward (
        .data0(RT_E), 
        .data1(AO_regM), 
        .data2(PC8_regM), 
        .data3(Result_W),
        .sel(rt_Eforward), 
        .dataOut(RT)
    );
    
    assign RT_M = RT;
    
    wire [31:0] ALUData_A, ALUData_B;
    assign ALUData_A = ALU_Asel ? {27'b0, instr[10:6]} : RS;
    assign ALUData_B = ALU_Bsel ? EXT_E : RT;
    
    ALU alu(
        .A(ALUData_A),
        .B(ALUData_B),
        .ALUOp(ALUOp),
        // output
        .ALUOut(AO_M),
        .Overflow(Overflow)
    );

    assign ExcCode_M = ((`add || `addi || `sub) && Overflow && ExcCode_E == 5'b0) ? `Ov : ExcCode_E;
    
endmodule

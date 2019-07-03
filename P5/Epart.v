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
module Epart(
    input [31:0] instr,
    input [31:0] PC_E,
    input [31:0] EXT_E,
    input [31:0] RT_E,
    input [31:0] RS_E,
    // forward data and select signal
    input [31:0] AO_regM,
    input [31:0] AO_regW,
    input [31:0] PC8_regM,
    input [31:0] PC8_regW,
    input [31:0] DMData_regW,
    input [2:0] rs_Eforward,
    input [2:0] rt_Eforward,
    // output
    output [31:0] instr_M,
    output [31:0] PC_M,
    output [31:0] AO_M,
    output [31:0] RT_M
    );
    
    wire [31:0] shamt32;
    assign shamt32 =  {27'b0, instr[10:6]};
    
    wire [3:0] ALUOp;
    
    controller  ctrl_E(
        .instr(instr),
        // output
        .ALU_Asel(ALU_Asel),
        .ALU_Bsel(ALU_Bsel),
        .ALUctrl(ALUOp)
    );

    wire [31:0] RS, RT;

    mux_8 #(32) 
    mux_rs_E_forward (
        .data0(RS_E), 
        .data1(AO_regM), 
        .data2(AO_regW), 
        .data3(PC8_regM), 
        .data4(PC8_regW), 
        .data5(DMData_regW), 
        .data6(0), 
        .data7(0), 
        .sel(rs_Eforward), 
        .dataOut(RS)
    );

    mux_8 #(32)
    mux_rt_E_forward (
        .data0(RT_E), 
        .data1(AO_regM), 
        .data2(AO_regW), 
        .data3(PC8_regM), 
        .data4(PC8_regW), 
        .data5(DMData_regW), 
        .data6(0), 
        .data7(0),
        .sel(rt_Eforward), 
        .dataOut(RT)
    );
    
    
    wire [31:0] ALUData_A, ALUData_B;
    assign ALUData_A = ALU_Asel ? shamt32   : RS;
    assign ALUData_B = ALU_Bsel ? EXT_E     : RT;
    
    ALU _alu(
        .A(ALUData_A),
        .B(ALUData_B),
        .ALUOp(ALUOp),
        // output
        .ALUOut(AO_M)
    );
    
    // set output
    assign instr_M = instr;
    assign PC_M = PC_E;
    assign RT_M = RT;
    
    
endmodule

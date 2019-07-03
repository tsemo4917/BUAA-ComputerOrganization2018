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
    input           clk,
    input           reset,
    input           stopMD,
    input           returnPreHILO,
    input [31:0]    instr,
    input [31:0]    PC_E,
    input [31:0]    EXT_E,
    input [31:0]    RT_E,
    input [31:0]    RS_E,
    
    input [4:0]     ExcCode_E,
    // forward data and select signal
    input [31:0]    AO_regM,
    input [31:0]    PC8_regM,
    input [31:0]    HILO_regM,
    input [31:0]    Result_W,
    input [2:0]     rs_Eforward,
    input [2:0]     rt_Eforward,
    // output
    output [31:0]   instr_M,
    output [31:0]   PC_M,
    output [31:0]   AO_M,
    output [31:0]   RT_M,
    output [31:0]   HILO_M,
    output          busy,
    
    output [4:0]    ExcCode_M
    );
        
    wire [3:0] ALUOp;
    wire [2:0] MDctrl;
    wire HILOsel;
    controller  ctrl_E(
        .instr(instr),
        // output
        .ALU_Asel(ALU_Asel),
        .ALU_Bsel(ALU_Bsel),
        .ALUctrl(ALUOp),
        .MDctrl(MDctrl),
        .HILOsel(HILOsel)
    );

    wire [31:0] RS, RT;
    mux_8 #(32) 
    mux_rs_E_forward (
        .data0(RS_E), 
        .data1(AO_regM), 
        .data2(PC8_regM), 
        .data3(HILO_regM), 
        .data4(Result_W), 
        .data5(0), 
        .data6(0), 
        .data7(0), 
        .sel(rs_Eforward), 
        .dataOut(RS)
    );

    mux_8 #(32)
    mux_rt_E_forward (
        .data0(RT_E), 
        .data1(AO_regM), 
        .data2(PC8_regM), 
        .data3(HILO_regM), 
        .data4(Result_W), 
        .data5(0), 
        .data6(0), 
        .data7(0),
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
    
    assign Start = (3'b001 <= MDctrl && MDctrl <= 3'b100);
    wire [31:0] HI, LO;
    
    ALUMD xalu(
        .clk(clk),
        .reset(reset),
        .stopMD(stopMD),
        .returnPreHILO(returnPreHILO),
        .MDctrl(MDctrl),
        .Start(Start),
        .DataA(RS),
        .DataB(RT),
        // output
        .Busy(Busy),
        .HI(HI),
        .LO(LO)
    );
    
    assign HILO_M = HILOsel ? HI : LO;
    assign instr_M = instr;
    assign PC_M = PC_E;
    assign busy = (Start || Busy);

    assign ExcCode_M = ((`add || `addi || `sub) && Overflow && ExcCode_E == 5'b0) ? `Ov : ExcCode_E;
    
endmodule

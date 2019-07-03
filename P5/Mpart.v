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
module Mpart(
    input clk,
    input reset,
    input [31:0] instr,
    input [31:0] AO_M,
    input [31:0] RT_M,
    input [31:0] PC_M,
    // forward data and select signal
    input [31:0] AO_regW,
    input [31:0] DMData_regW,
    input [31:0] PC8_regW,
    input [2:0] rt_Mforward,
    // output
    output [31:0] instr_W,
    output [31:0] PC_W,
    output [31:0] DMData_W,
    output [31:0] AO_W
    );
    
    assign AO_W = AO_M;
    assign PC_W = PC_M;
    assign instr_W = instr;
    
    controller ctrl_M(
        .instr(instr),
        // output
        .MemWrite(MemWrite)
    );
    
    wire [31:0] din;

    mux_8 #(32)
    mux_rt_M_forward(
        .data0(RT_M),
        .data1(AO_regW), 
        .data2(DMData_regW), 
        .data3(PC8_regW), 
        .data4(0), 
        .data5(0), 
        .data6(0), 
        .data7(0),
        .sel(rt_Mforward),
        .dataOut(din)
    );

    DM _dm(
        .pc(PC_M),
        .clk(clk),
        .reset(reset),
        .MemWrite(MemWrite),
        .din(din),
        .addr(AO_M),
        // output
        .dout(DMData_W)
    );

endmodule

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
    input [31:0] HILO_M,
    // forward data and select signal
    input [31:0] Result_W,
//    input [31:0] AO_regW,
//    input [31:0] DMDataEXT_W,
//    input [31:0] PC8_regW,
    input [2:0] rt_Mforward,
    // output
    output [31:0] instr_W,
    output [31:0] PC_W,
    output [31:0] DMData_W,
    output [31:0] AO_W,
    output [31:0] HILO_W
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
        .storeType(storeType)
    );
    `define sb 3'b000
    `define sh 3'b001
    `define sw 3'b011
    wire [3:0] BE;
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
                                        4'b0000 ;
    
    wire [31:0] din;

    mux_8 #(32)
    mux_rt_M_forward(
        .data0(RT_M),
        .data1(Result_W), 
        .data2(0), 
        .data3(0), 
        .data4(0), 
        .data5(0), 
        .data6(0), 
        .data7(0),
        .sel(rt_Mforward),
        .dataOut(din)
    );
//    mux_8 #(32)
//    mux_rt_M_forward(
//        .data0(RT_M),
//        .data1(AO_regW), 
//        .data2(DMDataEXT_W), 
//        .data3(PC8_regW), 
//        .data4(0), 
//        .data5(0), 
//        .data6(0), 
//        .data7(0),
//        .sel(rt_Mforward),
//        .dataOut(din)
//    );

    DM _dm(
        .pc(PC_M),
        .clk(clk),
        .reset(reset),
        .BE(BE),
        .MemWrite(MemWrite),
        .din(din),
        .addr(AO_M),
        // output
        .dout(DMData_W)
    );

endmodule

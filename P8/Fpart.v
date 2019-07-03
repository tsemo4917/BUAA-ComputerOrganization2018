`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:07 11/24/2018 
// Design Name: 
// Module Name:    Fpart 
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
module Fpart(
    input           clk,
    input           clk_2,
    input           reset,
    input           EN,
    input [31:0]    npc,
    input [31:0]    EPC,
    input [1:0]     PCsrc,
    // output
    output [31:0]   instr_D,
    output [31:0]   PC_D,
    output [4:0]    ExcCode_D
    );
    
    wire [31:0] nextPC;
        
    mux_4 #(32)
    mux_pc(
        .data0(PC_D + 4),
        .data1(npc),
        .data2(EPC),
        .data3(32'h4180),
        .sel(PCsrc),
        // output
        .dataOut(nextPC)
    );
    
    PC program_counter(
        .clk(clk),
        .reset(reset),
        .EN(EN),
        .nextPC(nextPC),
        // output
        .PC(PC_D)
    );
    
    wire [31:0] addr = PC_D - 32'h3000;
//    IP_IM im_calc (
//        .clka(clk_2), // input clka
//        .wea(1'b0), // input [0 : 0] wea
//        .addra(addr[12:2]), // input [10 : 0] addra
//        .dina(0), // input [31 : 0] dina
//        .douta(instr_D) // output [31 : 0] douta
//    );
//    IP_IM_timer im_timer(
//        .clka(clk_2), // input clka
//        .wea(1'b0), // input [0 : 0] wea
//        .addra(addr[12:2]), // input [10 : 0] addra
//        .dina(0), // input [31 : 0] dina
//        .douta(instr_D) // output [31 : 0] douta
//    );
    IP_IM_uart im_uart(
        .clka(clk_2), // input clka
        .wea(1'b0), // input [0 : 0] wea
        .addra(addr[12:2]), // input [10 : 0] addra
        .dina(0), // input [31 : 0] dina
        .douta(instr_D) // output [31 : 0] douta
    );
//    IP_IM_uartplus im_uartplus(
//        .clka(clk_2), // input clka
//        .wea(1'b0), // input [0 : 0] wea
//        .addra(addr[12:2]), // input [10 : 0] addra
//        .dina(0), // input [31 : 0] dina
//        .douta(instr_D) // output [31 : 0] douta
//    );
//    IM im(
//        .addr(addr),
//        .instr(instr_D)
//    );

    assign ExcCode_D = ((PC_D[1:0] === 2'b0 && 32'h3000 <= PC_D  && PC_D <= 32'h4ffc) ? 5'b0 : `AdEL);

endmodule

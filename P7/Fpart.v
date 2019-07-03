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
    input           reset,
    input           EN,
    input [31:0]    npc,
    input [31:0]    EPC,
    input           IntReq,
    input [1:0]     PCsrc,
    // output
    output [31:0]   instr_D,
    output [31:0]   PC_D,
    output [4:0]    ExcCode_D
    );
    
    wire [31:0] nextPC, outPC;
    
    assign PC_D = outPC;
    
    assign ExcCode_D = ((outPC[1:0] === 2'b0 && 32'h3000 <= outPC  && outPC <= 32'h4fffc) ? 5'b0 : `AdEL);
        
    mux_4 #(32)
    MUX_PC(
        .data0(outPC + 4),
        .data1(npc),
        .data2(EPC),
        .data3(32'h4180),
        .sel(IntReq ? 2'b11 : PCsrc),
        // output
        .dataOut(nextPC)
    );
    
    PC _pc(
        .clk(clk),
        .reset(reset),
        .EN(EN),
        .nextPC(nextPC),
        // output
        .PC(outPC)
    );
    
    IM _im(
        .addr(outPC),
        //output
        .Instr(instr_D)
    );


endmodule

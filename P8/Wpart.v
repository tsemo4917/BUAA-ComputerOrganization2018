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
    input [31:0]    instr,
    input [1:0]     Data2Reg,
    input [1:0]     RegDst,
    input [2:0]     loadType,
    input [31:0]    PC8_W,
    input [31:0]    AO_W,
    input [31:0]    DMData_W,
    input [31:0]    cp0Data_W,
    // output
    output [31:0]   Result_W,
    // to hazard unit
    output [4:0]    WriteAddr_W
    );
    
    wire [4:0] rt, rd;
    assign rt =     instr[20:16];
    assign rd =     instr[15:11];

    wire [31:0] DMDataEXT_W;
    DMDataEXT doutEXT(
        .loadType(loadType),
        .DMData(DMData_W),
        .addr(AO_W[1:0]),
        // output
        .ext32(DMDataEXT_W)
    );
    
    assign WriteAddr_W = 
                RegDst == 2'b00 ?   rt    :
                RegDst == 2'b01 ?   rd    :
                                    5'd31 ;
    mux_4 #(32)
    MUX_Result_W (
        .data0(AO_W),
        .data1(DMDataEXT_W),
        .data2(PC8_W),
        .data3(cp0Data_W),
        .sel(Data2Reg),
        // output
        .dataOut(Result_W)
    );

endmodule

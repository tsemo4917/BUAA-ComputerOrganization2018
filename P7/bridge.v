`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:51:11 12/14/2018 
// Design Name: 
// Module Name:    bridge 
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
`define error 32'hXXXX_XXXX
module bridge(
    // from CPU
    input [31:0]    PrAddr,
    input [31:0]    PrWD,
    input PrWE,
    // from device
    input [31:0]    DEV0_RD,
    input [31:0]    DEV1_RD,
    // output
    output [31:0]   PrRD,         // to CPU
    output [3:2]   DEV_Addr,     // to device
    output [31:0]   DEV_WD,       // to device
    output          DEV0_WE,
    output          DEV1_WE
//    output          data_sel
    );

    assign hitDEV0  =   (32'h0000_7f00 <= PrAddr && PrAddr <= 32'h0000_7f0b);
    assign hitDEV1  =   (32'h0000_7f10 <= PrAddr && PrAddr <= 32'h0000_7f1b);

    assign DEV0_WE  =   hitDEV0 && PrWE;
    assign DEV1_WE  =   hitDEV1 && PrWE;
    assign DEV_WD   =   PrWD;
    assign DEV_Addr =   PrAddr[3:2];

    assign PrRD     =   hitDEV0 ?   DEV0_RD :
                        hitDEV1 ?   DEV1_RD :
                                    `error  ;
    
//    assign data_sel =   hitDEV0 || hitDEV1;

endmodule

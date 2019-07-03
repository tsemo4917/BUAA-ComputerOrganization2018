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
    input [31:0]    DEV2_RD,
    input [31:0]    DEV3_RD,
    input [31:0]    DEV4_RD,
    input [31:0]    DEV5_RD,
    // output
    output [31:0]   PrRD,         // to CPU
    output [4:2]    DEV_Addr,     // to device
    output [31:0]   DEV_WD,       // to device
    output [5:0]    DEV_WE
    );

    assign hitDEV0  =   (32'h7f00 <= PrAddr && PrAddr <= 32'h7f0b);
    assign hitDEV1  =   (32'h7f10 <= PrAddr && PrAddr <= 32'h7f2b);
    assign hitDEV2  =   (32'h7f2c <= PrAddr && PrAddr <= 32'h7f33);
    assign hitDEV3  =   (32'h7f34 <= PrAddr && PrAddr <= 32'h7f37);
    assign hitDEV4  =   (32'h7f38 <= PrAddr && PrAddr <= 32'h7f3f);
    assign hitDEV5  =   (32'h7f40 <= PrAddr && PrAddr <= 32'h7f43);
    
    assign DEV_WE[0]  =   hitDEV0 && PrWE;
    assign DEV_WE[1]  =   hitDEV1 && PrWE;
    assign DEV_WE[2]  =   hitDEV2 && PrWE;
    assign DEV_WE[3]  =   hitDEV3 && PrWE;
    assign DEV_WE[4]  =   hitDEV4 && PrWE;
    assign DEV_WE[5]  =   hitDEV5 && PrWE;
    
    assign PrRD     =   hitDEV0 ?   DEV0_RD :
                        hitDEV1 ?   DEV1_RD :
                        hitDEV2 ?   DEV2_RD :
                        hitDEV3 ?   DEV3_RD :
                        hitDEV4 ?   DEV4_RD :
                        hitDEV5 ?   DEV5_RD :
                                    `error  ;
    
    assign DEV_WD   =   PrWD;
    
    assign DEV_Addr =   PrAddr[4:2];
      
    
endmodule

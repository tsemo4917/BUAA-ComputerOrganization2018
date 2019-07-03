`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:13 12/11/2018 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input reset,
    input clk
    );

    wire [31:0] PrAddr;
//    wire [3:0] PrBE;
    wire [31:0] PrRD, PrWD;
    wire [7:2] HWInt;
    wire PrWE;
    assign HWInt[7:4] = 4'b0;
    CPU cpu(
        .reset(reset),
        .clk(clk),
        .HWInt(HWInt), 
        .PrRD(PrRD), 
//        .data_sel(data_sel), 
        // output
        .PrAddr(PrAddr), 
//        .PrBE(PrBE), 
        .PrWE(PrWE), 
        .PrWD(PrWD)
    );
    
    wire [31:0] DEV0_RD, DEV1_RD, DEV_WD;
    wire [3:2] DEV_Addr;
    wire DEV0_WE, DEV1_WE, data_sel;
    bridge Bridge(
        .PrAddr(PrAddr), 
        .PrWD(PrWD), 
        .PrWE(PrWE), 
        .DEV0_RD(DEV0_RD), 
        .DEV1_RD(DEV1_RD),
        // output
        .PrRD(PrRD), 
        .DEV_Addr(DEV_Addr), 
        .DEV_WD(DEV_WD), 
        .DEV0_WE(DEV0_WE), 
        .DEV1_WE(DEV1_WE)
//        .data_sel(data_sel)
    );
    
    timer timeCounter0 (
        .clk(clk), 
        .reset(reset), 
        .addr(DEV_Addr[3:2]), 
        .WE(DEV0_WE), 
        .din(DEV_WD), 
        // output
        .dataOut(DEV0_RD), 
        .IRQ(HWInt[2])
    );
    
    timer timeCounter1 (
        .clk(clk), 
        .reset(reset), 
        .addr(DEV_Addr), 
        .WE(DEV1_WE), 
        .din(DEV_WD), 
        // output 
        .dataOut(DEV1_RD), 
        .IRQ(HWInt[3])
    );


endmodule

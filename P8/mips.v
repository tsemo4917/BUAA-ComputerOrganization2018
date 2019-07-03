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
    input           sys_rstn,
    input           clk_in,
    input           uart_rxd,
    input [7:0]     dip_switch0,
    input [7:0]     dip_switch1,
    input [7:0]     dip_switch2,
    input [7:0]     dip_switch3,
    input [7:0]     dip_switch4,
    input [7:0]     dip_switch5,
    input [7:0]     dip_switch6,
    input [7:0]     dip_switch7,
    input [7:0]     user_key,
    // output
    output          uart_txd,
    output [31:0]   led_light,
    output [7:0]    digital_tube2,
    output          digital_tube_sel2,
    output [7:0]    digital_tube1,
    output [3:0]    digital_tube_sel1,
    output [7:0]    digital_tube0,
    output [3:0]    digital_tube_sel0
    );
    
    wire reset, clk, clk_2;
       
    assign reset = ~sys_rstn;
    
    IP_CLOCK CLK(   // Clock in ports
        .CLK_IN1(clk_in),      // IN
        // Clock out ports
        .CLK_OUT1(clk),     // OUT
        .CLK_OUT2(clk_2)
    );    // OUT
    
    wire [31:0] PrAddr;
//    wire [3:0] PrBE;
    wire [31:0] PrRD, PrWD;
    wire [7:2] HWInt;
    assign HWInt[7:4] = 4'b0;
    wire PrWE;
    
    CPU cpu(
        .reset(reset),
        .clk(clk),
        .clk_2(clk_2),
        .HWInt(HWInt), 
        .PrRD(PrRD), 
        // output
        .PrAddr(PrAddr), 
//        .PrBE(PrBE), 
        .PrWE(PrWE), 
        .PrWD(PrWD)
    );
    
    wire [5:0]  DEV_WE;
    wire [31:0] DEV0_RD, DEV1_RD, DEV2_RD, DEV3_RD, DEV4_RD, DEV5_RD;
    wire [31:0] DEV_WD;
    wire [4:2]  DEV_Addr;
    
    bridge bridge(
        .PrAddr(PrAddr), 
        .PrWD(PrWD), 
        .PrWE(PrWE), 
        .DEV0_RD(DEV0_RD), 
        .DEV1_RD(DEV1_RD),
        .DEV2_RD(DEV2_RD), 
        .DEV3_RD(DEV3_RD), 
        .DEV4_RD(DEV4_RD), 
        .DEV5_RD(DEV5_RD),
        // output
        .PrRD(PrRD), 
        .DEV_Addr(DEV_Addr), 
        .DEV_WD(DEV_WD), 
        .DEV_WE(DEV_WE)
    );
    
    // 0. TimeCounter 
    timer timeCounter (
        .clk(clk), 
        .reset(reset), 
        .addr(DEV_Addr[3:2]), 
        .WE(DEV_WE[0]), 
        .din(DEV_WD), 
        // output
        .dataOut(DEV0_RD), 
        .IRQ(HWInt[2])
    );
    
    // 1. uart
    MiniUART miniUART (        
        // WISHBONE slave interface
        .CLK_I(clk),                // clock
        .RST_I(reset),              // reset
        .ADD_I({~DEV_Addr[4], DEV_Addr[3:2]}),      // address
        .DAT_I(DEV_WD),             // input data
        .DAT_O(DEV1_RD),            // output data        
        .WE_I(DEV_WE[1]),           // write enable
        .STB_I(DEV_WE[1]),           // strobe
//        .ACK_O(),                   // acknowledge
        // Serial interface
        .RxD(uart_rxd),     // input 
        .TxD(uart_txd),     // output
        .IRQ(HWInt[3])
    );
    
    // 2. 64-bit user switch
    switch_64bit switch_64 (
        .reset(reset), 
        .addr(DEV_Addr[2]), 
        .dip_switch0(dip_switch0), 
        .dip_switch1(dip_switch1), 
        .dip_switch2(dip_switch2), 
        .dip_switch3(dip_switch3), 
        .dip_switch4(dip_switch4), 
        .dip_switch5(dip_switch5), 
        .dip_switch6(dip_switch6), 
        .dip_switch7(dip_switch7), 
        // output
        .RD(DEV2_RD)
    );
    
    // 3. 32-bit LED 
    LED led_32 (
        .clk(clk), 
        .reset(reset), 
        .din(DEV_WD), 
        .WE(DEV_WE[3]), 
        // output
        .led_light(led_light),
        .RD(DEV3_RD)
    );

    // 4. 9-digit 8-segment digital tube
    digital_tube tube_9 (
        .clk(clk), 
        .reset(reset), 
        .WE(DEV_WE[4]), 
        .addr(DEV_Addr[2]), 
        .din(DEV_WD), 
        // output
        .digital_tube2(digital_tube2), 
        .digital_tube_sel2(digital_tube_sel2), 
        .digital_tube1(digital_tube1), 
        .digital_tube_sel1(digital_tube_sel1), 
        .digital_tube0(digital_tube0), 
        .digital_tube_sel0(digital_tube_sel0), 
        .RD(DEV4_RD)
    );
    
    // 5. 8 user buttons
    user_key keys_8 (
        .user_key(user_key), 
        // output
        .RD(DEV5_RD)
    );


endmodule

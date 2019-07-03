`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:51:28 12/14/2018 
// Design Name: 
// Module Name:    timer 
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
`define IM CTRL[3]
`define Mode CTRL[2:1]
`define Enable CTRL[0]
module timer(
    input clk,
    input reset,
    input [3:2] addr,
    input WE,
    input [31:0] din,
    // output
    output [31:0] dataOut,
    output IRQ
    );
    
    reg [3:0] state;
    parameter   IDLE    =   4'b0001,
                LOAD    =   4'b0010,
                CNTING  =   4'b0100,
                INT     =   4'b1000;

    reg [31:0] CTRL, PRESENT, COUNT;
    
    initial begin
        CTRL    <= 0;
        PRESENT <= 0;
        COUNT   <= 0;
        state   <= IDLE;
    end
    
    always @(posedge clk) begin
        if (reset) begin
            CTRL    <= 0;
            PRESENT <= 0;
            COUNT   <= 0;
            state   <= IDLE;
        end
        else begin
            if (WE) begin
                state <= IDLE;
                if (addr == 2'b00) begin
                    CTRL    <=  din;
                end
                else if (addr == 2'b01) begin
                    PRESENT <=  din;
                end
                else begin
                    CTRL    <=  `error;
                    PRESENT <=  `error;
                end
            end
            else begin
                // mode 0
//                if (`Mode == 2'b00) begin
                if (`Mode == 2'b00 || `Mode == 2'b01) begin
                    case (state)
                        IDLE : begin
                            state <= (`Enable ? LOAD : IDLE);
                        end
                        LOAD : begin
                            if (`Enable) begin
                                COUNT <= PRESENT;
                                state <= (PRESENT == 0 ? INT : CNTING);
                            end
                            else begin
                                state <= IDLE;
                            end
                        end
                        CNTING : begin
                            if (`Enable) begin
                                if (COUNT <= 1) begin
//                                    `Enable <= 1'b0;
                                    `Enable <= (`Mode == 2'b00 ? 1'b0 : `Enable);
                                    state <= INT;
                                    COUNT <= COUNT - 1;
                                end
                                else begin
                                    COUNT <= COUNT - 1;
                                end
                            end
                            else begin
                                state <= IDLE;
                            end
                        end
                        INT : begin
                            if (`Enable) begin
                                COUNT <= PRESENT;
                                state <= (PRESENT == 0 ? INT : CNTING);
                            end
                        end
                        default : 
                            state <= IDLE;
                    endcase
                end
//                // mode 1
//                else if (`Mode == 2'b01) begin
//                    case (state)
//                        IDLE : begin
//                            state <= (`Enable ? LOAD : IDLE);
//                        end
//                        LOAD : begin
//                            if (`Enable) begin
//                                COUNT <= PRESENT;
//                                state <= (PRESENT == 0 ? INT : CNTING);
//                            end
//                            else begin
//                                state <= IDLE;
//                            end
//                        end
//                        CNTING : begin
//                            if (`Enable) begin
//                                if (COUNT <= 1) begin
//                                    state <= INT;
//                                    COUNT <= COUNT - 1;
//                                end
//                                else begin
//                                    COUNT <= COUNT - 1;
//                                end
//                            end
//                            else begin
//                                state <= IDLE;
//                            end
//                        end
//                        INT : begin
//                            if (`Enable) begin
//                                COUNT <= PRESENT;
//                                state <= (PRESENT == 0 ? INT : CNTING);
//                            end
//                            else begin
//                                state <= IDLE;
//                            end
//                        end
//                        default :
//                            state <= IDLE;
//                    endcase
//                end
                else begin
                    state <= IDLE;
                end
            end
        end
    end

    assign IRQ = (state == INT) && `IM;

    assign dataOut =    addr == 2'b00 ? CTRL :
                        addr == 2'b01 ? PRESENT :
                        addr == 2'b10 ? COUNT :
                                        `error;


endmodule

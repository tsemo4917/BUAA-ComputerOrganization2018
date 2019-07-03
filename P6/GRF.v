`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:05 11/16/2018 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
    input clk,
    input reset,
    input RegWrite,
    input [31:0] WPC,
    input [4:0] RA,
    input [4:0] RB,
    input [4:0] Waddr,
    input [31:0] WData,
    // output
    output [31:0] DataA,
    output [31:0] DataB
    );
    
    reg [31:0] rf [0:31];
    
    integer i;
    
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            rf[i] = i == 28 ? 32'h0000_1800 :
                    i == 29 ? 32'h0000_2ffc :
                              32'h0000_0000 ;
        end
    end
    
    assign DataA =  (RA == 0) ?                 0       :
                    (RegWrite && RA == Waddr) ? WData   :
                                                rf[RA]  ;
    
	assign DataB =  (RB == 0) ?                 0       :
                    (RegWrite && RB == Waddr) ? WData   :
                                                rf[RB]  ;
    
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                rf[i] <= i == 28 ? 32'h0000_1800 :
                         i == 29 ? 32'h0000_2ffc :
                                   32'h0000_0000 ;
            end
        end
        else if (RegWrite) begin
            if (Waddr > 0) begin
                rf[Waddr] <= WData;
//                $display("@%h: $%d <= %h", WPC, Waddr, WData);
                $display("%d@%h: $%d <= %h", $time, WPC, Waddr, WData);
            end
            else begin
                rf[0] <= 32'b0;
            end
        end
    end


endmodule

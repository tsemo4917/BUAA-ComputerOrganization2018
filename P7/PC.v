`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:51 11/17/2018 
// Design Name: 
// Module Name:    PC 
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
module PC(
    input           clk,
    input           reset,
    input           EN,
    input [31:0]    nextPC,
    // output
    output reg [31:0] PC
    );
        
    initial begin
        PC = 32'h0000_3000;
    end
        
    always @(posedge clk) begin
        if (reset) begin
            PC <= 32'h0000_3000;
        end
        else if (EN) begin
            PC <= nextPC;
        end
        else begin
            PC <= PC;
        end
    end

endmodule

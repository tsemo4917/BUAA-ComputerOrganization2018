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
    input clk,
    input reset,
    input EN,
    input [31:0] nextPC,
    // output
    output [31:0] outPC
    );
    
    reg [31:0] pc;
    
    initial begin
        pc = 32'h0000_3000;
    end
    
    assign outPC = pc;
    
    always @(posedge clk) begin
        if (reset) begin
            pc <= 32'h0000_3000;
        end
        else if (EN) begin
            pc <= nextPC;
        end
        else begin
            pc <= pc;
        end
    end

endmodule

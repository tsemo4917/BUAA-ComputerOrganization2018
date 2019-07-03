`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:52 11/16/2018 
// Design Name: 
// Module Name:    dm 
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
`define MemAddr addr[11:2]
module DM(
    input [31:0] pc,
    input clk,
    input reset,
    input MemWrite,
    input [31:0] addr,
    input [31:0] din,
    // MemOut
    output [31:0] dout
    );
    
    reg [31:0] DataMem [0:1023];
    
    integer i;
    
    initial begin
        for (i = 0; i < 1024; i = i + 1) begin
            DataMem[i] = 32'b0;
        end
    end
    
    assign dout = DataMem[`MemAddr];
    
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 1024; i = i + 1) begin
                DataMem[i] <= 32'b0;
            end
        end
        else if (MemWrite) begin
            if (`MemAddr >= 0) begin
                DataMem[`MemAddr] <= din;
                $display("%d@%h: *%h <= %h", $time, pc, addr, din);
            end
        end
    end

endmodule

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
module DM(
    input [31:0]    pc,
    input           clk,
    input           reset,
    input           MemWrite,
    input [31:0]    addr,
    input [31:0]    din,
    input [3:0]     BE,
    // MemOut
    output reg [31:0] dout
    );
    
    `define MemSize 4096
    `define TargetWord DataMem[ addr[13:2] ]

    reg [31:0] DataMem [0:`MemSize - 1];
    
    integer i;
    
    initial begin
        for (i = 0; i < `MemSize; i = i + 1) begin
            DataMem[i] = 32'b0;
        end
    end
    
    wire [31:0] storeData;
    assign storeData =  BE == 4'b1111 ? din :
                        BE == 4'b0011 ? {`TargetWord[31:16], din[15:0]} :
                        BE == 4'b1100 ? {din[15:0], `TargetWord[15:0]} :
                        BE == 4'b0001 ? {`TargetWord[31:8], din[7:0]} :
                        BE == 4'b0010 ? {`TargetWord[31:16], din[7:0], `TargetWord[7:0]} :
                        BE == 4'b0100 ? {`TargetWord[31:24], din[7:0], `TargetWord[15:0]} :
                        BE == 4'b1000 ? {din[7:0], `TargetWord[23:0]} :
                                        `TargetWord[31:0] ;
    
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < `MemSize; i = i + 1) begin
                DataMem[i] <= 32'b0;
            end
        end
        else if (MemWrite) begin
            if (addr >= 0) begin
                `TargetWord <= storeData;
//                $display("@%h: *%h <= %h", pc, {addr[31:2], 2'b0}, storeData);
                $display("%d@%h: *%h <= %h", $time, pc, {addr[31:2], 2'b0}, storeData);
            end
            else begin
                `TargetWord <= `TargetWord;
            end
        end
    end
    
    // set output
    always @(*) begin
        dout = `TargetWord;
    end

endmodule

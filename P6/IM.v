`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:57:56 11/17/2018 
// Design Name: 
// Module Name:    IM 
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
`define IMsize 4096
module IM(
    input [31:0] addr,
    // output
    output [31:0] Instr
    );

    integer i;

    reg [31:0] code [0:`IMsize - 1];
        
    initial begin
        for (i = 0; i < `IMsize; i = i + 1) begin
            code[i] = 0;
        end
        $readmemh("m.txt", code);
//        $readmemh("hazard.txt", code);
//        $readmemh("code.txt", code);
//        $readmemh("cal.txt", code);
//        $readmemh("load_store.txt", code);
//        $readmemh("MD.txt", code);
//        $readmemh("test1.txt", code);
//        $readmemh("test2.txt", code);
//        $readmemh("sort.txt", code);
    end
    
    wire [31:0] realAddr = addr - 32'h3000;
    
    assign Instr = code[ realAddr[13:2] ];
    
endmodule

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
`define IMsize 1024
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
//        $readmemh("code.txt", code);
        //$readmemh("testagain.txt", code);
        //$readmemh("addu_ht.txt", code);
        //$readmemh("delay.txt", code);
        //$readmemh("hazard1.txt", code);
        //$readmemh("addu_subu_ori_lui.txt", code);
        //$readmemh("branch_j.txt", code);
        //$readmemh("lw_sw.txt", code);
        $readmemh("jal_jr_beq.txt", code);
        //$readmemh("j.txt", code);
    end
    
    assign Instr = code[ addr[11:2] ];
    
endmodule

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
    input [11:2] addr,
    // output
    output [31:0] Instr
    );

    reg [31:0] code [0:`IMsize - 1];
    
    //integer i;
    
    initial begin
        /*
        for (i = 0; i < `IMsize; i = i + 1) begin
            code[i] = 32'h0000_0000;
        end
        */
        //$readmemh("code.txt", code);
        $readmemh("hazard1.txt", code);
        //$readmemh("addu_subu_ori_lui.txt", code);
        //$readmemh("ori_lui.txt", code);
        //$readmemh("lw_sw.txt", code);
        //$readmemh("jal_jr_beq.txt", code);
        //$readmemh("j.txt", code);
    end
    
    assign Instr = code[addr];
    
endmodule

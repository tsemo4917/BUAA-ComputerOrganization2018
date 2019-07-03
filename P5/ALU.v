`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:16:11 11/16/2018 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUOp,
    // output
    output [31:0] ALUOut
    );
    
    assign ALUOut = ALUOp == 4'b0000 ?  A + B :
                    ALUOp == 4'b0001 ?  A - B :
                    ALUOp == 4'b0010 ?  A | B :
                    ALUOp == 4'b0011 ?  B << A[4:0] :
                                        32'b0 ;

endmodule

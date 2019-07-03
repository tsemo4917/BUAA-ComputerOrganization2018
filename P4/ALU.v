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
    input [2:0] ALUOp,
    // output
    output [31:0] ALUout,
    output zero
    );

    //wire smaller = $signed(A) > B;
    assign zero = (A == B);
    //assign zero = ~|(A - B);
    
    assign ALUout = ALUOp == 3'b000 ?   A + B :
                    ALUOp == 3'b001 ?   A - B :
                    ALUOp == 3'b010 ?   A | B :
                    ALUOp == 3'b011 ?   B << A[4:0] : 
                                        32'b0 ;

endmodule

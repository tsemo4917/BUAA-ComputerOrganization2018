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
    input [31:0]    A,
    input [31:0]    B,
    input [3:0]     ALUOp,
    // output
    output [31:0]   ALUOut,
    output          Overflow
    );
    
    wire [32:0] temp;
    assign temp =   ALUOp == 4'b0000 ?  {A[31], A} + {B[31], B} :
                    ALUOp == 4'b0001 ?  {A[31], A} - {B[31], B} :
                                        33'b0 ;
    
    assign Overflow = (temp[32] ^ temp[31]);
    
    assign ALUOut = ALUOp == 4'b0000 ?  A + B :
                    ALUOp == 4'b0001 ?  A - B :
                    ALUOp == 4'b0010 ?  A | B :
                    ALUOp == 4'b0011 ?  A & B :
                    ALUOp == 4'b0100 ?  A ^ B :
                    ALUOp == 4'b0101 ?  ~(A | B) :
                    ALUOp == 4'b0110 ?  B << A[4:0] :
                    ALUOp == 4'b0111 ?  B >> A[4:0] :
                    ALUOp == 4'b1000 ?  $signed($signed(B) >>> A[4:0]) :
                    ALUOp == 4'b1001 ?  {31'b0, $signed(A) < $signed(B)} :
                    ALUOp == 4'b1010 ?  {31'b0, $unsigned(A) < $unsigned(B)} :
                                        32'bx ;

endmodule

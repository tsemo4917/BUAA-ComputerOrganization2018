`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:02:00 11/25/2018 
// Design Name: 
// Module Name:    CMP 
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
module CMP(
    input [31:0]    DataA,
    input [31:0]    DataB,
    // output
    output [2:0]    CMPrst
    );
    
    assign CMPrst[0] = (DataA == DataB);            // ==
	assign CMPrst[1] = ~DataA[31];                  // >=0 DataA[31] == 0
	assign CMPrst[2] = (DataA == 0);                // ==0

endmodule

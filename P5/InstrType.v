`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:41:59 11/27/2018 
// Design Name: 
// Module Name:    InstrType 
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
module InstrType(
    input [31:0] instr,
    // output 
    output Cal_r,
	output Cal_i,
    output branch,
    output load,
    output store,
    output jr,
    output linkRa,
    output jalr
    );

    wire [5:0] Op, func;
    assign Op = instr[31:26];
    assign func = instr[5:0];

    /****************** P5 ********************/
    assign Rtype =  (Op == 6'b000000);
    assign ori =    (Op == 6'b001101);
    assign lw =     (Op == 6'b100011);
    assign sw =     (Op == 6'b101011);
    assign beq =    (Op == 6'b000100);
    assign lui =    (Op == 6'b001111);
    assign jal =    (Op == 6'b000011);
    //assign j =      (Op == 6'b000010);
    assign addiu =  (Op == 6'b001001);
    
    // R type
    assign jr =     (Rtype && func == 6'b001000);
    assign jalr =   (Rtype && func == 6'b001001);
    assign addu =   (Rtype && func == 6'b100001);
    assign subu =   (Rtype && func == 6'b100011);
    assign sll =    (Rtype && func == 6'b000000);       // nop

    // set output
    assign Cal_r =      (addu || subu || sll);
    assign Cal_i =      (ori || lui || addiu);
    assign branch =     beq;
    assign load =       lw;
    assign store =      sw;
    assign linkRa =     jal;
    //assign jumpReg =    jalr || jr;

endmodule

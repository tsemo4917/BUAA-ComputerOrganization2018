`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:50 11/17/2018 
// Design Name: 
// Module Name:    mux 
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
module mux_8(data0, data1, data2, data3, data4, data5, data6, data7, sel, dataOut);
    parameter width = 32;
    input [width - 1:0] data0, data1, data2, data3, data4, data5, data6, data7;
    input [2:0] sel;
    output [width - 1:0] dataOut;

    assign dataOut =    sel == 3'b000 ? data0 :
                        sel == 3'b001 ? data1 :
                        sel == 3'b010 ? data2 :
                        sel == 3'b011 ? data3 :
                        sel == 3'b100 ? data4 :
                        sel == 3'b101 ? data5 :
                        sel == 3'b110 ? data6 :
                                        data7 ;
                        
endmodule

module mux_4(data0, data1, data2, data3, sel, dataOut);
    parameter width = 8;
    input [width - 1:0] data0, data1, data2, data3;
    input [1:0] sel;
    output [width - 1:0] dataOut;

    assign dataOut =    sel == 2'b00 ?  data0 :
                        sel == 2'b01 ?  data1 :
                        sel == 2'b10 ?  data2 :
                                        data3 ;
endmodule

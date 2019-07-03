`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:09:15 12/13/2018 
// Design Name: 
// Module Name:    CoProcessor0 
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
`include "head_def.v"
module Coprocessor0(
    input           reset,
    input           clk,
    input [31:0]    instr,
    input [4:0]     A1,         // read CP0 register  mfc0
    input [4:0]     A2,         // write CP0 register mtc0
    input [31:0]    din,
    input [31:0]    PC,
    input [6:2]     ExcCode,
    input [7:2]     HWInt,
    input           WE,
    // SR
    input           EXLSet,
    input           EXLClr,
    // output
    output          IntReq,
    output [31:0]   EPC,
    output [31:0]   dout 
    );

    // SR   11
    reg [15:10] im;
    reg exl, ie;
    wire [31:0] SR = {16'b0, im, 8'b0, exl, ie};
    // Cause 12
    reg BD;
    reg [15:10] hwint_pend;
    reg [6:2] exceptionCode;
    wire [31:0] Cause = {BD, 15'b0, hwint_pend, 3'b0, exceptionCode, 2'b0};
    // epc  13
    reg [31:0] epcReg;
    // PRId 14
//    reg [31:0] PRId;

    initial begin
        // SR
        im      <= 6'b0;
        exl     <= 1'b0;
        ie      <= 1'b0;
        // Cause
        BD      <= 1'b0;
        hwint_pend <= 6'b0;
        exceptionCode <= 5'b0;
        epcReg  <= 32'b0;
//        PRId    <= 32'h1737_3552;
    end
    
    assign bORj =   (`beq || `bne || `blez || `bltz || `bgez || `bgtz ||
                    `j || `jal || `jalr || `jr);

    always @(posedge clk) begin
        if (reset) begin
            im      <= 6'b0;
            exl     <= 1'b0;
            ie      <= 1'b0;
            BD      <= 1'b0;
            hwint_pend <= 6'b0;
            exceptionCode <= 5'b0;
            epcReg  <= 32'b0;
//            PRId    <= 32'h1737_3552;
        end
        else begin
            if (WE) begin // mtc0
                case (A2)
                    5'd12 :     {im, exl, ie} <= {din[15:10], din[1:0]};  // SR
//                    5'd14 :     epcReg <=  {din[31:2], 2'b0};
//                    default :   PRId <= 32'h1737_3552;
                    default :   epcReg <=  {din[31:2], 2'b0};
                endcase 
            end
            else begin
                if (~exl) begin
//                if (IntReq) begin
                    BD <= bORj;
                    hwint_pend  <= HWInt;
                    exceptionCode   <= ExcCode;
                    epcReg      <= bORj ? {PC[31:2], 2'b0} - 4 : {PC[31:2], 2'b0};
                end
//                exl <= (EXLSet & ~EXLClr);
                if (EXLClr) begin
                    exl <= 1'b0;
                end
                if (EXLSet) begin
                    exl <= 1'b1;
                end
            end
        end
    end

    // set output
    assign IntReq   =   ((|(HWInt & im)) & ie & ~exl) || (ExcCode > 0);

    assign EPC      =   epcReg;

    assign dout     =   A1 == 5'd12 ?   SR :
                        A1 == 5'd13 ?   Cause :
                        A1 == 5'd14 ?   epcReg :
                        A1 == 5'd15 ?   32'h1737_3552 :
                                        32'b0;


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:36:37 12/04/2018 
// Design Name: 
// Module Name:    ALUMD 
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
module ALUMD(
    input clk,
    input reset,
    input Start,
    input [31:0] DataA,
    input [31:0] DataB,
    input [2:0] MDctrl,
    output Busy,
    output reg [31:0] HI,
    output reg [31:0] LO
    );
    
    reg[31:0] tmpHI, tmpLO;
	integer count;
	
	initial begin
		count = 0;
		HI = 0;
		LO = 0;
		tmpHI = 0;
		tmpLO = 0;
	end
	
	wire mult, multu, div, divu, mtlo, mthi;
	assign mult =   (MDctrl == 3'b001);
	assign multu =  (MDctrl == 3'b010);
	assign div =    (MDctrl == 3'b011);
	assign divu =   (MDctrl == 3'b100);
    assign mthi =   (MDctrl == 3'b101);
	assign mtlo =   (MDctrl == 3'b110);
    
	wire[63:0] signedDataA, signedDataB;
	assign signedDataA = { { 32{ DataA[31] } }, DataA};
	assign signedDataB = { { 32{ DataB[31] } }, DataB};
    
	wire [31:0] divLO;
//    assign divLO = divu ? DataA / DataB : $signed(DataA) / $signed(DataB);
	assign divLO =  (divu || (~DataA[31] && ~DataB[31]))    ?   DataA / DataB :         //positive and positive
                    (DataA[31] & DataB[31])                 ?   (-DataA) / (-DataB) :   //negative and negative
                    (DataA[31] & ~DataB[31])                ?   -((-DataA) / DataB) :   //A is negative
                                                                -(DataA / (-DataB)) ;   //B is negative
	
	always @(posedge clk) begin
		if (reset) begin
			count <= 0;
			HI <= 0;
			LO <= 0;
			tmpHI <= 0;
			tmpLO <= 0;
		end 
        else begin
            if((mult || multu) && Start) begin
                count <= 5;
                {tmpHI, tmpLO} <= multu ? (DataA * DataB) : (signedDataA * signedDataB);																
            end 
            else if ((div || divu) && Start) begin
                count <= 10;
                if (DataB != 0) begin
                    tmpLO <= divLO;
                    tmpHI <= DataA - divLO * DataB;
                end
                else begin
                    tmpLO <= LO;
                    tmpHI <= HI;
                end
            end 
            else if (mtlo) begin
                LO <= DataA;
            end 
            else if (mthi) begin
                HI <= DataA;
            end 
            else if (Busy) begin
                if (count == 1) begin
                    count <= count - 1;
                    HI <= tmpHI;
                    LO <= tmpLO;
                end
                else begin
                    count <= count - 1;
                end
            end
		end
	end
    // set output
    assign Busy = (count > 0 && ~Start);

endmodule

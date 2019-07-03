`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:43:16 12/26/2018
// Design Name:   ALUMD
// Module Name:   D:/ise_project/P6new/xalu_tb.v
// Project Name:  P6new
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUMD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module xalu_tb;

	// Inputs
	reg clk;
	reg reset;
	reg Start;
	reg [31:0] DataA;
	reg [31:0] DataB;
	reg [2:0] MDctrl;

	// Outputs
	wire Busy;
	wire [31:0] HI;
	wire [31:0] LO;

	// Instantiate the Unit Under Test (UUT)
	ALUMD uut (
		.clk(clk), 
		.reset(reset), 
		.Start(Start), 
		.DataA(DataA), 
		.DataB(DataB), 
		.MDctrl(MDctrl), 
		.Busy(Busy), 
		.HI(HI), 
		.LO(LO)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		Start = 0;
		DataA = 0;
		DataB = 0;
		MDctrl = 0;

		// Wait 100 ns for global reset to finish
		#100;
        MDctrl = 3'b011;
        DataA = 32'h3a018d36;
        DataB = 32'hf230f234;
        Start = 1'b1;
		// Add stimulus here
        #10;
        Start = 1'b0;
	end
    
    always #5 clk = ~clk;
      
endmodule


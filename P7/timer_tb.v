`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:34:04 12/17/2018
// Design Name:   timer
// Module Name:   D:/ise_project/P7/timer_tb.v
// Project Name:  P7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: timer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module timer_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [3:2] addr;
	reg WE;
	reg [31:0] din;

	// Outputs
	wire [31:0] dataOut;
	wire IRQ;

	// Instantiate the Unit Under Test (UUT)
	timer uut (
		.clk(clk), 
		.reset(reset), 
		.addr(addr), 
		.WE(WE), 
		.din(din), 
		.dataOut(dataOut), 
		.IRQ(IRQ)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		addr = 0;
		WE = 0;
		din = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
        WE = 1;
        din = 5;
        addr = 1;
        #15;
        WE = 1;
        din = 32'b1001;
        addr = 0;
        
        #20;
        WE = 0;
        #200;
        WE = 1;
        din = 32'b1011;
        addr = 0;
        #20;
        WE = 0;
    
	end
    
    always #5 clk = ~clk;
      
endmodule


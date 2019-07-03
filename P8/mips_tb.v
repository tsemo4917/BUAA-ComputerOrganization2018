`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:47:42 12/25/2018
// Design Name:   mips
// Module Name:   D:/ise_project/P8_totalCtrl/mips_tb.v
// Project Name:  P8_totalCtrl
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mips_tb;

	// Inputs
	reg sys_rstn;
	reg clk_in;
	reg uart_rxd;
	reg [7:0] dip_switch0;
	reg [7:0] dip_switch1;
	reg [7:0] dip_switch2;
	reg [7:0] dip_switch3;
	reg [7:0] dip_switch4;
	reg [7:0] dip_switch5;
	reg [7:0] dip_switch6;
	reg [7:0] dip_switch7;
	reg [7:0] user_key;

	// Outputs
    wire uart_txd;
	wire [31:0] led_light;
	wire [7:0] digital_tube2;
	wire digital_tube_sel2;
	wire [7:0] digital_tube1;
	wire [3:0] digital_tube_sel1;
	wire [7:0] digital_tube0;
	wire [3:0] digital_tube_sel0;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.sys_rstn(sys_rstn), 
		.clk_in(clk_in), 
		.uart_rxd(uart_rxd), 
		.dip_switch0(dip_switch0), 
		.dip_switch1(dip_switch1), 
		.dip_switch2(dip_switch2), 
		.dip_switch3(dip_switch3), 
		.dip_switch4(dip_switch4), 
		.dip_switch5(dip_switch5), 
		.dip_switch6(dip_switch6), 
		.dip_switch7(dip_switch7), 
        .uart_txd(uart_txd), 
		.user_key(user_key), 
		.led_light(led_light), 
		.digital_tube2(digital_tube2), 
		.digital_tube_sel2(digital_tube_sel2), 
		.digital_tube1(digital_tube1), 
		.digital_tube_sel1(digital_tube_sel1), 
		.digital_tube0(digital_tube0), 
		.digital_tube_sel0(digital_tube_sel0)
	);

	initial begin
		// Initialize Inputs
		sys_rstn = 0;
		clk_in = 0  ;
		uart_rxd = "A";
		dip_switch0 = 0;
		dip_switch1 = 0;
		dip_switch2 = 0;
		dip_switch3 = 0;
		dip_switch4 = 0;
		dip_switch5 = 0;
		dip_switch6 = 0;
		dip_switch7 = 0;
		user_key = 0;

		// Wait 100 ns for global reset to finish
		#100;
                
		// Add stimulus here
        user_key = ~8'd1;
        dip_switch0 = ~8'hc3;
		dip_switch1 = ~8'h00;
		dip_switch2 = ~8'h00;
		dip_switch3 = ~8'h00;
		dip_switch4 = ~8'h44;
		dip_switch5 = ~8'h00;
		dip_switch6 = ~8'h00;
		dip_switch7 = ~8'h00;
        sys_rstn = 1;
        
        #5000;
        dip_switch0 = ~8'h12;
		dip_switch1 = ~8'h00;
		dip_switch2 = ~8'h00;
		dip_switch3 = ~8'h00;
        
	end
    
    always #2 clk_in = ~clk_in;
      
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:22:06 07/07/2023
// Design Name:   AXI4Lite2RegRW
// Module Name:   D:/SVN_Path/DevKitProjects/Z7/Dev/02_DDR_AR0135_LCD_Test/src/axil/AXI4Lite2RegRW_tb.v
// Project Name:  DDR_AR0135_LCD_Test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AXI4Lite2RegRW
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AXI4Lite2RegRW_tb;

	// Inputs
	reg clk_i;
	reg rst_i;
	reg [15:0] awaddr_i;
	reg awvalid_i;
	reg [31:0] wdata_i;
	reg [3:0] wstrb_i;
	reg wvalid_i;
	reg bready_i;
	reg [15:0] araddr_i;
	reg arvalid_i;
	reg rready_i;
	reg [31:0] dev_rdata_i;

	// Outputs
	wire awready_o;
	wire wready_o;
	wire [1:0] bresp_o;
	wire bvalid_o;
	wire arready_o;
	wire [31:0] rdata_o;
	wire [1:0] rresp_o;
	wire rvalid_o;
	wire [7:0] dev_index_o;
	wire [7:0] dev_cmd_o;
	wire [31:0] dev_wdata_o;
	wire [3:0] dev_wvalid_be_o;
	wire dev_wvalid_o;
	wire dev_rvalid_o;

	// Instantiate the Unit Under Test (UUT)
	AXI4Lite2RegRW uut (
		.clk_i(clk_i), 
		.rst_i(rst_i), 
		.awaddr_i(awaddr_i), 
		.awvalid_i(awvalid_i), 
		.awready_o(awready_o), 
		.wdata_i(wdata_i), 
		.wstrb_i(wstrb_i), 
		.wvalid_i(wvalid_i), 
		.wready_o(wready_o), 
		.bresp_o(bresp_o), 
		.bvalid_o(bvalid_o), 
		.bready_i(bready_i), 
		.araddr_i(araddr_i), 
		.arvalid_i(arvalid_i), 
		.arready_o(arready_o), 
		.rdata_o(rdata_o), 
		.rresp_o(rresp_o), 
		.rvalid_o(rvalid_o), 
		.rready_i(rready_i), 
		.dev_index_o(dev_index_o), 
		.dev_cmd_o(dev_cmd_o), 
		.dev_wdata_o(dev_wdata_o), 
		.dev_wvalid_be_o(dev_wvalid_be_o), 
		.dev_wvalid_o(dev_wvalid_o), 
		.dev_rvalid_o(dev_rvalid_o), 
		.dev_rdata_i(dev_rdata_i)
	);

	initial begin
		// Initialize Inputs
		clk_i = 0;
		rst_i = 1;
		awaddr_i = 0;
		awvalid_i = 0;
		wdata_i = 0;
		wstrb_i = 0;
		wvalid_i = 0;
		bready_i = 0;
		araddr_i = 0;
		arvalid_i = 0;
		rready_i = 0;
		dev_rdata_i = 0;

		// Wait 100 ns for global reset to finish
		#100; rst_i = 0; #96; 
        
		awaddr_i = 16'h0408; wdata_i = $random; awvalid_i = 1; wstrb_i = 4'b1011; wvalid_i = 1; #10; while(~wready_o) #10; #10; awvalid_i = 0; wvalid_i = 0; 
		araddr_i = 16'h0C04; arvalid_i = 1; #10; while(~arready_o) #10; #10; arvalid_i = 0; rready_i = 1; while(~rvalid_o) #10; #10; rready_i = 0; 

	end
	
	always @(posedge clk_i) begin
		if(bvalid_o) begin #21; bready_i = 1; #10; bready_i = 0; end 
	end
	
	always #5 clk_i = ~clk_i; 
      
endmodule


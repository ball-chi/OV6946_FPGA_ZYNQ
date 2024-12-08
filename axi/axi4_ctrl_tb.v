`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:42:17 05/27/2023
// Design Name:   axi4_ctrl
// Module Name:   D:/SVN_Path/DevKitProjects/PH100/Dev/08_CMOS_AR0135_HDMI_720P/src/axi4_ctrl_tb.v
// Project Name:  CMOS_AR0135_HDMI_720P
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: axi4_ctrl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module axi4_ctrl_tb;

	// Inputs
	reg axi_clk;
	reg axi_reset;
	reg axi_awready;
	reg axi_wready;
	reg [3:0] axi_bid;
	reg [1:0] axi_bresp;
	reg axi_bvalid;
	reg axi_arready;
	reg [3:0] axi_rid;
	reg [255:0] axi_rdata;
	reg [1:0] axi_rresp;
	reg axi_rlast;
	reg axi_rvalid;
	reg wframe_pclk;
	reg wframe_vsync;
	reg wframe_data_en;
	reg [63:0] wframe_data;
	reg rframe_pclk;
	reg rframe_vsync;
	reg rframe_data_en;

	// Outputs
	wire [3:0] axi_awid;
	wire [29:0] axi_awaddr;
	wire [3:0] axi_awlen;
	wire [2:0] axi_awsize;
	wire [1:0] axi_awburst;
	wire axi_awlock;
	wire [3:0] axi_awcache;
	wire [2:0] axi_awprot;
	wire [3:0] axi_awqos;
	wire axi_awvalid;
	wire [255:0] axi_wdata;
	wire [15:0] axi_wstrb;
	wire axi_wlast;
	wire axi_wvalid;
	wire axi_bready;
	wire [3:0] axi_arid;
	wire [29:0] axi_araddr;
	wire [3:0] axi_arlen;
	wire [2:0] axi_arsize;
	wire [1:0] axi_arburst;
	wire axi_arlock;
	wire [3:0] axi_arcache;
	wire [2:0] axi_arprot;
	wire [3:0] axi_arqos;
	wire axi_arvalid;
	wire axi_rready;
	parameter C_R_WIDTH = 8; 
	wire [C_R_WIDTH-1:0] rframe_data;

	// Instantiate the Unit Under Test (UUT)
	axi4_ctrl #(.C_W_WIDTH(32), .C_R_WIDTH(C_R_WIDTH)) uut (
		.axi_clk(axi_clk), 
		.axi_reset(axi_reset), 
		.axi_awid(axi_awid), 
		.axi_awaddr(axi_awaddr), 
		.axi_awlen(axi_awlen), 
		.axi_awsize(axi_awsize), 
		.axi_awburst(axi_awburst), 
		.axi_awlock(axi_awlock), 
		.axi_awcache(axi_awcache), 
		.axi_awprot(axi_awprot), 
		.axi_awqos(axi_awqos), 
		.axi_awvalid(axi_awvalid), 
		.axi_awready(axi_awready), 
		.axi_wdata(axi_wdata), 
		.axi_wstrb(axi_wstrb), 
		.axi_wlast(axi_wlast), 
		.axi_wvalid(axi_wvalid), 
		.axi_wready(axi_wready), 
		.axi_bid(axi_bid), 
		.axi_bresp(axi_bresp), 
		.axi_bvalid(axi_bvalid), 
		.axi_bready(axi_bready), 
		.axi_arid(axi_arid), 
		.axi_araddr(axi_araddr), 
		.axi_arlen(axi_arlen), 
		.axi_arsize(axi_arsize), 
		.axi_arburst(axi_arburst), 
		.axi_arlock(axi_arlock), 
		.axi_arcache(axi_arcache), 
		.axi_arprot(axi_arprot), 
		.axi_arqos(axi_arqos), 
		.axi_arvalid(axi_arvalid), 
		.axi_arready(axi_arready), 
		.axi_rid(axi_rid), 
		.axi_rdata(axi_rdata), 
		.axi_rresp(axi_rresp), 
		.axi_rlast(axi_rlast), 
		.axi_rvalid(axi_rvalid), 
		.axi_rready(axi_rready), 
		.wframe_pclk(wframe_pclk), 
		.wframe_vsync(wframe_vsync), 
		.wframe_data_en(wframe_data_en), 
		.wframe_data(wframe_data), 
		.rframe_pclk(rframe_pclk), 
		.rframe_vsync(rframe_vsync), 
		.rframe_data_en(rframe_data_en), 
		.rframe_data(rframe_data)
	);

	initial begin
		// Initialize Inputs
		axi_clk = 0;
		axi_reset = 1;
		axi_awready = 1;
		axi_wready = 1;
		axi_bid = 0;
		axi_bresp = 0;
		axi_bvalid = 1;
		axi_arready = 0;
		axi_rid = 0;
		axi_rdata = {32'd7, 32'd6, 32'd5, 32'd4, 32'd3, 32'd2, 32'd1, 32'd0};
		axi_rresp = 0;
		axi_rlast = 0;
		axi_rvalid = 0;
		wframe_pclk = 0;
		wframe_vsync = 0;
		wframe_data_en = 0;
		wframe_data = 0;
		rframe_pclk = 0;
		rframe_vsync = 0;
		rframe_data_en = 0;

		// Wait 100 ns for global reset to finish
		#100; axi_reset = 0; #96; 
        
		// Add stimulus here

	end
	
	always #5 axi_clk = ~axi_clk; 
	always #5 wframe_pclk = ~wframe_pclk; 
	always #5 rframe_pclk = ~rframe_pclk; 
	
	always @(posedge axi_clk) begin
		if(axi_arvalid) begin
			#41; axi_arready = 1; #10; axi_arready = 0; #80; axi_rvalid = 1; #150; axi_rlast = 1; #10; axi_rlast = 0; axi_rvalid = 0; #60; 
		end else begin
		end
	end
	always @(posedge axi_clk) begin
		if(axi_rvalid) begin
			#1;
			axi_rdata[(0+1)*32-1:0*32] = axi_rdata[(0+1)*32-1:0*32] + 8; 
			axi_rdata[(1+1)*32-1:1*32] = axi_rdata[(1+1)*32-1:1*32] + 8; 
			axi_rdata[(2+1)*32-1:2*32] = axi_rdata[(2+1)*32-1:2*32] + 8; 
			axi_rdata[(3+1)*32-1:3*32] = axi_rdata[(3+1)*32-1:3*32] + 8; 
			axi_rdata[(4+1)*32-1:4*32] = axi_rdata[(4+1)*32-1:4*32] + 8; 
			axi_rdata[(5+1)*32-1:5*32] = axi_rdata[(5+1)*32-1:5*32] + 8; 
			axi_rdata[(6+1)*32-1:6*32] = axi_rdata[(6+1)*32-1:6*32] + 8; 
			axi_rdata[(7+1)*32-1:7*32] = axi_rdata[(7+1)*32-1:7*32] + 8; 
		end
	end
	
	always begin
		#6400; 
		wframe_vsync = 1; #50; wframe_data_en = 1; #25620; wframe_data_en = 0; #640; wframe_vsync = 0; 
	end
	always begin
		#6400; 
		rframe_vsync = 1; #12800; rframe_data_en = 1; #128000; rframe_vsync = 0; rframe_data_en = 0; 
	end
	always @(posedge wframe_pclk) begin
		if(wframe_data_en) #1 wframe_data <= wframe_data + 1; 
	end
	
	//GTP_GRS GRS_INST (.GRS_N(~axi_reset)); 
      
endmodule


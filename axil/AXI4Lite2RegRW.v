`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    11:05:25 07/07/2023 
// Module Name:    AXI4Lite2RegRW 
//////////////////////////////////////////////////////////////////////////////////
module AXI4Lite2RegRW #(
	parameter 	ADDR_WIDTH 	= 16		//	64KB memory region by default. Data is always 32 bits. Address is aligned to 4 bytes. 
)(
	input 			clk_i,
	input 			rst_i,
	
	input 	[ADDR_WIDTH-1:0] 	awaddr_i,
	input 				awvalid_i,
	output reg				awready_o,
	
	input 	[31:0] 	wdata_i,
	input 	[3:0] 	wstrb_i,
	input 			wvalid_i,
	output reg			wready_o,
	
	output 	[1:0] 	bresp_o,
	output reg			bvalid_o,
	input 			bready_i,
	
	input 	[ADDR_WIDTH-1:0] 	araddr_i,
	input 				arvalid_i,
	output reg				arready_o,
	
	output 	[31:0] 	rdata_o,
	output 	[1:0] 	rresp_o,
	output reg			rvalid_o,
	input 			rready_i,
	
	output reg	[7:0] 	dev_index_o,
	output reg	[7:0] 	dev_cmd_o,
	output reg	[31:0] 	dev_wdata_o,
	output reg	[3:0]		dev_wvalid_be_o,	//	Byte-Write-Enable.
	output reg			dev_wvalid_o,
	output reg			dev_rvalid_o,
	input 	[31:0] 	dev_rdata_i
);
	
	initial begin
		awready_o <= 0; 
		wready_o <= 0; 
		bvalid_o <= 0; 
		arready_o <= 0; 
		rvalid_o <= 0; 
		
		dev_wvalid_be_o <= 0; 
		dev_wvalid_o <= 0; 
		dev_rvalid_o <= 0; 
		
		dev_index_o <= 0; 
		dev_cmd_o <= 0; 
		dev_wdata_o <= 0; 
	end
	assign bresp_o = 0; 
	assign rresp_o = 0; 
	
	
	reg 	[3:0] 	rs_rw = 0; 
	wire 	[3:0] 	ws_rw_init = 0; 
	wire 	[3:0] 	ws_rw_idle = 1; 
	wire 	[3:0] 	ws_rw_wr0 = 2; 
	wire 	[3:0] 	ws_rw_rd0 = 3; 
	wire 	[3:0] 	ws_rw_rd1 = 4; 
	
	reg 	[3:0] 	rc_rw_init = 0; 
	
	always @(posedge clk_i) begin
		rs_rw <= rs_rw; 
		awready_o <= 0; 
		wready_o <= 0; 
		arready_o <= 0; 
		
		dev_wvalid_be_o <= 0; 
		dev_wvalid_o <= 0; 
		dev_rvalid_o <= 0; 
		
		case (rs_rw)
			ws_rw_init: begin
					rc_rw_init <= rc_rw_init + 1; 
					if(&rc_rw_init)
						rs_rw <= ws_rw_idle; 
				end
			ws_rw_idle: begin
					//	Support back-to-back write requests. 
					if(awvalid_i && wvalid_i) begin
						dev_index_o <= {32'h0, awaddr_i[ADDR_WIDTH-1:10]}; 
						dev_cmd_o <= awaddr_i[9:2]; 
						dev_wdata_o <= wdata_i; 
						dev_wvalid_be_o <= wstrb_i; 
						dev_wvalid_o <= 1; 
						awready_o <= 1; 
						wready_o <= 1; 
						bvalid_o <= 1; 
						rs_rw <= ws_rw_wr0; 
						
					end else if(arvalid_i) begin
						dev_index_o <= {32'h0, araddr_i[ADDR_WIDTH-1:10]}; 
						dev_cmd_o <= araddr_i[9:2]; 
						dev_rvalid_o <= 1; 
						arready_o <= 1; 
						rs_rw <= ws_rw_rd0; 
						
					end else begin
					end
				end
			ws_rw_wr0: begin
					//	Wait for bready_i to assert. 
					if(bready_i) begin
						bvalid_o <= 0; 
						rs_rw <= ws_rw_idle; 
					end else begin
					end
				end
			ws_rw_rd0: begin
					//	Delay for 1 cycle for data to be ready. It's assumed data to be updated when rvalid_o, and should be ready immediately after. 
					if(~dev_rvalid_o) begin
						rvalid_o <= 1; 
						rs_rw <= ws_rw_rd1; 
					end else begin
					end
				end
			ws_rw_rd1: begin
					if(rready_i) begin
						rvalid_o <= 0; 
						rs_rw <= ws_rw_idle; 
					end else begin
					end
				end
		endcase
		
		if(rst_i) begin
			rs_rw <= 0; 
			rc_rw_init <= 0; 
			bvalid_o <= 0; 
			rvalid_o <= 0; 
		end else begin
		end
	end
	
	assign rdata_o = dev_rdata_i; 
	
	
endmodule

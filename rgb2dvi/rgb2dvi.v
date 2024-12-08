`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    11:23:23 02/27/2022 
// Module Name:    rgb2dvi 
//////////////////////////////////////////////////////////////////////////////////

module rgb2dvi(
	//	Pixel Clock (1X). 
	input 			PixelClk,
	input 			aRst,
	input 			aRst_n, 
	
	input 	[3:0] 	bitflip_i,		//	LVDS Lane Flip. [3]TXC, [2:0]TXD
	input 			oe_i, 		//	Output Enable. 
	
	//	Video Timing Generator (With Data Valid Control)
	input 			vid_pVSync,		//	VSync. High Valid. 
	input 			vid_pHSync,		//	HSync. High Valid. 
	input 			vid_pVDE, 		//	DataValid (Timing). Must be WIDTH + 2. (de & ~dvalid) will send VLG. 
	input 	[23:0] 	vid_pData,		//	RGB Data. [7:0]B(0), [15:8]G(1), [23:16]R(2). 
	
	//	HDMI Serializer (5X). 
	input 	 		SerialClk, 
	output 			TMDS_Clk_p,
	output 			TMDS_Clk_n,
	output 	[2:0] 	TMDS_Data_p,
	output 	[2:0] 	TMDS_Data_n
);
	
	wire 			w_rst = aRst || (~aRst_n); 
	
	wire 	[3:0] 	w_ctl = 4'b0000; 
	
	//////////////////////////////////////////////////////////////////////////////////
	//	TMDS Encoder
	//////////////////////////////////////////////////////////////////////////////////
	
	wire 	[9:0] 	w_tmds_0_enc, w_tmds_1_enc, w_tmds_2_enc; 
	
	tmds_channel enc_0 (
		.clk_pixel			(PixelClk),
		.video_data			(vid_pData[ 7: 0]),
		.data_island_data		(0),
		.control_data		({vid_pVSync, vid_pHSync}),
		.mode				({3'b0, vid_pVDE}),  // Mode select (0 = control, 1 = video, 2 = video guard, 3 = island, 4 = island guard)
		.tmds				(w_tmds_0_enc)
	);
	tmds_channel enc_1 (
		.clk_pixel			(PixelClk),
		.video_data			(vid_pData[15: 8]),
		.data_island_data		(0),
		.control_data		(w_ctl[1:0]),
		.mode				({3'b0, vid_pVDE}),  // Mode select (0 = control, 1 = video, 2 = video guard, 3 = island, 4 = island guard)
		.tmds				(w_tmds_1_enc)
	);
	tmds_channel enc_2 (
		.clk_pixel			(PixelClk),
		.video_data			(vid_pData[23:16]),
		.data_island_data		(0),
		.control_data		(w_ctl[3:2]),
		.mode				({3'b0, vid_pVDE}),  // Mode select (0 = control, 1 = video, 2 = video guard, 3 = island, 4 = island guard)
		.tmds				(w_tmds_2_enc)
	);
	
	
	//////////////////////////////////////////////////////////////////////////////////
	//	Serializer
	//////////////////////////////////////////////////////////////////////////////////
	
	reg 			r_ser_rst = 0;
	reg 	[9:0] 	r_ser_dat0 = 0, r_ser_dat1 = 0, r_ser_dat2 = 0; 
	always @(posedge PixelClk) begin
		r_ser_rst <= w_rst; 
		r_ser_dat0 <= (bitflip_i[0] ? 10'h3FF : 10'h000) ^ w_tmds_0_enc; 
		r_ser_dat1 <= (bitflip_i[1] ? 10'h3FF : 10'h000) ^ w_tmds_1_enc; 
		r_ser_dat2 <= (bitflip_i[2] ? 10'h3FF : 10'h000) ^ w_tmds_2_enc; 
	end
	ODDR10To1 ser_lane0 (
		.clkx_i		(SerialClk),
		.clk_i		(PixelClk),
		.rst_i		(r_ser_rst), 
		.oe_i 		(oe_i), 
		
		.data_i		(r_ser_dat0),	//	Lsb Output First.
		
		.data_p_o		(TMDS_Data_p[0]),
		.data_n_o		(TMDS_Data_n[0])
	);
	ODDR10To1 ser_lane1 (
		.clkx_i		(SerialClk),
		.clk_i		(PixelClk),
		.rst_i		(r_ser_rst), 
		.oe_i 		(oe_i), 
		
		.data_i		(r_ser_dat1),	//	Lsb Output First.
		
		.data_p_o		(TMDS_Data_p[1]),
		.data_n_o		(TMDS_Data_n[1])
	);
	ODDR10To1 ser_lane2 (
		.clkx_i		(SerialClk),
		.clk_i		(PixelClk),
		.rst_i		(r_ser_rst), 
		.oe_i 		(oe_i), 
		
		.data_i		(r_ser_dat2),	//	Lsb Output First.
		
		.data_p_o		(TMDS_Data_p[2]),
		.data_n_o		(TMDS_Data_n[2])
	);
	
	ODDR10To1 ser_lanec (
		.clkx_i		(SerialClk),
		.clk_i		(PixelClk),
		.rst_i		(r_ser_rst), 
		.oe_i 		(oe_i), 
		
		.data_i		(10'b11111_00000),	//	Lsb Output First.
		
		.data_p_o		(TMDS_Clk_p),
		.data_n_o		(TMDS_Clk_n)
	);
	
	
	
endmodule

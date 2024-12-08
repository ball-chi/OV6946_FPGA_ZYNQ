/*-----------------------------------------------------------------------
								 \\\|///
							   \\  - -  //
								(  @ @  )
+-----------------------------oOOo-(_)-oOOo-----------------------------+
CONFIDENTIAL IN CONFIDENCE
This confidential and proprietary software may be only used as authorized
by a licensing agreement from CrazyBingo (Thereturnofbingo).
In the event of publication, the following notice is applicable:
Copyright (C) 2012-20xx CrazyBingo Corporation
The entire notice above must be reproduced on all authorized copies.
Author				:		CrazyBingo
Technology blogs 	: 		www.crazyfpga.com
Email Address 		: 		crazyfpga@vip.qq.com
Filename			:		Sensor_Image_Crop.v
Date				:		2017-06-19
Description			:		Zoom X & Y for Sensor image output.
Modification History	:
Date			By			Version			Change Description
=========================================================================
17/06/19		CrazyBingo	1.0				Original
17/08/19		CrazyBingo	1.1				Modify for X & Y zoom
-------------------------------------------------------------------------
|                                     Oooo								|
+------------------------------oooO--(   )-----------------------------+
                              (   )   ) /
                               \ (   (_/
                                \_)
----------------------------------------------------------------------*/ 

`timescale 1ns / 1ns
module Sensor_Image_XYCrop
#(
	parameter	IMAGE_HSIZE_SOURCE	=	1280,
	parameter	IMAGE_VSIZE_SOURCE	=	1024,
	parameter	IMAGE_HSIZE_TARGET 	= 	1280,
	parameter	IMAGE_YSIZE_TARGET	= 	960,
	parameter 	PIXEL_DATA_WIDTH 	= 	64
)
(
	//globel clock
	input				clk,				//image pixel clock
	input				rst_n,				//system reset
	
	//CMOS Sensor interface
	input								image_in_vsync,		//H : Data Valid; L : Frame Sync(Set it by register)
	input								image_in_href,		//H : Data vaild, L : Line Sync
	input								image_in_de,		//H : Data Enable, L : Line Sync
	input		[PIXEL_DATA_WIDTH-1:0]	image_in_data,		//8 bits cmos data input
	
	output								image_out_vsync,	//H : Data Valid; L : Frame Sync(Set it by register)
	output								image_out_href,		//H : Data vaild, L : Line Sync
	output								image_out_de,		//H : Data Enable, L : Line Sync
	output		[PIXEL_DATA_WIDTH-1:0]	image_out_data		//8 bits cmos data input	
);


//-----------------------------------
//Generate href negedge signal
reg							image_in_href_r;
reg 						image_in_de_r; 
reg							image_in_vsync_r;
reg	[PIXEL_DATA_WIDTH-1:0]	image_in_data_r;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
		image_in_vsync_r <= 0;
		image_in_href_r <= 0;
		image_in_data_r <= 0;
		image_in_de_r <= 0; 
		end
	else
		begin
		image_in_vsync_r <= image_in_vsync;
		image_in_href_r <= image_in_href;
		image_in_data_r <= image_in_data;
		image_in_de_r <= image_in_de; 
		end
end
wire	image_in_href_negedge = (image_in_href_r & ~image_in_href) ? 1'b1 : 1'b0;

	
//-----------------------------------
//Image Ysize Crop
reg	[11:0] image_ypos;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		image_ypos <= 0;
	else if(image_in_vsync == 1'b1)
		begin
		if(image_in_href_negedge == 1'b1)
			image_ypos <= image_ypos + 1'b1;
		else
			image_ypos <= image_ypos;
		end
	else
		image_ypos <= 0;
end
assign	image_out_vsync = image_in_vsync_r;

						   
						   
//-----------------------------------
//Image Hsize Crop
reg	[11:0] image_xpos;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		image_xpos <= 0;
	else if(image_in_href == 1'b1)
		image_xpos <= image_xpos + image_in_de;
	else
		image_xpos <= 0;
end

wire 			w_image_out_href = (image_in_href == 1'b1) && (
								  ((image_ypos >= (IMAGE_VSIZE_SOURCE - IMAGE_YSIZE_TARGET)/2) && 
								   (image_ypos <  (IMAGE_VSIZE_SOURCE - IMAGE_YSIZE_TARGET)/2 + IMAGE_YSIZE_TARGET) &&
								   (image_xpos >= (IMAGE_HSIZE_SOURCE - IMAGE_HSIZE_TARGET)/2) && 
								   (image_xpos <  (IMAGE_HSIZE_SOURCE - IMAGE_HSIZE_TARGET)/2 + IMAGE_HSIZE_TARGET))? 1'b1 : 1'b0);

reg 			image_out_href_r = 0; 
always @(posedge clk) begin	
	image_out_href_r <= w_image_out_href; 
end
assign image_out_href = image_out_href_r; 

assign 	image_out_de = image_in_de_r; 

assign	image_out_data = image_in_data_r;				   


endmodule

/*-------------------------------------------------------------------------
This confidential and proprietary software may be only used as authorized
by a licensing agreement from CrazyBingo.www.cnblogs.com/crazybingo
(C) COPYRIGHT 2012 CrazyBingo. ALL RIGHTS RESERVED
Filename			:		I2C_AR0144_1280720_Config.v
Author				:		CrazyBingo
Date				:		2019-08-03
Version				:		1.0
Description			:		I2C Configure Data of AR0135.
Modification History	:
Date			By			Version			Change Description
===========================================================================
19/08/03		CrazyBingo	1.0				Original
--------------------------------------------------------------------------*/

`timescale 1ns/1ns
module	I2C_AR0135_1280720_Config   //1280*720@60 with AutO/Manual Exposure
(
	input		[7:0]	LUT_INDEX,
	output	reg	[31:0]	LUT_DATA,
	output		[7:0]	LUT_SIZE
);
`define PLL_EN
`define AE_EN

assign	LUT_SIZE = 1'b1 + 8'd23 ;

//-----------------------------------------------------------------
/////////////////////	Config Data LUT	  //////////////////////////	
always@(*)
begin
	case(LUT_INDEX)
//	AR0135 : 1280*720 Gray Config
	0 :		LUT_DATA	=	{16'h3000, 16'h0554};  //Chip Vesion Register
	//Write Data Index   
    1 :     LUT_DATA    =   {16'h301A, 16'h00D9};  //RESET_REGISTER
    2 :     LUT_DATA    =   {16'h0000, 16'h0000};  //DELAY= 200
    3 :     LUT_DATA    =   {16'h301A, 16'h10D8};  //RESET_REGISTER
    
`ifdef  PLL_EN
    4 :     LUT_DATA    =   {16'h302C, 16'h0001};  //VT_SYS_CLK_DIV, 27MHz to 74.25MHz
    5 :     LUT_DATA    =   {16'h302A, 16'h0008};  //VT_PIX_CLK_DIV
    6 :     LUT_DATA    =   {16'h302E, 16'h0002};  //PRE_PLL_CLK_DIV
    7 :     LUT_DATA    =   {16'h3030, 16'h002C};  //PLL_MULTIPLIER
    8 :     LUT_DATA    =   {16'h30B0, 16'h04A0};  //DIGITAL_TEST, enable PLL
    9 :     LUT_DATA    =   {16'h0000, 16'h0000};  //DELAY= 200
`else
    8 :     LUT_DATA    =   {16'h30B0, 16'h44A0};   //DIGITAL_TEST, bypass PLL
    9 :     LUT_DATA    =   {16'h0000, 16'h0000};  //DELAY= 200
`endif
    
    10 :    LUT_DATA    =   {16'h3002, 16'h0078};  //Y_ADDR_START
    11 :    LUT_DATA    =   {16'h3004, 16'h0000};  //X_ADDR_START
    12 :    LUT_DATA    =   {16'h3006, 16'h0347};  //Y_ADDR_END
    13 :    LUT_DATA    =   {16'h3008, 16'h04FF};  //X_ADDR_END
    14 :    LUT_DATA    =   {16'h300A, 16'h02EB};  //FRAME_LENGTH_LINES
    15 :    LUT_DATA    =   {16'h300C, 16'h0672};  //LINE_LENGTH_PCK
    
    16 :    LUT_DATA    =   {16'h30A2, 16'h0001};  //X_ODD_INC
    17 :    LUT_DATA    =   {16'h30A6, 16'h0001};  //Y_ODD_INC
    18 :    LUT_DATA    =   {16'h3040, 16'h8000};  //READ_MODE
    19 :    LUT_DATA    =   {16'h3028, 16'h0010};  //ROW_SPEED
    
    //Manual Gain & Expsoure Parameter
    20 :    LUT_DATA    =   {16'h305E, 16'h0020};   //Global Gain Defalut 0x20
    21 :    LUT_DATA    =   {16'h3012, 16'd960};   //COARSE_INTEGRATION_TIME
   
`ifdef  AE_EN    
    //Register for Auto Exposure
    22 :    LUT_DATA    =   {16'h3100, 16'h0001};  //bit[4]:Auto DG, bit[1]:Auto AG; bit[0]:Auto Exposure
`else
    22 :    LUT_DATA    =   {16'h3100, 16'h0000};  //bit[4]:Auto DG, bit[1]:Auto AG; bit[0]:Auto Exposure
`endif

    23 :    LUT_DATA    =   {16'h301A, 16'h10DC};  //RESET_REGISTER - [0:00:02.440]

	default:LUT_DATA	=	{16'h0000, 16'h0000};
	endcase
end

endmodule

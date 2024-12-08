/*-----------------------------------------------------------------------
                                 \\\|///
                                \\  - -  //
                                (  @ @  )
+-----------------------------oOOo-(_)-oOOo-----------------------------+
CONFIDENTIAL IN CONFIDENCE
This confidential and proprietary software may be only used as authorized
by a licensing agreement from CrazyBingo (Thereturnofbingo).
In the event of publication, the following notice is applicable:
Copyright (C) 2012-20xx CrazyBingo Corporation.
The entire notice above must be reproduced on all authorized copies.
Author                  :       CrazyBingo
Technology blogs 	: 		www.crazyfpga.com
Email Address           :       crazyfpga@qq.com
Filename                :       module  i2c_timing_ctrl_reg16_dat8.v
Data                    :       2013-04-13
Description             :       The testbench of I2C Ctrl timing.
Modification History    :
Data            Author          Version     Change Description
=========================================================================
13/04/13        CrazyBingo      1.0         Original
13/04/14        CrazyBingo      1.1         add i2c_wdata for avoid bit width warming
14/05/13        CrazyBingo      2.0         Change to 16Bit Data module
22/01/28	CrazyBingo	3.0	    Change to 16bit register & 8bit data mode
-------------------------------------------------------------------------
|                                     Oooo                              |
+------------------------------oooO--(   )------------------------------+
                              (   )   ) /
                               \ (   (_/
                                \_)
-----------------------------------------------------------------------*/

`timescale 1ns/1ns
module  i2c_timing_ctrl_reg16_dat8_wronly
#(
    parameter   CLK_FREQ    =   100_000000, //100 MHz
    parameter   I2C_FREQ    =   400_000     //10 KHz(< 400KHz)
)
(
    //global clock
    input               clk,                //100MHz
    input               rst_n,              //system reset
            
    //i2c interface     
    output              i2c_sclk,           //i2c clock
    // inout               i2c_sdat,           //i2c data for bidirection
    input               i2c_sdat_IN,
    output              i2c_sdat_OUT,
    output              i2c_sdat_OE,

    //user interface
    input       [8:0]   i2c_config_size,    //i2c config data counte
    output  reg [8:0]   i2c_config_index,   //i2c config reg index, read 2 reg and write xx reg
    input       [31:0]  i2c_config_data,    //i2c config data
    output              i2c_config_done    //i2c config timing complete
);

//----------------------------------------
//Delay xxus until i2c slave is steady
reg [19:0]  delay_cnt;
//localparam  DELAY_TOP = SIMU_EN ? 20'hff : CLK_FREQ/1000;  //1ms Setting time after software/hardware reset
localparam  DELAY_TOP = CLK_FREQ/1000;  //1ms Setting time after software/hardware reset
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        delay_cnt <= 0;
    else if(delay_cnt < DELAY_TOP)
        delay_cnt <= delay_cnt + 1'b1;
    else
        delay_cnt <= delay_cnt;
end
wire    delay_done = (delay_cnt == DELAY_TOP) ? 1'b1 : 1'b0;    //81us delay


//----------------------------------------
//I2C Control Clock generate
reg [15:0]  clk_cnt;    //divide for i2c clock
/******************************************
             _______          _______
SCLK    ____|       |________|       |
         ________________ ______________
SDAT    |________________|______________
         _                _
CLK_EN  | |______________| |____________
                _                _
CAP_EN  _______| |______________| |_____
*******************************************/
reg i2c_ctrl_clk;       //i2c control clock, H: valid; L: valid
reg i2c_transfer_en;    //send i2c data before, make sure that sdat is steady when i2c_sclk is valid
reg i2c_capture_en;     //capture i2c data  while sdat is steady from cmos              
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        begin
        clk_cnt <= 0;
        i2c_ctrl_clk <= 0;
        i2c_transfer_en <= 0;
        i2c_capture_en <= 0;
        end
    else if(delay_done)
        begin
        if(clk_cnt < (CLK_FREQ/I2C_FREQ) - 1'b1)
            clk_cnt <= clk_cnt + 1'd1;
        else
            clk_cnt <= 0;
        //i2c control clock, H: valid; L: valid
        i2c_ctrl_clk <= ((clk_cnt >= (CLK_FREQ/I2C_FREQ)/4 + 1'b1) &&
                        (clk_cnt < (3*CLK_FREQ/I2C_FREQ)/4 + 1'b1)) ? 1'b1 : 1'b0;
        //send i2c data before, make sure that sdat is steady when i2c_sclk is valid
        i2c_transfer_en <= (clk_cnt == 16'd0) ? 1'b1 : 1'b0;
        //capture i2c data  while sdat is steady from cmos                  
        i2c_capture_en <= (clk_cnt == (2*CLK_FREQ/I2C_FREQ)/4 - 1'b1) ? 1'b1 : 1'b0;
        end
    else
        begin
        clk_cnt <= 0;
        i2c_ctrl_clk <= 0;
        i2c_transfer_en <= 0;
        i2c_capture_en <= 0;
        end
end

//-----------------------------------------
//I2C Timing state Parameter
localparam  I2C_IDLE        =   4'd0;
//Write I2C: {ID_Address, REG_Address, W_REG_Data}
localparam  I2C_WR_START    =   4'd1;
localparam  I2C_WR_IDADDR   =   4'd2;
localparam  I2C_WR_ACK1     =   4'd3;
localparam  I2C_WR_REGADDR1 =   4'd4;
localparam  I2C_WR_ACK2     =   4'd5;
localparam  I2C_WR_REGADDR2 =   4'd6;
localparam  I2C_WR_ACK3     =   4'd7;
localparam  I2C_WR_REGDATA  =   4'd8;
localparam  I2C_WR_ACK4     =   4'd9;
localparam  I2C_WR_STOP     =   4'd10;


//-----------------------------------------
// FSM: always1
reg	[3:0]	current_state, next_state; //i2c write and read state  
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        current_state <= I2C_IDLE;
    else if(i2c_transfer_en)
        current_state <= next_state;
end

                                
//-----------------------------------------
wire    i2c_transfer_end = (current_state == I2C_WR_STOP) ? 1'b1 : 1'b0;
reg     i2c_ack;    //i2c slave renpose successed
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        i2c_config_index <= 0;
    else if(i2c_transfer_en)
        begin
		//	Force always step following. 
		if(i2c_transfer_end)	//	 & ~i2c_ack)
//		if(i2c_transfer_end /*& ~i2c_ack*/)											//Just for test
            begin
            if(i2c_config_index < i2c_config_size)  
                i2c_config_index <= i2c_config_index + 1'b1;
//              i2c_config_index <= {i2c_config_index[7:1], ~i2c_config_index[0]};  //Just for test, Read Only
            else
                i2c_config_index <= i2c_config_size;
            end
        else
            i2c_config_index <= i2c_config_index;
        end
    else
        i2c_config_index <= i2c_config_index;
end
assign  i2c_config_done = (i2c_config_index == i2c_config_size) ? 1'b1 : 1'b0;


//-----------------------------------------
// FSM: always2
reg [3:0]   i2c_stream_cnt; //i2c data bit stream count
always@(*)
begin
    next_state = I2C_IDLE;  //state initialization
    case(current_state)
    I2C_IDLE:       //5'd0
        begin
        if(delay_done == 1'b1)  //1ms Setting time after software/hardware reset    
            begin
            if(i2c_transfer_en)
                begin                
                if(i2c_config_index < i2c_config_size)
                    next_state = I2C_WR_START;  //Write Data to I2C
                else// if(i2c_config_index >= i2c_config_size)
                    next_state = I2C_IDLE;      //Config I2C Complete
					 end
            else
                next_state = next_state;
            end
        else
                next_state = I2C_IDLE;      //Wait I2C Bus is steady
        end
    //Write I2C: {ID_Address, REG_Address, W_REG_Data}
    I2C_WR_START:   
        if(i2c_transfer_en) next_state = I2C_WR_IDADDR;
        else                next_state = I2C_WR_START;
    I2C_WR_IDADDR:  
        if(i2c_transfer_en == 1'b1 && i2c_stream_cnt == 4'd8)   
                            next_state = I2C_WR_ACK1;
        else                next_state = I2C_WR_IDADDR;
    I2C_WR_ACK1:    
        if(i2c_transfer_en) next_state = I2C_WR_REGADDR1;
        else                next_state = I2C_WR_ACK1;        
    I2C_WR_REGADDR1: 
        if(i2c_transfer_en == 1'b1 && i2c_stream_cnt == 4'd8)   
                            next_state = I2C_WR_ACK2;
        else                next_state = I2C_WR_REGADDR1;
    I2C_WR_ACK2:    
        if(i2c_transfer_en) next_state = I2C_WR_REGADDR2;
        else                next_state = I2C_WR_ACK2;
    I2C_WR_REGADDR2: 
        if(i2c_transfer_en == 1'b1 && i2c_stream_cnt == 4'd8)   
                            next_state = I2C_WR_ACK3;
        else                next_state = I2C_WR_REGADDR2;        
    I2C_WR_ACK3:    
        if(i2c_transfer_en) next_state = I2C_WR_REGDATA;
        else                next_state = I2C_WR_ACK3;        
    I2C_WR_REGDATA:    
        if(i2c_transfer_en == 1'b1 && i2c_stream_cnt == 4'd8)   
                            next_state = I2C_WR_ACK4;
        else                next_state = I2C_WR_REGDATA;
    I2C_WR_ACK4:    
        if(i2c_transfer_en) next_state = I2C_WR_STOP;
        else                next_state = I2C_WR_ACK4;

    I2C_WR_STOP:    
        if(i2c_transfer_en) next_state = I2C_IDLE;
        else                next_state = I2C_WR_STOP;

    default:;   //default vaule     
    endcase
end


//-----------------------------------------
// FSM: always3
//reg   i2c_write_flag, i2c_read_flag;
reg i2c_sdat_out;       //i2c data output
//reg   [3:0]   i2c_stream_cnt; //i2c data bit stream count
reg [7:0]   i2c_wdata;  //i2c data prepared to transfer
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        begin
        i2c_sdat_out <= 1'b1;
        i2c_stream_cnt <= 0;
        i2c_wdata <= 0;
        end
    else if(i2c_transfer_en)
        begin
        case(next_state)
        I2C_IDLE:   
            begin
            i2c_sdat_out <= 1'b1;       //idle state
            i2c_stream_cnt <= 0;
            i2c_wdata <= 0;
            end
        //Write I2C: {ID_Address, REG_Address, W_REG_Data}
        I2C_WR_START:   
            begin
            i2c_sdat_out <= 1'b0;
            i2c_stream_cnt <= 0;
            i2c_wdata <= i2c_config_data[31:24];    //ID_Address
            end
        I2C_WR_IDADDR:  
            begin
            i2c_stream_cnt <= i2c_stream_cnt + 1'b1;
            i2c_sdat_out <= i2c_wdata[3'd7 - i2c_stream_cnt];
            end
        I2C_WR_ACK1:    
            begin
            i2c_stream_cnt <= 0;
            i2c_wdata <= i2c_config_data[23:16];        //REG_Address
            end            
        I2C_WR_REGADDR1: 
            begin
            i2c_stream_cnt <= i2c_stream_cnt + 1'b1;
            i2c_sdat_out <= i2c_wdata[3'd7 - i2c_stream_cnt];
            end
        I2C_WR_ACK2:    
            begin
            i2c_stream_cnt <= 0;
            i2c_wdata <= i2c_config_data[15:8];        //REG_Address
            end
        I2C_WR_REGADDR2: 
            begin
            i2c_stream_cnt <= i2c_stream_cnt + 1'b1;
            i2c_sdat_out <= i2c_wdata[3'd7 - i2c_stream_cnt];
            end         
        I2C_WR_ACK3:    
            begin
            i2c_stream_cnt <= 0;
            i2c_wdata <= i2c_config_data[7:0];     //W_REG_Data1
            end            
        I2C_WR_REGDATA:    
            begin
            i2c_stream_cnt <= i2c_stream_cnt + 1'b1;
            i2c_sdat_out <= i2c_wdata[3'd7 - i2c_stream_cnt];
            end
        I2C_WR_ACK4:    
            i2c_stream_cnt <= 0;

        I2C_WR_STOP:    
            i2c_sdat_out <= 1'b0;

        endcase
        end
    else
        begin
        i2c_stream_cnt <= i2c_stream_cnt;
        i2c_sdat_out <= i2c_sdat_out;
        i2c_wdata <= i2c_wdata;
        end
end




//---------------------------------------------
//respone from slave for i2c data transfer
reg i2c_ack1, i2c_ack2, i2c_ack3, i2c_ack4;
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        begin
		{i2c_ack1, i2c_ack2, i2c_ack3, i2c_ack4} <= 4'b1111;
        i2c_ack <= 1'b1;
        end
    else if(i2c_capture_en)
        begin
        case(next_state)
        I2C_IDLE:
        begin
        {i2c_ack1, i2c_ack2, i2c_ack3, i2c_ack4} <= 4'b1111;
        i2c_ack <= 1'b1;
        end
        //Write I2C: {ID_Address, REG_Address, W_REG_Data}
        I2C_WR_ACK1:    i2c_ack1 <= i2c_sdat_IN;
        I2C_WR_ACK2:    i2c_ack2 <= i2c_sdat_IN;
        I2C_WR_ACK3:    i2c_ack3 <= i2c_sdat_IN;
        I2C_WR_ACK4:    i2c_ack4 <= i2c_sdat_IN;
        I2C_WR_STOP:    i2c_ack <= (i2c_ack1 | i2c_ack2 | i2c_ack3);// | i2c_ack4 );

        default:;
        endcase
        end
    else
        begin
        {i2c_ack1, i2c_ack2, i2c_ack3, i2c_ack4} <= {i2c_ack1, i2c_ack2, i2c_ack3, i2c_ack4};
        i2c_ack <= i2c_ack;
        end
end 

//---------------------------------------------------
wire    bir_en =(   current_state == I2C_WR_ACK1 || current_state == I2C_WR_ACK2 || 
	            current_state == I2C_WR_ACK3 || current_state == I2C_WR_ACK4) ? 1'b1 : 1'b0;
assign  i2c_sclk = (current_state >= I2C_WR_IDADDR && current_state <= I2C_WR_ACK4) ? 
                    i2c_ctrl_clk : 1'b1;
//assign  i2c_sdat = (~bir_en) ? i2c_sdat_out : 1'bz;
assign i2c_sdat_OUT = i2c_sdat_out;
assign i2c_sdat_OE = (~rst_n) ? 0 : ~bir_en;


endmodule

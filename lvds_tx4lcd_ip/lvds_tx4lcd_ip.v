module  lvds_tx4lcd_ip  //7bit
(
    input           clk_3x5,
    input           clk,
    input           rst_n,
    input           lcd_vs,
    input           lcd_hs,
    input           lcd_de,
    input   [7:0]   lcd_red,
    input   [7:0]   lcd_green,
    input   [7:0]   lcd_blue,
    
    //lvds tx for lcd output    
    output          lvds_clk_p, 
    output          lvds_clk_n,
    output          lvds_d0_p,
    output          lvds_d0_n,
    output          lvds_d1_p,
    output          lvds_d1_n,
    output          lvds_d2_p,
    output          lvds_d2_n,
    output          lvds_d3_p,
    output          lvds_d3_n
);

//	Data is Msb first. Invert when output. 
wire    [6:0]   DATA0 = {lcd_green[0],  lcd_red[5:0]};
wire    [6:0]   DATA1 = {lcd_blue[1:0], lcd_green[5:1]};
wire    [6:0]   DATA2 = {lcd_de, lcd_vs, lcd_hs,  lcd_blue[5:2]};   //vs hs is reserved
wire    [6:0]   DATA3 = {1'b0, lcd_blue[7:6], lcd_green[7:6], lcd_red[7:6]};


//--------------------------------
//A7 OSERDES for data Init
wire			CLK    = clk_3x5;
wire			CLKDIV = clk;
wire			RST    = ~rst_n;
wire			OE     = 1; 

A7_OSERDES_7bit #(.INV_BITS(1)) u0_PANGO_OSERDES_7bit
(
    .CLK    	(CLK),
    .CLKDIV 	(CLKDIV),
    .RST    	(RST),
    .OE 		(OE), 
		
    .DATA   	(7'b1100011),
    .TX_DATA_p  (lvds_clk_p),
    .TX_DATA_n  (lvds_clk_n)
);

A7_OSERDES_7bit #(.INV_BITS(1)) u1_PANGO_OSERDES_7bit
(
    .CLK    	(CLK),
    .CLKDIV 	(CLKDIV),
    .RST    	(RST),
    .OE 		(OE), 
			
    .DATA   	(DATA0),
    .TX_DATA_p	(lvds_d0_p),
    .TX_DATA_n	(lvds_d0_n)
);
A7_OSERDES_7bit #(.INV_BITS(1)) u2_PANGO_OSERDES_7bit
(
    .CLK    	(CLK),
    .CLKDIV 	(CLKDIV),
    .RST    	(RST),
    .OE 		(OE), 
		
    .DATA   	(DATA1),
    .TX_DATA_p  (lvds_d1_p),
    .TX_DATA_n  (lvds_d1_n)
);
A7_OSERDES_7bit #(.INV_BITS(1)) u3_PANGO_OSERDES_7bit
(
    .CLK    	(CLK),
    .CLKDIV 	(CLKDIV),
    .RST    	(RST),
    .OE 		(OE), 
		
    .DATA   	(DATA2),
    .TX_DATA_p  (lvds_d2_p),
    .TX_DATA_n  (lvds_d2_n)
);
A7_OSERDES_7bit #(.INV_BITS(1)) u4_PANGO_OSERDES_7bit
(
    .CLK    	(CLK),
    .CLKDIV 	(CLKDIV),
    .RST    	(RST),
    .OE 		(OE), 
		
    .DATA   	(DATA3),
    .TX_DATA_p  (lvds_d3_p),
    .TX_DATA_n  (lvds_d3_n)
);

endmodule



				
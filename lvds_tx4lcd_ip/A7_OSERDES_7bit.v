`timescale 1ns / 1ps



module  A7_OSERDES_7bit #(
	parameter 	INV_BITS 	= 0	//	Set to use inverted sequence. 
)(
    input   		CLK,
    input   		CLKDIV,
    input   		RST,
    input 			OE, 
    
    input   [6:0]   DATA,		//	Data. Lsb Out First. 
    output          TX_DATA_p,
    output          TX_DATA_n
);
	
	
	wire 			w_data_o, w_data_t; 
	
	//	Use OUTBUFDS for data_p_o & data_n_o. Note that for Bank R5 we can only use SSTL15_D_I to output. 
	OBUFTDS hdmio_tx (
      .O(TX_DATA_p),     // Diff_p output (connect directly to top-level port)
      .OB(TX_DATA_n),   // Diff_n output (connect directly to top-level port)
      .I(w_data_o),      // Buffer input
      .T(w_data_t)
   );
	

    OSERDESE2 #(
      .DATA_RATE_OQ("SDR"),   // DDR, SDR
      .DATA_RATE_TQ("SDR"),   // DDR, BUF, SDR
      .DATA_WIDTH(7),         // Parallel data width (2-8,10,14)
      .INIT_OQ(1'b0),         // Initial value of OQ output (1'b0,1'b1)
      .INIT_TQ(1'b0),         // Initial value of TQ output (1'b0,1'b1)
      .SERDES_MODE("MASTER"), // MASTER, SLAVE
      .SRVAL_OQ(1'b0),        // OQ output value when SR is used (1'b0,1'b1)
      .SRVAL_TQ(1'b0),        // TQ output value when SR is used (1'b0,1'b1)
      .TBYTE_CTL("FALSE"),    // Enable tristate byte operation (FALSE, TRUE)
      .TBYTE_SRC("FALSE"),    // Tristate byte source (FALSE, TRUE)
      .TRISTATE_WIDTH(1)      // 3-state converter width (1,4)
   )
   hdmio_tx_serializer (
      .OFB(),             // 1-bit output: Feedback path for data
      .OQ(w_data_o),               // 1-bit output: Data path output
      // SHIFTOUT1 / SHIFTOUT2: 1-bit (each) output: Data output expansion (1-bit each)
      .SHIFTOUT1(),
      .SHIFTOUT2(),
      .TBYTEOUT(),   // 1-bit output: Byte group tristate
      .TFB(),             // 1-bit output: 3-state control
      .TQ(w_data_t),               // 1-bit output: 3-state control
      
      .CLK(CLK),             // 1-bit input: High speed clock
      .CLKDIV(CLKDIV),       // 1-bit input: Divided clock
      // D1 - D8: 1-bit (each) input: Parallel data inputs (1-bit each)
      .D1(INV_BITS ? DATA[6] : DATA[0]),
      .D2(INV_BITS ? DATA[5] : DATA[1]),
      .D3(INV_BITS ? DATA[4] : DATA[2]),
      .D4(INV_BITS ? DATA[3] : DATA[3]),
      .D5(INV_BITS ? DATA[2] : DATA[4]),
      .D6(INV_BITS ? DATA[1] : DATA[5]),
      .D7(INV_BITS ? DATA[0] : DATA[6]),
      .D8(),
      .OCE(1'b1),             // 1-bit input: Output data clock enable
      .RST(RST),             // 1-bit input: Reset
      // SHIFTIN1 / SHIFTIN2: 1-bit (each) input: Data input expansion (1-bit each)
      .SHIFTIN1(),
      .SHIFTIN2(),
      // T1 - T4: 1-bit (each) input: Parallel 3-state inputs
      .T1(~OE),
      .T2(),
      .T3(),
      .T4(),
      .TBYTEIN(),     // 1-bit input: Byte group tristate
      .TCE(1'b1)              // 1-bit input: 3-state clock enable
   );


endmodule


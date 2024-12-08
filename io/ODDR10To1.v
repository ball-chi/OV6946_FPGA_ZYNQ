`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 23:16:32 05/11/2023 
// Module Name: ODDR10To1
//////////////////////////////////////////////////////////////////////////////////
module ODDR10To1 #(
	parameter 	ENABLE_TDATA_IN 	= 0
)(
	input 			clkx_i,
	input 			clk_i,
	input 			rst_i, 
	input 			oe_i, 	//	Output Enable. 
	
	//	Input
	input 	[9:0] 	data_i,	//	Lsb Output First.
	
	//	Output
	output 			data_p_o,
	output 			data_n_o

);
	
	wire 	[1:0] 	w_cascade; 
	wire 			w_data_o, w_data_t; 
	
	//	Use OUTBUFDS for data_p_o & data_n_o. 
	OBUFTDS hdmio_txc (.O(data_p_o), .OB(data_n_o), .I(w_data_o), .T(w_data_t));
	
	//reg 			r_clk_i = 0; 
	//reg 			r_clkx_i = 0; 
	//always @(posedge clk_i) #0.1 r_clk_i <= ~r_clk_i; 
	//always @(posedge clkx_i) begin
	//	#0.05 r_clkx_i <= r_clk_i; 
	//end
	//wire 			w_upd_shift = (r_clk_i != r_clkx_i); 
	//reg 			r_upd_shift = 0; 
	//always @(posedge clkx_i) begin
	//	r_upd_shift <= w_upd_shift; 
	//end

    OSERDESE2 #(
      .DATA_RATE_OQ("DDR"),   // DDR, SDR
      .DATA_RATE_TQ("SDR"),   // DDR, BUF, SDR
      .DATA_WIDTH(10),         // Parallel data width (2-8,10,14)
      .INIT_OQ(1'b0),         // Initial value of OQ output (1'b0,1'b1)
      .INIT_TQ(1'b0),         // Initial value of TQ output (1'b0,1'b1)
      .SERDES_MODE("MASTER"), // MASTER, SLAVE
      .SRVAL_OQ(1'b0),        // OQ output value when SR is used (1'b0,1'b1)
      .SRVAL_TQ(1'b0),        // TQ output value when SR is used (1'b0,1'b1)
      .TBYTE_CTL("FALSE"),    // Enable tristate byte operation (FALSE, TRUE)
      .TBYTE_SRC("FALSE"),    // Tristate byte source (FALSE, TRUE)
      .TRISTATE_WIDTH(1)      // 3-state converter width (1,4)
   )
   oserdes_master (
      .OFB(),             // 1-bit output: Feedback path for data
      .OQ(w_data_o),               // 1-bit output: Data path output
      // SHIFTOUT1 / SHIFTOUT2: 1-bit (each) output: Data output expansion (1-bit each)
      .SHIFTOUT1(),
      .SHIFTOUT2(),
      .TBYTEOUT(),   // 1-bit output: Byte group tristate
      .TFB(),             // 1-bit output: 3-state control
      .TQ(w_data_t),               // 1-bit output: 3-state control
      
      .CLK(clkx_i),             // 1-bit input: High speed clock
      .CLKDIV(clk_i),       // 1-bit input: Divided clock
      // D1 - D8: 1-bit (each) input: Parallel data inputs (1-bit each)
      .D1(data_i[0]),
      .D2(data_i[1]),
      .D3(data_i[2]),
      .D4(data_i[3]),
      .D5(data_i[4]),
      .D6(data_i[5]),
      .D7(data_i[6]),
      .D8(data_i[7]),
      .OCE(1'b1),             // 1-bit input: Output data clock enable
      .RST(rst_i),             // 1-bit input: Reset
      // SHIFTIN1 / SHIFTIN2: 1-bit (each) input: Data input expansion (1-bit each)
      .SHIFTIN1(w_cascade[0]),
      .SHIFTIN2(w_cascade[1]),
      // T1 - T4: 1-bit (each) input: Parallel 3-state inputs
      .T1(~oe_i),
      .T2(),
      .T3(),
      .T4(),
      .TBYTEIN(),     // 1-bit input: Byte group tristate
      .TCE(1'b1)              // 1-bit input: 3-state clock enable
   );

    OSERDESE2 #(
      .DATA_RATE_OQ("DDR"),   // DDR, SDR
      .DATA_RATE_TQ("SDR"),   // DDR, BUF, SDR
      .DATA_WIDTH(10),         // Parallel data width (2-8,10,14)
      .INIT_OQ(1'b0),         // Initial value of OQ output (1'b0,1'b1)
      .INIT_TQ(1'b0),         // Initial value of TQ output (1'b0,1'b1)
      .SERDES_MODE("SLAVE"), // MASTER, SLAVE
      .SRVAL_OQ(1'b0),        // OQ output value when SR is used (1'b0,1'b1)
      .SRVAL_TQ(1'b0),        // TQ output value when SR is used (1'b0,1'b1)
      .TBYTE_CTL("FALSE"),    // Enable tristate byte operation (FALSE, TRUE)
      .TBYTE_SRC("FALSE"),    // Tristate byte source (FALSE, TRUE)
      .TRISTATE_WIDTH(1)      // 3-state converter width (1,4)
   )
   oserdes_slave (
      .OFB(),             // 1-bit output: Feedback path for data
      .OQ(),               // 1-bit output: Data path output
      // SHIFTOUT1 / SHIFTOUT2: 1-bit (each) output: Data output expansion (1-bit each)
      .SHIFTOUT1(w_cascade[0]),
      .SHIFTOUT2(w_cascade[1]),
      .TBYTEOUT(),   // 1-bit output: Byte group tristate
      .TFB(),             // 1-bit output: 3-state control
      .TQ(),               // 1-bit output: 3-state control
      
      .CLK(clkx_i),             // 1-bit input: High speed clock
      .CLKDIV(clk_i),       // 1-bit input: Divided clock
      // D1 - D8: 1-bit (each) input: Parallel data inputs (1-bit each)
      .D1(),
      .D2(),
      .D3(data_i[8]),
      .D4(data_i[9]),
      .D5(),
      .D6(),
      .D7(),
      .D8(),
      .OCE(1'b1),             // 1-bit input: Output data clock enable
      .RST(rst_i),             // 1-bit input: Reset
      // SHIFTIN1 / SHIFTIN2: 1-bit (each) input: Data input expansion (1-bit each)
      .SHIFTIN1(),
      .SHIFTIN2(),
      // T1 - T4: 1-bit (each) input: Parallel 3-state inputs
      .T1(),
      .T2(),
      .T3(),
      .T4(),
      .TBYTEIN(),     // 1-bit input: Byte group tristate
      .TCE()              // 1-bit input: 3-state clock enable
   );

	
	
	
endmodule

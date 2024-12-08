//  by CrazyBird
module Line_Shift_RAM_8Bit
#(
    parameter DATA_WIDTH = 8    ,
    parameter ADDR_WIDTH = 11   ,
    parameter DATA_DEPTH = 1280 ,
    parameter DELAY_NUM  = 0
)(
    input  wire                     clk     ,
    input  wire                     rst_n   ,
    input  wire                     clken   ,
    input  wire [DATA_WIDTH-1:0]    din     ,   
    output wire [DATA_WIDTH-1:0]    dout    
);
//----------------------------------------------------------------------
localparam BRAM_DEPTH = DATA_DEPTH + 1;
localparam INIT_ADDR  = DATA_DEPTH - DELAY_NUM;

//----------------------------------------------------------------------
reg             [ADDR_WIDTH-1:0]    bram_waddr;
reg             [ADDR_WIDTH-1:0]    bram_raddr;

always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
    begin
        bram_waddr <= INIT_ADDR;
        bram_raddr <= 0;
    end
    else
    begin
        if(clken == 1'b1)
        begin
            if(bram_waddr < DATA_DEPTH)
                bram_waddr <= bram_waddr + 1'b1;
            else
                bram_waddr <= 0;
            if(bram_raddr < DATA_DEPTH)
                bram_raddr <= bram_raddr + 1'b1;
            else
                bram_raddr <= 0;
        end
        else
        begin
            bram_waddr <= bram_waddr;
            bram_raddr <= bram_raddr;
        end
    end
end




//----------------------------------------------------------------------
wire            [DATA_WIDTH-1:0]    bram_wdata;
wire                                bram_wenb;
reg            [DATA_WIDTH-1:0]    bram_rdata;

assign bram_wdata = din;
assign bram_wenb  = clken;


localparam ADDR_MSB = 2 ** ADDR_WIDTH - 1; 
reg 	[DATA_WIDTH-1:0] 	r_ram[ADDR_MSB:0]; 

always @(posedge clk) begin
	if(bram_wenb) begin
		r_ram[bram_waddr] <= bram_wdata; 
	end else begin
	end
end
always @(posedge clk) begin
	bram_rdata <= r_ram[bram_raddr]; 
end

//shift_reg_bram
//#(
//    .DATA_WIDTH_A   (DATA_WIDTH ),
//    .ADDR_WIDTH_A   (ADDR_WIDTH ),
//    .DATA_DEPTH_A   (BRAM_DEPTH ),
//    .DATA_WIDTH_B   (DATA_WIDTH ),
//    .ADDR_WIDTH_B   (ADDR_WIDTH ),
//    .DATA_DEPTH_B   (BRAM_DEPTH )
//)
//u_shift_reg_bram
//( 
//    .clka   (clk        ),
//    .addra  (bram_waddr ),
//    .dia    (bram_wdata ),
//    .cea    (bram_wenb  ),
//    
//    .clkb   (clk        ),
//    .addrb  (bram_raddr ),
//    .ceb    (1'b1       ),
//    .dob    (bram_rdata )
//);

assign dout = bram_rdata;

endmodule

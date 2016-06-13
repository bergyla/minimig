// spi_master for testbench use

`define NUM_CHANNELS 4

module sim_spi_master (
    input   clk,
    input   [31:0] data_i,
    output  reg [31:0] data_o,
    input   send,
    input   [`NUM_CHANNELS-1:0] cs_i,
    output  [`NUM_CHANNELS-1:0] _cs_o,
    output  mosi_o,
    output  sclk_o,
    input  miso_i,
    output  ready
);

reg sendr;
reg [5:0] i = 5'h0;
reg [`NUM_CHANNELS-1:0] cs;

always @ (posedge clk) begin
    sendr <= send;
    cs <= `NUM_CHANNELS'h0;
    if (i == 47) i <= 0;
    if (send & ~sendr) begin
        i <= 1;
        cs <= cs_i;
        //data_o[31-i] <= miso_i;
    end
    else if (i != 0) begin
        i <= i+1;
        cs <= cs_i;
        if (i > 15) data_o[47-i] <= miso_i;
    end
        
end

assign _cs_o = (send & ~sendr) ? ~cs_i : ~cs;
assign ready = &_cs_o;
assign mosi_o = data_i[31-i[4:0]];
assign sclk_o = clk;

endmodule

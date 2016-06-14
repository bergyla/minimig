// spi_master for testbench use

`define NUM_CHANNELS 4

module sim_spi_master (
    input   clk,
    input   [79:0] data_i,
    output  reg [31:0] data_o,
    input   send,
    input   first_packet,
    input   last_packet,
    input   [3:0] num_bytes,
    input   [`NUM_CHANNELS-1:0] cs_i,
    output  [`NUM_CHANNELS-1:0] _cs_o,
    output  mosi_o,
    output  sclk_o,
    input   miso_i,
    output  ready
);

reg sendr;
reg [6:0] i = 6'h0;
reg [`NUM_CHANNELS-1:0] cs;

always @ (posedge clk) begin
    sendr <= send;
    cs <= `NUM_CHANNELS'h0;
    if (i == ((num_bytes << 3)-1)) i <= 0;
    if (send & ~sendr) begin
        i <= 1;
        cs <= cs_i;
        //data_o[31-i] <= miso_i;
    end
    else if ( i < ((num_bytes << 3)-1) & i != 0) begin
        i <= i+1;
        cs <= cs_i;
        if ( i > (num_bytes << 3 ) -40 -1) data_o[(num_bytes << 3 ) -1 -i] <= miso_i;
    end
        
end

assign _cs_o = (send & ~sendr) ? ~cs_i : ~cs;
assign ready = &_cs_o;
assign mosi_o = data_i[79-i[6:0]];
assign sclk_o = clk | ready;

endmodule

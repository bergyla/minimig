`define SPI_NOM 8'h00
`define SPI_RESET_CONTR 8'h08
`define SPI_CLOCK_CONTR 8'h18
`define SPI_OSD_CONTR 8'h28
`define SPI_CHIP_CONF 8'h04
`define SPI_CPU_CONF 8'h14
`define SPI_MEM_CONF 8'h24
`define SPI_VID_CONF 8'h34
`define SPI_FLOPPY_CONF 8'h44
`define SPI_HDD_CONF 8'h54
`define SPI_JOY_CONF 8'h64
`define SPI_WR_OSD 8'h0C
`define SPI_WR_MEM 8'h1C
`define SPI_VERSION 8'h88

// OSD SPI commands
//
// 8'b0_000_0000 NOP
// write regs
// 8'b0_000_1000 | XXXXXRBC || reset control   | R - reset, B - reset to bootloader, C - reset control block
// 8'b0_001_1000 | XXXXXXXX || clock control   | unused
// 8'b0_010_1000 | XXXXXXKE || osd control     | K - disable Amiga keyboard, E - enable OSD
// 8'b0_000_0100 | XXXXEANT || chipset config  | E - ECS, A - OCS A1000, N - NTSC, T - turbo
// 8'b0_001_0100 | XXXXXSTT || cpu config      | S - CPU speed, TT - CPU type (00=68k, 01=68k10, 10=68k20)
// 8'b0_010_0100 | XXFFSSCC || memory config   | FF - fast, CC - chip, SS - slow
// 8'b0_011_0100 | XXHHLLSS || video config    | HH - hires interp. filter, LL - lowres interp. filter, SS - scanline mode
// 8'b0_100_0100 | XXXXXFFS || floppy config   | FF - drive number, S - floppy speed
// 8'b0_101_0100 | XXXXXSMC || harddisk config | S - enable slave HDD, M - enable master HDD, C - enable HDD controler
// 8'b0_110_0100 | XXXXXXAA || joystick config | AA - autofire rate
// 8'b0_000_1100 | XXXXXAAA_AAAAAAAA B,B,... || write OSD buffer, AAAAAAAAAAA - 11bit OSD buffer address, B - variable number of bytes
// 8'b0_001_1100 | A_A_A_A B,B,... || write system memory, A - 32 bit memory address, B - variable number of bytes
// 8'b1_000_1000 read RTL version

`define SELCIA          // cpu_address_int[23:20]==4'b1011 ? 1'b1 : 1'b0;
`define CIAA            // sel_cia_a = sel_cia & ~cpu_address_int[12];
`define CIAB            // sel_cia_b = sel_cia & ~cpu_address_int[13];

// sel_reg = cpu_address_int[23:21]==3'b110 ? ~(sel_xram | sel_rtc | sel_ide | sel_gayle) : 1'b0;		//chip registers at $DF0000 - $DFFFFF
// sel_rtc = (cpu_address_int[23:16]==8'b1101_1100) ? 1'b1 : 1'b0;   //RTC registers at $DC0000 - $DCFFFF
// sel_gayle = hdc_ena && cpu_address_int[23:12]==12'b1101_1110_0001 ? 1'b1 : 1'b0;		//GAYLE registers at $DE1000 - $DE1FFF
// sel_ide = hdc_ena && cpu_address_int[23:16]==8'b1101_1010 ? 1'b1 : 1'b0;		//IDE registers at $DA0000 - $DAFFFF

// 512kb extra rom area at $e0 and $f0 write able only at a1k chipset mode
//assign t_sel_slow[2] = (cpu_address_int[23:19]==5'b1110_0 || cpu_address_int[23:19]==5'b1111_0) && (a1k | cpu_rd) ? 1'b1 : 1'b0; //$E00000 - $E7FFFF & $F00000 - $F7FFFF

// assign dbs = cpu_address_int[23:21]==3'b000 || cpu_address_int[23:20]==4'b1100 || cpu_address_int[23:19]==5'b1101_0 || cpu_address_int[23:16]==8'b1101_1111 ? 1'b1 : 1'b0;

// assign t_sel_slow[0] = cpu_address_int[23:19]==5'b1100_0 ? 1'b1 : 1'b0; //$C00000 - $C7FFFF
// assign t_sel_slow[1] = cpu_address_int[23:19]==5'b1100_1 ? 1'b1 : 1'b0; //$C80000 - $CFFFFF
// assign t_sel_slow[2] = cpu_address_int[23:19]==5'b1101_0 ? 1'b1 : 1'b0; //$D00000 - $D7FFFF

// 		sel_kick    = (cpu_address_int[23:19]==5'b1111_1 && (cpu_rd || cpu_hlt)) || (cpu_rd && ovl && cpu_address_int[23:19]==5'b0000_0) ? 1'b1 : 1'b0; //$F80000 - $FFFFF
//    sel_kick1mb = (cpu_address_int[23:19]==5'b1110_0 && (cpu_rd || cpu_hlt)) ? 1'b1 : 1'b0; // $E00000 - $E7FFFF